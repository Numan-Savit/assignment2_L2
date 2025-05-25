-- Active: 1747751982441@@localhost@5432@conservation_db
CREATE DATABASE conservation_db;


--Table-1: rangers
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);


INSERT INTO rangers (name, region) VALUES 
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');




--Table-2: species
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) CHECK (conservation_status IN ('Endangered', 'Vulnerable', 'Historic'))
);

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');



--Table=3: sightings
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(150) NOT NULL,
    notes TEXT
);

INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1,1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2,2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3,3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4,1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);




--Problem-1 

INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');



--Problem-2 

SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;


--Problem-3

SELECT * FROM sightings WHERE LOCATION ILIKE '%Pass%';


--Problem-4


SELECT r.name, count(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s on r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name;


--Problem-5

SELECT s.common_name
FROM species s
LEFT JOIN sightings si ON s.species_id = si.species_id
WHERE si.species_id IS NULL;


--Problem-6

SELECT sp.common_name, si.sighting_time, r.NAME
FROM sightings si 
JOIN species sp ON si.species_id = sp.species_id
JOIN rangers r ON si.ranger_id = r.ranger_id
ORDER BY si.sighting_time DESC LIMIT 2;


--Problem-7


UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';


--Problem-8
SELECT sighting_id,
CASE 
  WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
  WHEN EXTRACT(HOUR FROM sighting_time) < 18 THEN 'Afternoon'
  ELSE 'Evening'
  END AS time_of_day
FROM sightings;


--Problem-9

DELETE FROM rangers r
WHERE NOT EXISTS (
  SELECT 1 FROM sightings s WHERE s.ranger_id = r.ranger_id
);



