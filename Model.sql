-- Tabelle für Points 
CREATE TABLE points ( 
   point_id INTEGER PRIMARY KEY, 
   name VARCHAR(100) NOT NULL UNIQUE,
   x DOUBLE PRECISION NOT NULL,  -- X-Koordinate 
   y DOUBLE PRECISION NOT NULL  -- Y-Koordinategit 
); 

-- Tabelle für Points of Interest (POIs)
CREATE TABLE poi (
    poi_id INTEGER PRIMARY KEY,
    descriptionGER TEXT,
    descriptionENG TEXT,
    FOREIGN KEY poi_id REFERENCES points(point_id)
);

CREATE TABLE wing (
    wing_id INTEGER PRIMARY KEY, 
    wing VARCHAR(4) NOT NULL,
    point_id INTEGER NOT NULL,
    FOREIGN KEY point_id REFERENCES points(point_id)
);

CREATE TABLE room (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    building CHAR (1) NOT NULL, 
    room_id VARCHAR(5) UNIQUE NOT NULL,
    room_name VARCHAR(250) NOT NULL,
    floor CHAR(2) NOT NULL,
    wing_id INTEGER NOT NULL,
    side VARCHAR(6) NOT NULL, 
    category VARCHAR(50) NOT NULL,
    gender VARCHAR(6), 
    accessible INTEGER NOT NULL,
    notes TEXT, 
    FOREIGN KEY (wing_id) REFERENCES wing(wing_id)
);
