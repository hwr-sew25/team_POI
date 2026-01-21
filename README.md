# PSE_Database
Das ist das Repository für die zentrale Datenbank für unser gemeinsames Projekt. Hier können wir gemeinsam arbeiten und Änderungen aktualisiert halten. Die Verwaltung wird von uns, das POI Team, übernommen.

# Point Navigator (POI Interface aka Schnittstelle)

Dieses ROS-Paket (`point_navigator`) fungiert als zentrale Schnittstelle im Gesamtsystem.
Es empfängt Zielanfragen aus der Spracheingabe (Directions Teams) oder aus den Buttons (Display Team), sucht die entsprechenden Koordinaten in der Datenbank und sendet die Koordinaten an den Roboter (Navigation Team).

---

### Voraussetzungen
Damit dieses Paket kompiliert und läuft, müssen folgende Abhängigkeiten im catkin_ws/src Ordner vorhanden sein:
- `movement_api` (Navigations Team): Wir benötigen deren Message TargetPose.
- ROS Noetic (Standardinstallation).
- Python Libraries: sqlite3, json 

---
### Installation

- `cd ~/catkin_ws/src`

1. Repository klonen
    - `git clone [https://github.com/hwr-sew25/team_POI.git](https://github.com/hwr-sew25/team_POI.git) point_navigator`

- WICHTIG: Der Ordner MUSS 'point_navigator' heißen!
Falls er 'team_POI' heißt, bitte umbenennen:
    - `mv team_POI point_navigator`

2. Bauen (Wichtig für Message-Generierung)
    - `cd ~/catkin_ws`
    - `catkin_make`
    - `source devel/setup.bash`

---

### Schnittstelle nutzen

- Um die Schnittstelle zu starten, genügt ein Befehl. Dieser startet den Node, verbindet sich mit der Datenbank und lauscht auf Topics.

         roslaunch point_navigator poi_launchfile.launch

---

### Schnittstellen-Definition (Für andere Teams)

Hier ist genau beschrieben, was die anderen Gruppen senden müssen, damit unser System reagiert.

### Für das Directions Team 

* **Topic:** `/directions/json_output`
* **Typ:** `std_msgs/String`
* **Erwartetes Format:** Ein JSON-String.
* **Logik:** Wir reagieren nur, wenn `status` auf `"success"` steht.

**Beispiel-Payload:**

```json
{
  "status": "success",
  "data": {
    "room_found": "4.05"
  }
}
```

---

### Für das Display Team 

* **Topic:** `/display/current_screen`
* **Typ:** `std_msgs/String`
* **Logik:** Sendet den Namen des Screens/Buttons, der gerade angezeigt wird (z.B. wenn der Nutzer auf "Kaffee" drückt).

**Erwartete Werte (Beispiele):**
* `"kaffeeautomat"`
* `"snackautomat"`
* `"muelleimer"`

*(Hinweis: Screens wie "index" oder "error_tec" werden von uns ignoriert.)*

### Für das Navigation Team (Roboter)

* **Topic:** `/navbot/target_pose`
* **Typ:** `movement_api/TargetPose`
* **Inhalt:** Wir senden euch die Zielkoordinaten aus unserer Datenbank.

**Message Struktur:**

```yaml
header:
  frame_id: "map"
target_id: "4.05"  # Name des Ziels
x: 12.5            # X-Koordinate
y: 8.2             # Y-Koordinate
yaw: 0.0           # Ausrichtung (Standard 0)```
```
---

### Testen 
Ihr könnt testen, ob der Point Navigator korrekt läuft, ohne dass die anderen Gruppen aktiv sind. Startet den Node und öffnet ein neues Terminal:

**1. Sprach-Eingabe simulieren:**

    rostopic pub /directions/json_output std_msgs/String "data: '{\"status\": \"success\", \"data\": {\"room_found\": \"4.05\"}}'" -1

    rostopic pub /display/current_screen std_msgs/String "data: 'kaffeeautomat'" -1
