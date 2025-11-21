-- Tabelle für Points of Interest (POIs)
CREATE TABLE poi (
    point_ID SERIAL FOREIGN KEY,
    descriptionGER TEXT,
    descriptionENG TEXT
);

CREATE TABLE points ( 
   point_ID SERIAL PRIMARY KEY, 
   name VARCHAR(100) NOT NULL UNIQUE,
   x DOUBLE PRECISION NOT NULL,  -- X-Koordinate des Knotens
   y DOUBLE PRECISION NOT NULL,  -- Y-Koordinate des Knotens
); 