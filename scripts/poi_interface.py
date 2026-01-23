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
        self.sub_topic_language = rospy.get_param('~language_topic', '/language')
        
        self.pub_topic_nav = rospy.get_param('~navigation_topic', '/navbot/target_pose')
        self.pub_topic_text = rospy.get_param('~text_topic', '/speech_out/say')

        self.current_lang = 'de' # Default

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
        self.pub_nav = rospy.Publisher(self.pub_topic_nav, TargetPose, queue_size=10)
        self.pub_text = rospy.Publisher(self.pub_topic_text, String, queue_size=10)
        
        self.sub_speech = rospy.Subscriber(self.sub_topic_speech, String, self.callback_speech)
        self.sub_display = rospy.Subscriber(self.sub_topic_display, String, self.callback_display)
        self.sub_lang = rospy.Subscriber(self.sub_topic_language, String, self.callback_language)
        
        # HIER IST DER BEWEIS-TEXT:
        rospy.loginfo("--- POI MIDDLEWARE BEREIT (Mit Sprachausgabe) ---")
        rospy.loginfo(f" Sprache: {self.sub_topic_language}")
        rospy.loginfo(f" Text-Output: {self.pub_topic_text}")

    def callback_language(self, msg):
        lang_code = msg.data.lower().strip()
        if 'de' in lang_code or 'ger' in lang_code:
            self.current_lang = 'de'
        else:
            self.current_lang = 'en'
        rospy.loginfo(f" Sprache geändert auf: {self.current_lang.upper()}")

    def callback_speech(self, msg):
        try:
            data = json.loads(msg.data)
            if data.get('status') == 'success':
                target = data.get('data', {}).get('room_found')
                if target:
                    self.process_navigation_request(target, source="Speech")
        except Exception as e:
            rospy.logerr(f"Fehler Sprache: {e}")

    def callback_display(self, msg):
        screen_name = msg.data.lower().strip()
        ignore_screens = ["index", "raumwahl", "karten_ausgabe", "error_tec", "error_route", "karten_validierung", "bildungsangebote"]
        
        if screen_name in ignore_screens:
            return

        rospy.loginfo(f" [Display] Screen: '{screen_name}'")
        self.process_navigation_request(screen_name, source="Display")

    def process_navigation_request(self, target, source):
        rospy.loginfo(f" [{source}] Suche Infos für: {target}")
        
        coords = self.get_coords_from_db(target)
        description = self.get_description_from_db(target)

        # 1. Navigation
        if coords:
            x, y = coords
            rospy.loginfo(f"[{source}] Ziel gefunden! Sende Fahrbefehl.")
            nav_msg = TargetPose()
            nav_msg.header.stamp = rospy.Time.now()
            nav_msg.header.frame_id = "map"
            nav_msg.target_id = str(target)
            nav_msg.x = float(x)
            nav_msg.y = float(y)
            nav_msg.yaw = 0.0
            self.pub_nav.publish(nav_msg)
        else:
            rospy.logwarn(f" [{source}] Ziel '{target}' hat keine Koordinaten.")

        # 2. Sprachausgabe
        if description:
            rospy.loginfo(f" [{source}] Beschreibung gefunden: '{description[:30]}...'")
            self.pub_text.publish(String(data=description))
        else:
            rospy.logwarn(f" [{source}] Keine Beschreibung gefunden.")

    def get_coords_from_db(self, target):
        clean_target = target.replace(" ", "").strip()
        candidates = [target, f"%{target}%", clean_target, f"%{clean_target}%"]
        try:
            for candidate in candidates:
                # Room
                self.cursor.execute("SELECT p.x, p.y FROM room r JOIN wing w ON r.wing_id = w.wing_id JOIN points p ON w.point_id = p.point_id WHERE r.room_id LIKE ? OR r.room_name LIKE ?", (candidate, candidate))
                row = self.cursor.fetchone()
                if row: return (row['x'], row['y'])
                # Points
                self.cursor.execute("SELECT x, y FROM points WHERE name LIKE ?", (candidate,))
                row = self.cursor.fetchone()
                if row: return (row['x'], row['y'])
            return None
        except: return None

    def get_description_from_db(self, target):
        clean_target = target.strip()
        candidates = [clean_target, f"%{clean_target}%"]
        col_name = "descriptionGER" if self.current_lang == 'de' else "descriptionENG"

        try:
            for candidate in candidates:
                # JOIN points -> poi (über ID)
                query = f"""
                    SELECT poi.{col_name} as desc_text
                    FROM points
                    JOIN poi ON points.point_id = poi.poi_id
                    WHERE points.name LIKE ?
                """
                self.cursor.execute(query, (candidate,))
                row = self.cursor.fetchone()
                if row and row['desc_text']: return row['desc_text']
            return None
        except Exception as e:
            rospy.logerr(f"SQL Fehler (Desc): {e}")
            return None

if __name__ == '__main__':
    PoiMiddlewareNode()
    rospy.spin()