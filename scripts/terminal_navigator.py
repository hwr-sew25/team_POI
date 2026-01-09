#!/usr/bin/env python3
import rospy
import actionlib
import sys
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from point_navigator.srv import GetPoiInfo

def get_coords_from_db(target_name):
    # Warten bis der Service da ist
    rospy.wait_for_service('get_poi_info')
    try:
        service_proxy = rospy.ServiceProxy('get_poi_info', GetPoiInfo)
        resp = service_proxy(target_name)
        
        if resp.success:
            # Attribute aus der Liste parsen
            data = {kv.key: kv.value for kv in resp.attributes}
            
            print(f"\n -> GEFUNDEN: {data.get('name', target_name)} ({data.get('category', 'Keine Kategorie')})")
            desc = data.get('descriptionGER', data.get('description', ''))
            if desc:
                print(f" -> INFO: {desc}")
                
            return float(data['x']), float(data['y'])
        else:
            print(f" -> FEHLER: {resp.message}")
            return None, None
            
    except rospy.ServiceException as e:
        print(f"Service call failed: {e}")
        return None, None

def move_to_goal(x, y):
    client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
    print(" -> Warte auf Move Base Server...")
    client.wait_for_server()

    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()
    goal.target_pose.pose.position.x = x
    goal.target_pose.pose.position.y = y
    goal.target_pose.pose.orientation.w = 1.0 # Keine Drehung, Blick nach vorne

    print(f" -> FAHRE LOS zu ({x}, {y})...")
    client.send_goal(goal)
    
    # Warten bis Ziel erreicht (optional mit Timeout)
    client.wait_for_result()
    print(" -> ZIEL ERREICHT!")

if __name__ == '__main__':
    rospy.init_node('terminal_navigator')
    
    while not rospy.is_shutdown():
        try:
            target = input("\n[Terminal Navigator] Wo willst du hin? (z.B. '1.30', 'Kaffee', 'q' zum Beenden): ")
            if target.lower() == 'q':
                break
            
            x, y = get_coords_from_db(target)
            
            if x is not None:
                if x == 0.0 and y == 0.0:
                    print(" -> WARNUNG: Ort gefunden, aber Koordinaten sind 0.0 (Wahrscheinlich kein Flügel verknüpft!)")
                else:
                    move_to_goal(x, y)
        except EOFError:
            break