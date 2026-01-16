#!/usr/bin/env python3
import rospy
import sqlite3
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import actionlib
from geometry_msgs.msg import Quaternion
from tf.transformations import quaternion_from_euler

def get_point_from_db(name):
    conn = sqlite3.connect('/home/ailinesenalieva/catkin_ws/src/point_navigator/point_navigator/db/team_POI/PSEdb.db')  # Pfad anpassen!
    c = conn.cursor()
    c.execute("SELECT x, y FROM points WHERE name=?", (name,))
    row = c.fetchone()
    conn.close()
    if row:
        return row[0], row[1]
    else:
        return None

def send_goal(x, y):
    client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
    client.wait_for_server()

    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()

    goal.target_pose.pose.position.x = x
    goal.target_pose.pose.position.y = y
    q = quaternion_from_euler(0, 0, 0)  # Robot schaut nach vorne
    goal.target_pose.pose.orientation = Quaternion(*q)

    client.send_goal(goal)
    client.wait_for_result()
    return client.get_result()

if __name__ == '__main__':
    rospy.init_node('go_to_testpoint')
    point = get_point_from_db("Testpunkt")
    if point:
        x, y = point
        rospy.loginfo(f"Fahre zu Testpunkt: {x}, {y}")
        send_goal(x, y)
    else:
        rospy.logwarn("Kein Testpunkt in der Datenbank gefunden")
