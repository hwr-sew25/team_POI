#!/usr/bin/env python3
import rospy
import sqlite3
import os
import rospkg
from point_navigator.srv import GetPoiInfo, GetPoiInfoResponse
from diagnostic_msgs.msg import KeyValue

class PoiServiceNode:
    def __init__(self):
        rospy.init_node('poi_database_service')
        
        rospack = rospkg.RosPack()
        package_path = rospack.get_path('point_navigator')
        self.db_path = os.path.join(package_path, 'db', 'team_POI', 'PSEdb.db')
        
        rospy.loginfo(f"Datenbank: {self.db_path}")
        
        # --- TURBO FIX 1: Verbindung EINMAL öffnen und offen halten ---
        # check_same_thread=False ist nötig, da ROS Callbacks in Threads laufen
        try:
            self.conn = sqlite3.connect(self.db_path, check_same_thread=False)
            self.cursor = self.conn.cursor()
            rospy.loginfo("--- POI SERVICE (TURBO MODE) BEREIT ---")
        except Exception as e:
            rospy.logerr(f"Konnte DB nicht öffnen: {e}")
            self.conn = None

        self.service = rospy.Service('get_poi_info', GetPoiInfo, self.handle_request)

    def handle_request(self, req):
        target = req.name.strip()
        # Nur loggen, wenn wirklich nötig (spart Zeit im Terminal)
        # rospy.loginfo(f"Suche: '{target}'") 
        
        res = GetPoiInfoResponse()
        res.attributes = []

        if not self.conn:
            res.success = False
            res.message = "DB Connection Error"
            return res

        try:
            # 1. POI CHECK
            query_poi = """
                SELECT p.point_id, p.name, p.x, p.y, p.z, poi.descriptionGER, poi.descriptionENG
                FROM poi
                JOIN points p ON poi.poi_id = p.point_id
                WHERE p.name = ?
            """
            self.cursor.execute(query_poi, (target,))
            row = self.cursor.fetchone()

            if row:
                res.success = True
                res.message = "Found in POI"
                self.fill_attributes(res, row, poi=True)
                return res

            # 2. ROOM CHECK
            query_room = """
                SELECT r.room_id, r.room_name, r.category, r.floor, r.side, p.x, p.y, p.z
                FROM room r
                LEFT JOIN wing w ON r.wing_id = w.wing_id
                LEFT JOIN points p ON w.point_id = p.point_id
                WHERE r.room_name = ? OR r.room_id = ?
            """
            self.cursor.execute(query_room, (target, target))
            row = self.cursor.fetchone()

            if row:
                res.success = True
                res.message = "Found in Room"
                # Manuelles Mapping für Room
                res.attributes.append(KeyValue("room_id", str(row[0])))
                res.attributes.append(KeyValue("room_name", str(row[1] if row[1] else "")))
                res.attributes.append(KeyValue("category", str(row[2] if row[2] else "")))
                # Koordinaten sicher umwandeln
                x = str(row[5]) if row[5] is not None else "0.0"
                y = str(row[6]) if row[6] is not None else "0.0"
                z = str(row[7]) if row[7] is not None else "0.0"
                res.attributes.append(KeyValue("x", x))
                res.attributes.append(KeyValue("y", y))
                res.attributes.append(KeyValue("z", z))
                return res

            # 3. WING CHECK
            query_wing = """
                SELECT w.wing, p.x, p.y, p.z
                FROM wing w
                JOIN points p ON w.point_id = p.point_id
                WHERE p.name = ?
            """
            self.cursor.execute(query_wing, (target,))
            row = self.cursor.fetchone()

            if row:
                res.success = True
                res.message = "Found in Wing"
                res.attributes.append(KeyValue("wing", str(row[0])))
                res.attributes.append(KeyValue("x", str(row[1])))
                res.attributes.append(KeyValue("y", str(row[2])))
                res.attributes.append(KeyValue("z", str(row[3])))
                return res

            # 4. POINT CHECK
            query_point = "SELECT point_id, name, x, y, z FROM points WHERE name = ?"
            self.cursor.execute(query_point, (target,))
            row = self.cursor.fetchone()

            if row:
                res.success = True
                res.message = "Found in Points"
                res.attributes.append(KeyValue("point_id", str(row[0])))
                res.attributes.append(KeyValue("name", str(row[1])))
                res.attributes.append(KeyValue("x", str(row[2])))
                res.attributes.append(KeyValue("y", str(row[3])))
                res.attributes.append(KeyValue("z", str(row[4])))
                return res

            # NICHTS GEFUNDEN
            res.success = False
            res.message = "Not found"
            
            # --- TURBO FIX 2: Keine riesigen Logs mehr! ---
            # Wir drucken NICHT mehr alle Räume aus, das war der Bremsklotz.
            # ropsy.logwarn(f"DEBUG: '{target}' nicht gefunden.") 
            
            return res

        except Exception as e:
            res.success = False
            res.message = str(e)
            rospy.logerr(f"SQL Error: {e}")
            return res

    def fill_attributes(self, res, row, poi=False):
        # Hilfsfunktion um Code zu sparen
        if poi:
            res.attributes.append(KeyValue("id", str(row[0])))
            res.attributes.append(KeyValue("name", str(row[1])))
            res.attributes.append(KeyValue("x", str(row[2])))
            res.attributes.append(KeyValue("y", str(row[3])))
            res.attributes.append(KeyValue("z", str(row[4])))
            res.attributes.append(KeyValue("descriptionGER", row[5] if row[5] else ""))
            res.attributes.append(KeyValue("descriptionENG", row[6] if row[6] else ""))

    def __del__(self):
        # Verbindung schließen, wenn der Node beendet wird
        if self.conn:
            self.conn.close()

