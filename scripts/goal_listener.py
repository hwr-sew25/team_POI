#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import PoseStamped
import sqlite3
import math
import os
import rospkg

def quaternion_to_yaw(q):
    siny_cosp = 2.0 * (q.w * q.z + q.x * q.y)
    cosy_cosp = 1.0 - 2.0 * (q.y * q.y + q.z * q.z)
    return math.atan2(siny_cosp, cosy_cosp)

def callback(msg):
    # --- DYNAMISCHER PFAD START ---
    rospack = rospkg.RosPack()
    db_path = os.path.join(rospack.get_path('point_navigator'), 'db', 'team_POI', 'PSEdb.db')
    # --- DYNAMISCHER PFAD ENDE ---

    conn = sqlite3.connect(db_path)
    c = conn.cursor()
    x = msg.pose.position.x
    y = msg.pose.position.y
    yaw = quaternion_to_yaw(msg.pose.orientation)
    name = "Testpunkt" # Hier ggf. dynamisch machen wenn gewünscht

    c.execute("""INSERT INTO points (name, x, y, z) VALUES (?, ?, ?, ?) 
                 ON CONFLICT(name) DO UPDATE SET x=excluded.x, y=excluded.y, z=excluded.z """, 
                 (name, x, y, 0.0))
    conn.commit()
    conn.close()
    rospy.loginfo(f"Punkt gespeichert in {db_path}: {name} ({x:.2f}, {y:.2f})")

def listener():
    rospy.init_node('goal_listener')
    rospy.Subscriber('/move_base_simple/goal', PoseStamped, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()