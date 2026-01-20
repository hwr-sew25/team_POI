#!/usr/bin/env python3
import rospy
import json
import sqlite3
import os
import rospkg
from std_msgs.msg import String
from movement_api.msg import TargetPose

class PoiMiddlewareNode:
    def __init__(self):
        rospy.init_node('poi_middleware_node')
        
        # --- KONFIGURATION ---
        self.sub_topic_speech = rospy.get_param('~speech_topic', '/directions/json_output')
        self.sub_topic_display = rospy.get_param('~display_topic', '/display/current_screen')
        self.pub_topic = rospy.get_param('~output_topic', '/navbot/target_pose')

        # --- DB SETUP ---
        rospack = rospkg.RosPack()
        pkg_path = rospack.get_path('point_navigator')
        self.db_path = os.path.join(pkg_path, 'db', 'team_POI', 'PSEdb.db')
        
        try:
            self.conn = sqlite3.connect(self.db_path, check_same_thread=False)
            self.conn.row_factory = sqlite3.Row
            self.cursor = self.conn.cursor()
            rospy.loginfo(f" DB verbunden: {self.db_path}")
        except Exception as e:
            rospy.logerr(f" DB Fehler: {e}")
            rospy.signal_shutdown("Keine DB")
            return

        # --- ROS SETUP ---
        self.pub = rospy.Publisher(self.pub_topic, TargetPose, queue_size=10)
        self.sub_speech = rospy.Subscriber(self.sub_topic_speech, String, self.callback_speech)
        self.sub_display = rospy.Subscriber(self.sub_topic_display, String, self.callback_display)
        
        rospy.loginfo("--- POI MIDDLEWARE BEREIT (Clean Version) ---")
        rospy.loginfo(f" Höre auf Sprache: {self.sub_topic_speech}")
        rospy.loginfo(f" Höre auf Display: {self.sub_topic_display}")

    def callback_speech(self, msg):
        """Verarbeitet JSON von der Sprachsteuerung"""
        try:
            data = json.loads(msg.data)
            if data.get('status') == 'success':
                target = data.get('data', {}).get('room_found')
                if target:
                    self.process_navigation_request(target, source="Speech")
        except Exception as e:
            rospy.logerr(f"Fehler Sprache: {e}")

    def callback_display(self, msg):
        """
        Verarbeitet Screen-Wechsel.
        Input: z.B. 'kaffeeautomat' oder 'index'
        """
        screen_name = msg.data.lower().strip()
        
        # Diese Screens ignorieren wir, da sie keine Fahrziele sind
        ignore_screens = ["index", "raumwahl", "karten_ausgabe", "error_tec", "error_route", "karten_validierung", "bildungsangebote"]
        
        if screen_name in ignore_screens:
            return

        rospy.loginfo(f" [Display] Screen: '{screen_name}' -> Suche in DB...")
        
        # OHNE TRICK: Wir suchen exakt nach dem, was das Display sendet
        self.process_navigation_request(screen_name, source="Display")

    def process_navigation_request(self, target, source):
        rospy.loginfo(f" [{source}] Suche Koordinaten für: {target}")
        coords = self.get_coords_from_db(target)

        if coords:
            x, y = coords
            rospy.loginfo(f" [{source}] Gefunden! Sende: X={x}, Y={y}")
            
            nav_msg = TargetPose()
            nav_msg.header.stamp = rospy.Time.now()
            nav_msg.header.frame_id = "map"
            nav_msg.target_id = str(target)
            nav_msg.x = float(x)
            nav_msg.y = float(y)
            nav_msg.yaw = 0.0
            
            self.pub.publish(nav_msg)
        else:
            # WICHTIG: Wenn hier eine Warnung kommt, fehlt der Eintrag in der DB!
            rospy.logwarn(f" [{source}] Ziel '{target}' NICHT gefunden! Bitte DB prüfen.")

    def get_coords_from_db(self, target):
        """
        Sucht in Room- und Points-Tabelle.
        Versucht exakte Matches und Teil-Matches (Wildcards).
        """
        clean_target = target.replace(" ", "").strip()
        
        # Such-Kandidaten: 
        # 1. Exakt ("kaffeeautomat")
        # 2. Teil-Wort ("%kaffeeautomat%") -> Findet "Der Kaffeeautomat"
        candidates = [target, f"%{target}%", clean_target, f"%{clean_target}%"]

        try:
            # A. Suche in Tabelle ROOM
            for candidate in candidates:
                query = """SELECT p.x, p.y FROM room r 
                           JOIN wing w ON r.wing_id = w.wing_id 
                           JOIN points p ON w.point_id = p.point_id 
                           WHERE r.room_id LIKE ? OR r.room_name LIKE ?"""
                self.cursor.execute(query, (candidate, candidate))
                row = self.cursor.fetchone()
                if row: return (row['x'], row['y'])

            # B. Suche in Tabelle POINTS (Wichtig für POIs wie Kaffee, WC etc.)
            for candidate in candidates:
                # Sucht nach Namen in der 'points' Tabelle
                self.cursor.execute("SELECT x, y FROM points WHERE name LIKE ?", (candidate,))
                row = self.cursor.fetchone()
                if row: return (row['x'], row['y'])
                
            return None
        except Exception as e:
            rospy.logerr(f"SQL Fehler: {e}")
            return None

if __name__ == '__main__':
    PoiMiddlewareNode()
    rospy.spin()