if __name__ == "__main__":
    try:
        PoiServiceNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

    
# #!/usr/bin/env python3
# import rospy
# import sqlite3
# import os
# import rospkg
# from point_navigator.srv import GetPoiInfo, GetPoiInfoResponse
# from diagnostic_msgs.msg import KeyValue

# class PoiServiceNode:
#     def __init__(self):
#         rospy.init_node('poi_database_service')
        
#         rospack = rospkg.RosPack()
#         package_path = rospack.get_path('point_navigator')
#         self.db_path = os.path.join(package_path, 'db', 'team_POI', 'PSEdb.db')
        
#         rospy.loginfo(f"Datenbank: {self.db_path}")
#         self.service = rospy.Service('get_poi_info', GetPoiInfo, self.handle_request)
#         rospy.loginfo("--- POI SERVICE (ROBUST & DEBUG MODUS) BEREIT ---")

#     def handle_request(self, req):
#         # 1. TRICK: .strip() entfernt Leerzeichen vorne und hinten aus deiner Eingabe
#         target = req.name.strip()
#         rospy.loginfo(f"Suche exakt nach: '{target}'")
        
#         res = GetPoiInfoResponse()
#         res.attributes = []

#         if not os.path.exists(self.db_path):
#             res.success = False
#             res.message = "DB Error: Datei nicht gefunden"
#             return res

#         conn = sqlite3.connect(self.db_path)
#         c = conn.cursor()

#         try:
#             # ---------------------------------------------------------
#             # 1. POI CHECK
#             # ---------------------------------------------------------
#             query_poi = """
#                 SELECT p.point_id, p.name, p.x, p.y, p.z, poi.descriptionGER, poi.descriptionENG
#                 FROM poi
#                 JOIN points p ON poi.poi_id = p.point_id
#                 WHERE p.name = ?
#             """
#             c.execute(query_poi, (target,))
#             row = c.fetchone()

#             if row:
#                 res.success = True
#                 res.message = "Found in POI"
#                 res.attributes.append(KeyValue("id", str(row[0])))
#                 res.attributes.append(KeyValue("name", str(row[1])))
#                 res.attributes.append(KeyValue("x", str(row[2])))
#                 res.attributes.append(KeyValue("y", str(row[3])))
#                 res.attributes.append(KeyValue("z", str(row[4])))
#                 res.attributes.append(KeyValue("descriptionGER", row[5] if row[5] else ""))
#                 res.attributes.append(KeyValue("descriptionENG", row[6] if row[6] else ""))
#                 conn.close()
#                 return res

