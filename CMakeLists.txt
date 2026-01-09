cmake_minimum_required(VERSION 3.0.2)
project(point_navigator)

## 1. Abhängigkeiten finden
find_package(catkin REQUIRED COMPONENTS
  actionlib
  move_base_msgs
  rospy
  std_msgs
  message_generation  
  diagnostic_msgs
  # Wichtig für .srv Generierung
)

## 2. Services hinzufügen
add_service_files(
  FILES
  GetPoiInfo.srv
  # Service1.srv und Service2.srv entfernt, da sie nicht existieren!
)

## 3. Nachrichten/Services generieren
generate_messages(
  DEPENDENCIES
  std_msgs
  move_base_msgs
  diagnostic_msgs
)

## 4. Paket-Infos exportieren (WICHTIG!)
## Hier muss message_runtime stehen, sonst gibt es Import-Fehler
catkin_package(
  CATKIN_DEPENDS actionlib move_base_msgs rospy std_msgs message_runtime
)

## 5. Header Pfade (Standard)
include_directories(
  ${catkin_INCLUDE_DIRS}
)

## 6. Skripte installierbar machen (für rosrun)
## Achte darauf, dass dein Skript wirklich im Ordner 'scripts' liegt!
catkin_install_python(PROGRAMS
  scripts/poi_service_node.py
  scripts/terminal_navigator.py
  scripts/goal_listener.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)