#!/usr/bin/env python3

import rospy
import sqlite3
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import actionlib
from geometry_msgs.msg import PoseStamped, Pose, Point, Quaternion

def get_points_from_db(db_path):
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("SELECT name, x, y, z FROM points")
    points = cursor.fetchall()
    conn.close()
    return points

def move_to_point(client, x, y, z=0):
    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()
    
    goal.target_pose.pose.position.x = x
    goal.target_pose.pose.position.y = y
    goal.target_pose.pose.position.z = z

    # Quaternion for no rotation:
    goal.target_pose.pose.orientation = Quaternion(0, 0, 0, 1)

    client.send_goal(goal)
    client.wait_for_result()

def main():
    rospy.init_node('point_navigator')

    # Pfad zu deiner DB, evtl. anpassen
    db_path = "/home/lamayne/Dokumente/POI/team_POI/PSEdb.db"

    points = get_points_from_db(db_path)
    rospy.loginfo(f"Gefundene Punkte: {[p[0] for p in points]}")

    client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
    client.wait_for_server()

    for name, x, y, z in points:
        rospy.loginfo(f"Fahre zu Punkt {name} bei ({x}, {y}, {z})")
        move_to_point(client, x, y, z)

    rospy.loginfo("Alle Punkte abgefahren!")

if __name__ == "__main__":
    main()