#             # ---------------------------------------------------------
#             # 2. ROOM CHECK (Mit Debugging!)
#             # ---------------------------------------------------------
#             # Wir nutzen LEFT JOIN damit wir auch Räume ohne Punkte finden
#             query_room = """
#                 SELECT r.room_id, r.room_name, r.category, r.floor, r.side, p.x, p.y, p.z
#                 FROM room r
#                 LEFT JOIN wing w ON r.wing_id = w.wing_id
#                 LEFT JOIN points p ON w.point_id = p.point_id
#                 WHERE r.room_name = ? OR r.room_id = ?
#             """
#             c.execute(query_room, (target, target))
#             row = c.fetchone()

#             if row:
#                 res.success = True
#                 res.message = "Found in Room"
                
#                 res.attributes.append(KeyValue("room_id", str(row[0])))
#                 res.attributes.append(KeyValue("room_name", str(row[1] if row[1] else "")))
#                 res.attributes.append(KeyValue("category", str(row[2] if row[2] else "")))
                
#                 # Sicherheitscheck für Koordinaten (falls NULL in DB)
#                 val_x = str(row[5]) if row[5] is not None else "0.0"
#                 val_y = str(row[6]) if row[6] is not None else "0.0"
#                 val_z = str(row[7]) if row[7] is not None else "0.0"
                
#                 res.attributes.append(KeyValue("x", val_x))
#                 res.attributes.append(KeyValue("y", val_y))
#                 res.attributes.append(KeyValue("z", val_z))
                
#                 conn.close()
#                 return res
            
#             # --- DEBUGGING: Wenn er hier hinkommt, hat er den Raum NICHT gefunden ---
#             # Wir schauen mal, was überhaupt in der Datenbank drin steht, die ähnlich heißt
#             rospy.logwarn(f"DEBUG: Raum '{target}' nicht exakt gefunden. Prüfe DB-Inhalt...")
#             c.execute("SELECT room_id, room_name FROM room")
#             all_rooms = c.fetchall()
#             # Wir drucken alle Räume ins Terminal, damit du siehst, wie sie geschrieben werden
#             found_similar = [r for r in all_rooms if target in str(r)]
#             if found_similar:
#                 rospy.logwarn(f"Hattest du vielleicht einen dieser Räume gemeint? {found_similar}")
#             else:
#                  # Nur die ersten 10 anzeigen, sonst wird das Log zu voll
#                 rospy.logwarn(f"Hier sind Beispiele für Raum-IDs in deiner DB: {all_rooms[:10]}...")


#             # ---------------------------------------------------------
#             # 3. WING CHECK
#             # ---------------------------------------------------------
#             query_wing = """
#                 SELECT w.wing, p.x, p.y, p.z
#                 FROM wing w
#                 JOIN points p ON w.point_id = p.point_id
#                 WHERE p.name = ?
#             """
#             c.execute(query_wing, (target,))
#             row = c.fetchone()

#             if row:
#                 res.success = True
#                 res.message = "Found in Wing"
#                 res.attributes.append(KeyValue("wing", str(row[0])))
#                 res.attributes.append(KeyValue("x", str(row[1])))
#                 res.attributes.append(KeyValue("y", str(row[2])))
#                 res.attributes.append(KeyValue("z", str(row[3])))
#                 conn.close()
#                 return res

#             # ---------------------------------------------------------
#             # 4. POINT CHECK
#             # ---------------------------------------------------------
#             query_point = "SELECT point_id, name, x, y, z FROM points WHERE name = ?"
#             c.execute(query_point, (target,))
#             row = c.fetchone()

#             if row:
#                 res.success = True
#                 res.message = "Found in Points"
#                 res.attributes.append(KeyValue("point_id", str(row[0])))
#                 res.attributes.append(KeyValue("name", str(row[1])))
#                 res.attributes.append(KeyValue("x", str(row[2])))
#                 res.attributes.append(KeyValue("y", str(row[3])))
#                 res.attributes.append(KeyValue("z", str(row[4])))
#                 conn.close()
#                 return res

#             # ---------------------------------------------------------
#             # NOT FOUND
#             # ---------------------------------------------------------
#             res.success = False
#             res.message = "Not found"
#             conn.close()
#             return res

#         except Exception as e:
#             res.success = False
#             res.message = str(e)
#             rospy.logerr(f"SQL Error: {e}")
#             if conn: conn.close()
#             return res

# if __name__ == "__main__":
#     try:
#         PoiServiceNode()
#         rospy.spin()
#     except rospy.ROSInterruptException:
#         pass