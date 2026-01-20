#!/usr/bin/env python3
import rospy
import json
import sqlite3
import os
import rospkg
from std_msgs.msg import String

# WICHTIG: Import der Message-Typen der Navigation-Gruppe
# Das Paket 'movement_api' muss in deinem Workspace kompiliert sein!
from movement_api.msg import TargetPose

class PoiMiddlewareNode:
    def __init__(self):
        rospy.init_node('poi_middleware_node')
        
        # --- 1. KONFIGURATION (Topics) ---
        # INPUT: Auf welchem Topic sendet Directions das JSON?
        # Standardannahme: /directions/json_output (Muss mit Directions-Team abgestimmt werden)
        self.sub_topic = rospy.get_param('~input_topic', '/directions/json_output')
        
        # OUTPUT: Wohin senden wir den Fahrbefehl?
        # Laut 'movement_node.py' ist der Standard: /navbot/target_pose
        self.pub_topic = rospy.get_param('~output_topic', '/navbot/target_pose')

        # --- 2. DATENBANK VERBINDUNG ---
        rospack = rospkg.RosPack()
        try:
            pkg_path = rospack.get_path('point_navigator')
            # Pfad: point_navigator/db/team_POI/PSEdb.db
            self.db_path = os.path.join(pkg_path, 'db', 'team_POI', 'PSEdb.db')
            
            # check_same_thread=False ist nötig für ROS Callbacks
            self.conn = sqlite3.connect(self.db_path, check_same_thread=False)
            self.conn.row_factory = sqlite3.Row # Zugriff über Spaltennamen
            self.cursor = self.conn.cursor()
            rospy.loginfo(f"✅ [Middleware] DB verbunden: {self.db_path}")
        except Exception as e:
            rospy.logerr(f"❌ [Middleware] Datenbank-Fehler: {e}")
            # Ohne DB macht der Node keinen Sinn -> Shutdown
            rospy.signal_shutdown("Keine Datenbank")
            return

        # --- 3. ROS SETUP ---
        # Publisher (Sendet an Navigation)
        self.pub = rospy.Publisher(self.pub_topic, TargetPose, queue_size=10)
        
        # Subscriber (Hört auf Directions)
        self.sub = rospy.Subscriber(self.sub_topic, String, self.callback)
        
        rospy.loginfo("--- POI MIDDLEWARE BEREIT ---")
        rospy.loginfo(f"👂 Höre auf JSON von: {self.sub_topic}")
        rospy.loginfo(f"🗣️ Sende TargetPose an: {self.pub_topic}")

    def callback(self, msg):
        """
        Wird aufgerufen, wenn Directions eine Nachricht sendet.
        Format: String mit JSON-Inhalt.
        """
        try:
            # A. JSON Parsen
            raw_json = msg.data
            rospy.loginfo(f"📥 [Input] JSON empfangen: {raw_json}")
            
            data_obj = json.loads(raw_json)
            
            # B. Erfolg prüfen (Laut Directions Logic: status='success')
            if data_obj.get('status') != 'success':
                rospy.logwarn(f"Ignoriere Nachricht (Status: {data_obj.get('status')})")
                return

            # C. Raum-ID extrahieren
            # Struktur: {"data": {"room_found": "4.05", ...}}
            target_id = data_obj.get('data', {}).get('room_found')
            
            if not target_id:
                rospy.logwarn("JSON enthält kein 'room_found' Feld!")
                return

            rospy.loginfo(f"🔍 [DB] Suche Koordinaten für: {target_id}")

            # D. Datenbankabfrage
            coords = self.get_coords_from_db(target_id)

            if coords:
                x, y = coords
                rospy.loginfo(f"✅ [Gefunden] X={x}, Y={y}. Sende an Navigation...")
                
                # E. TargetPose Nachricht erstellen (für movement_api)
                nav_msg = TargetPose()
                nav_msg.header.stamp = rospy.Time.now()
                nav_msg.header.frame_id = "map" # Wichtig für Navigation!
                
                nav_msg.target_id = str(target_id)
                nav_msg.x = float(x)
                nav_msg.y = float(y)
                nav_msg.yaw = 0.0 # Standard-Ausrichtung (Blick nach vorne)
                
                # F. Abschicken
                self.pub.publish(nav_msg)
            else:
                rospy.logerr(f"❌ Raum '{target_id}' laut Directions gefunden, aber KEINE Koordinaten in unserer DB!")

        except json.JSONDecodeError:
            rospy.logerr("Fehler: Empfangene Nachricht war kein gültiges JSON.")
        except Exception as e:
            rospy.logerr(f"Kritischer Fehler bei Verarbeitung: {e}")

    def get_coords_from_db(self, target):
        """Intelligente Suche: Probiert verschiedene Schreibweisen"""
        
        # Liste aller Varianten, die wir probieren (basierend auf "1.30")
        candidates = [
            target,                 # "1.30"
            f"%{target}%",          # Irgendwas mit "1.30" (z.B. "Raum 1.30")
            f"B {target}",          # "B 1.30"
            f"B.{target}",          # "B.1.30"
            f"B{target}",           # "B1.30"
            target.replace(".", "") # "130" (falls ohne Punkt gespeichert)
        ]

        try:
            # 1. VERSUCH: ROOM Tabelle
            # Wir loopen durch alle Kandidaten, bis einer passt
            for candidate in candidates:
                query_room = """
                    SELECT p.x, p.y, r.room_name, r.room_id
                    FROM room r
                    JOIN wing w ON r.wing_id = w.wing_id
                    JOIN points p ON w.point_id = p.point_id
                    WHERE r.room_name LIKE ? OR r.room_id LIKE ?
                """
                self.cursor.execute(query_room, (candidate, candidate))
                row = self.cursor.fetchone()
                
                if row: 
                    rospy.loginfo(f"✅ Treffer für '{candidate}': {row['room_name']} (ID: {row['room_id']})")
                    return (row['x'], row['y'])

            # 2. VERSUCH: POINTS Tabelle (z.B. "Kaffee")
            # Auch hier unscharfe Suche mit %
            query_point = "SELECT x, y, name FROM points WHERE name LIKE ?"
            self.cursor.execute(query_point, (f"%{target}%",))
            row = self.cursor.fetchone()
            
            if row: 
                rospy.loginfo(f"✅ Treffer in Points: {row['name']}")
                return (row['x'], row['y'])
            
            return None

        except Exception as e:
            rospy.logerr(f"SQL Fehler: {e}")
            return None

    def __del__(self):
        if hasattr(self, 'conn') and self.conn:
            self.conn.close()

if __name__ == '__main__':
    try:
        PoiMiddlewareNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass