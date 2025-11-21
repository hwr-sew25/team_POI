-- Tabelle für Points 
CREATE TABLE points ( 
   point_ID SERIAL PRIMARY KEY, 
   name VARCHAR(100) NOT NULL UNIQUE,
   x DOUBLE PRECISION NOT NULL,  -- X-Koordinate 
   y DOUBLE PRECISION NOT NULL  -- Y-Koordinate
); 
-- Tabelle für Points of Interest (POIs)
CREATE TABLE poi (
    poi_ID INTEGER PRIMARY KEY REFERENCES points(point_ID),
    descriptionGER TEXT,
    descriptionENG TEXT
);

