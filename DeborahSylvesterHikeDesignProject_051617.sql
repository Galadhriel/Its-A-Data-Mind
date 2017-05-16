-- Deborah Sylvester
-- CMPT 308
-- Hiking Design Project
-- May 11, 2017

-- **********************************************************************************
--  *** SQL statements for Dropping Tables to make sure data is current    ***  ----
-- **********************************************************************************

DROP TABLE IF EXISTS Personnel CASCADE;
DROP TABLE IF EXISTS People CASCADE;
DROP TABLE IF EXISTS Maintenanceteams CASCADE;
DROP TABLE IF EXISTS Parks CASCADE;
DROP TABLE IF EXISTS States CASCADE;
DROP TABLE IF EXISTS Cities CASCADE;
DROP TABLE IF EXISTS Facilities CASCADE;
DROP TABLE IF EXISTS Trails CASCADE;
DROP TABLE IF EXISTS WayPoints CASCADE;
DROP TABLE IF EXISTS DifficultyLevel CASCADE;
DROP TABLE IF EXISTS Visitors CASCADE;


--  ***   CREATE TABLES    ***   ----

-- Personnel Table ----
CREATE TABLE Personnel (
  personID SERIAL UNIQUE NOT NULL,
  maintID TEXT NOT NULL, -- FK REFERENCES Maintenanceteams(maintID)
  primary key(personID)
);

-- People Table ---
CREATE TABLE People (
  personID SERIAL UNIQUE NOT NULL,
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL,
  ageYrs INT NOT NULL,
  PRIMARY KEY(personID)
);

-- Maintenance Teams Table --
CREATE TABLE Maintenanceteams (
  maintID TEXT UNIQUE NOT NULL,
  mName TEXT NOT NULL,
  PRIMARY KEY(maintID)
);


-- Parks Table ---
CREATE TABLE Parks (
  parkID CHAR(3) UNIQUE NOT NULL,
  pName TEXT NOT NULL,
  cityID TEXT NOT NULL,  -- FK REFERENCES Cities(cityID)
  maintID TEXT NOT NULL, -- FR REFERENCES Maintenanceteams(maintID)
  PRIMARY KEY (parkID)
);


-- States Table --
CREATE TABLE States (
  stateID TEXT UNIQUE NOT NULL,
  stateName TEXT NOT NULL,
  stateAb TEXT NOT NULL,
  PRIMARY KEY (stateID)
);


-- Cities Table --
CREATE TABLE Cities (
  cityID TEXT UNIQUE NOT NULL,
  stateID TEXT NOT NULL, -- FK REFERENCES States(stateID)
  cityName TEXT NOT NULL,
  population BIGINT NOT NULL,
  PRIMARY KEY (cityID)
 );


-- Facilities Table --
CREATE TABLE Facilities (
  facID INT UNIQUE NOT NULL,
  facName TEXT NOT NULL,
  facDesc TEXT NOT NULL,
  parkID CHAR(3) NOT NULL, -- FK REFERENCES Parks(parkID)
  PRIMARY KEY (facID)
 );


-- Trails Table --
CREATE TABLE Trails (
  trailID CHAR(3) UNIQUE NOT NULL,
  tName TEXT NOT NULL,
  parkID CHAR(3) NOT NULL, -- FK REFERENCES Parks(parkID)
  visitorID INT NOT NULL,  -- FK REFERENCES Visitors(visitorID)
  trailDistanceMiles DECIMAL (5,2) NOT NULL,
  maxElevationFt INT NOT NULL,
  avgHikeTimeHrs DECIMAL (5,1) NOT NULL,
  elevationGainFt INT NOT NULL,
  difficultyID INT NOT NULL, -- FK REFERENCES DifficultyLevel(difficultyID)
  PRIMARY KEY (trailID)
 );

-- WayPoints Table ---
CREATE TABLE WayPoints (
  wayID SERIAL UNIQUE NOT NULL,
  trailID CHAR(3) NOT NULL, -- FK REFERENCES Trails(trailID)
  wayName TEXT NOT NULL,
  wayDesc TEXT NOT NULL,
  longitude TEXT NOT NULL,
  latitude TEXT NOT NULL,
  PRIMARY KEY (wayID)
 );

-- DifficultyLevel Table -- 
CREATE TABLE DifficultyLevel (
  difficultyID INT UNIQUE NOT NULL,
  diffLevel TEXT NOT NULL,
  diffDesc TEXT NOT NULL,
  PRIMARY KEY (difficultyID)
);

-- Visitors Table  --
CREATE TABLE Visitors (
  visitorID INT NOT NULL REFERENCES people(personID),
  visitorState TEXT NOT NULL,
  trailID CHAR(3) NOT NULL,
  visitorHikeTimeHrs DECIMAL(5,1) NOT NULL,
  PRIMARY KEY (visitorID, trailID) 
);


-- **********************************************************************************
--  *** SQL statements for loading sample data into the tables    ***  -------------- 
-- **********************************************************************************

-- Personnel --
INSERT INTO Personnel( maintID )
  VALUES( 'M01' );
  
INSERT INTO Personnel( maintID )
  VALUES( 'M02' );
  
INSERT INTO Personnel( maintID )
  VALUES( 'M03' );
  
INSERT INTO Personnel( maintID )
  VALUES( 'M04' );

INSERT INTO Personnel( maintID )
  VALUES( 'M05' );
  
INSERT INTO Personnel( maintID )
  VALUES( 'M06' );


-- People --
INSERT INTO People( firstName, lastName, ageYrs )
VALUES( 'John', 'Smith', 34 ),
      ( 'Paul', 'Jones', 40 ),
      ( 'Gary', 'Chernega', 49 ),
      ( 'Lisa', 'Kelly', 37),
      ( 'Xiaojin', 'Wei', 40 ),
      ( 'Phil', 'Collins', 38 ),
      ( 'Phil', 'Buchling', 28 ),
      ( 'Denise', 'Roe', 52 ),
      ( 'Marie', 'Zanck', 55 ),
      ( 'Romeo', 'Sylvester', 22 ),
      ( 'Nancy', 'Donahue', 58 ),
      ( 'Janet', 'Duncan', 57 ),
      ( 'Lem', 'Atkins', 55 ),
      ( 'Phil', 'Sylvester', 52 ), 
      ( 'Linda', 'Bauer', 63 ), 
      ( 'Alan' , 'Labouseur', 43),
      ( 'Thomas', 'Bauer', 64 ),
      ( 'Brian', 'Werneke', 29 ),
      ( 'Cory', 'Vandeventer', 32 ),
      ( 'Jacob', 'Porter', 27 ),
      ( 'Amber', 'Monroe', 29 ),
      ( 'Ying', 'Yu', 45 ),
      ( 'Marcie', 'Gemza', 62 ),
      ( 'Barbara', 'Torelli', 42 ),
      ( 'Ronald', 'Consiglio', 49 );
      
       -- Maintenance Teams --
INSERT INTO Maintenanceteams(  maintID, mName )
VALUES( 'M01', 'Trail Repair Team'),
       ( 'M02', 'Custodians'),
       ( 'M03', 'Carpenters'),
       ( 'M04', 'Plumbers'),
       ( 'M05', 'Housekeeping'),
       ( 'M06', 'Landscapers');      
      
-- Parks --
INSERT INTO Parks( parkID, pName, cityID, maintID )
VALUES( 'P01', 'Grand Canyon National Park', 'C01', 'M01' ),
      ( 'P02', 'Crater Lake National Park', 'C02', 'M01'),
      ( 'P03', 'Mt Rainer National Park', 'C03', 'M02'),
      ( 'P04', 'Yellowstone National Park', 'C05', 'M01'),
      ( 'P05', 'Arches National Park', 'C10', 'M01'),
      ( 'P06', 'Yosemite National Park', 'C08','M06'), 
      ( 'P07', 'Mohonk Preserve', 'C04', 'M03'),
      ( 'P08', 'Bushkill Falls', 'C06', 'M05'),
      ( 'P09', 'Breakneck Mountain', 'C11', 'M04'),
      ( 'P10', 'Mt Rainer National Park', 'C07', 'M01'),
      ( 'P11', 'Mt Rainer National Park', 'C09', 'M01'),
      ( 'P12', 'OqunquitPark', 'C09', 'M01');
      
            

-- States --
INSERT INTO States(  stateID, stateName, stateAb )
VALUES( 'S01', 'Arizona', 'AZ'),
      ( 'S02', 'Oregon', 'OR' ),
      ( 'S03', 'Washington', 'WA'),
      ( 'S04', 'Wyoming', 'WY'),
      ( 'S05', 'New York', 'NY'),
      ( 'S06', 'Maine', 'ME'),
      ( 'S07', 'California', 'CA'),
      ( 'S08', 'Utah', 'UT'),
      ( 'S09', 'Pennsylvania', 'PA');
      
      

-- Cities --
-- Populations are made up.
INSERT INTO Cities(  cityID, stateID, cityName, population )
VALUES( 'C01', 'S01', 'Flag Staff', 100000000),
      ( 'C02', 'S02', 'Klamath Falls', 20000000 ),
      ( 'C03', 'S03', 'Seattle', 3521009873),
      ( 'C04', 'S05', 'Poughkeepsie', 6321809321),
      ( 'C05', 'S04', 'Jackson Hole', 43219897983),
      ( 'C06', 'S09', 'Bushkill', 5421233),
      ( 'C07', 'S03', 'Ohanapecosh', 5432134),
      ( 'C08', 'S07', 'Yosemite national Park', 1234343),
      ( 'C09', 'S03', 'Ashford', 435423),
      ( 'C10', 'S08', 'Moab', 4313453),
      ( 'C11', 'S05', 'Cold Spring', 24343),
      ( 'C12', 'S06', 'Ogunquit', 892);
      
      
-- Facilities --
INSERT INTO Facilities(  facID, facName, facDesc, parkID )
VALUES( 1, 'Grand Canyon Lodge', 'Lodging, Restaurants', 'P01'),
      ( 2, 'Crater Lake Lodge', 'Lodging, Restaurant',  'P02'),
      ( 3, 'Paradise Inn', 'Lodging, Restaurant', 'P03'),
      ( 4, 'Mohonk Mountain House', 'Lodging Restaurant', 'P07'),
      ( 5, 'Fishking Bridge RV Park', 'Coin-op Laundry and showers', 'P04');
      
      
            
-- Trails --
-- References For the tables from: 
-- https://www.nps.gov/yell/planyourvisit/upload/242DHSampler15_cross.pdf
-- http://www.wta.org/go-hiking/hikes/grove-of-the-patriarchs
-- https://www.nps.gov/arch/index.htm
-- https://www.nps.gov/crla/planyourvisit/lodging.htm
-- http://hikethehudsonvalley.com/mohonk-mountain-house-labyrinth-and-lemon-squeeze/
-- http://www.visitbushkillfalls.com/things-to-do/trails/#
-- https://www.nps.gov/mora/index.htm
-- https://grandcanyon.com/maps/where-grand-canyon-located/
-- https://www.nps.gov/mora/planyourvisit/trails-of-mount-rainier.htm
-- https://www.nps.gov/crla/learn/news/upload/Crater-Lake-Reflections-Summer-Fall-2016-2nd-Printing-Low-Res.pdf
-- https://www.nps.gov/yell/planyourvisit/upload/242DHSampler15_cross.pdf

--
INSERT INTO Trails( trailID, tName, parkID, visitorID, trailDistanceMiles, maxElevationFt, elevationGainFt, avgHikeTimeHrs, 
difficultyID )
VALUES('T01', 'Labyrinth and Lemon Squeeze', 'P05', 2, 3.7, 1617, 973, 3.1, 9 ),   -- Mohonk
      ( 'T02', 'South Kaibab', 'P01', 3, 6.8, 2480, -4780, 8, 9 ),                  -- Grand Canyon
      ( 'T03', 'Garfield Creek', 'P02', 1, 3.6, 8054, 1010, 2.5, 8 ),               -- Crater Lake
      ( 'T04', 'Breakneck Ridge', 'P09', 13, 3.7, 1207, 1442, 4, 10 ),              -- Breakneck
      ( 'T05', 'Half Dome Trail', 'P06', 8, 16.4, 8800, 4800, 12, 9 ),             -- Yosemite
      ( 'T06', 'Grove Of The Patriarchs', 'P10', 10, 1.5, 2200, 50, 1, 2),           -- Mt Rainier Wa
      ( 'T07', 'Wizard Summit', 'P02', 11, 2.2, 6940, 760, 1.5, 4),                  -- Crater Lake
      ( 'T08', 'Red Trail', 'P08', 4, 2.0, 1020, 150, 2.0, 7),                       -- Bushkill Falls
      ( 'T09', 'Yellow Trail', 'P08', 14, 1.0, 1020, 150, 0.75,  4),                  -- Bushkill Falls
      ( 'T10', 'Bonticou Crag and Table Rocks', 'P07', 16, 6.0, 1195, 1215, 4.0, 8),   -- Mohonk
      ( 'T11', 'Lake Trail Loop', 'P03', 11, 5.0, 4854, 1300, 4.0, 6),                 -- Mt Rainier
      ( 'T12', 'Skyline Loop', 'P11', 19, 5.5, 6800, 1700, 4.5, 9),                   -- Mt Rainier
      ( 'T13', 'Nisqually Vista Trail', 'P11', 20, 1.2, 5220, 200, 0.75, 2),         -- Mt Rainier
      ( 'T14', 'Bright Angel Trail', 'P01', 11, 9.3, 6860, -4380, 10, 8),           -- bright angel camp ground Grand Canyon
      ( 'T15', 'Bright Angel Trail', 'P01', 7, 6.1, 3740, -3120, 5, 7),              --  plateau point Grand Canyon
      ( 'T16', 'Bright Angel Trail', 'P01', 8, 4.6, 3800, -3060, 5, 7),              -- indian garden Grand Canyon
      ( 'T17', 'Bright Angel Trail', 'P01', 9, 9.6, 3800, -3060, 7, 7),              -- phanton ranch Gand Canyon
      ( 'T18', 'Delicate Arch Trail', 'P05', 17, 3, 4800, 480, 2.5, 7),              -- Arches
      ( 'T19', 'Landscape Arch Trail', 'P05', 21, 1.6, 5254, 50, 0.9, 2),              -- Arches
      ( 'T20', 'Vernal Fall and Nevada Fall Trails', 'P06', 18, 1.6, 6000, 2000, 6, 9 ),         -- Yosemite
      ( 'T21', 'Old Faithful', 'P04', 12, 16, 7349, 160, 2.2, 6 ),                     -- Yellowstone
      ( 'T22', 'Beaver Ponds Loop', 'P04', 4, 5.6, 6370, 823, 2.5, 3 ),                     -- Yellowstone
      ( 'T23', 'Marginal Way', 'P12', 15, 3.3, 57, 199, 1, 2 );                     -- Oqunquit
      
      
      
-- WayPoints --
-- Reference for longitude and latitude: http://www.latlong.net/

INSERT INTO WayPoints(  trailID, wayName, wayDesc, longitude, latitude )
VALUES( 'T01', 'Sky Top Tower', 'Great Views of the Hudson Valley.', '41.763582', '-74.156007'),
      ( 'T02', 'Cedar Ridge', 'Breath taking views of the canyon.', '36.064085', '-112.089394'),
      ( 'T03', 'Garfield Peak', 'View from the island, wildflowers on top.', '42.904018', '-122.123083'),
      ( 'T04', 'Breakneck Ridge', 'Insane views of the Hudson Valley.', '41.467080', '-73.95477'),
      ( 'T05', 'Half Dome Summit', 'Panoramic views of Yosemite Valley and the High Sierra.', '37.745919', '-119.533199'),
      ( 'T06', 'Grove of the Patriarchs', 'Suspension bridge, 1000 yr old Douglas Firs, Red Cedars, Western Hemlocks.', 
'46.758148', '-121.557523'),
      ( 'T07', 'Wizard Summit', 'View from the island, crater on top.', '42.939489', '-122.149229'),
      ( 'T08', 'Bridal Veil Falls', 'Good view of the falls. 8 falls along the way.', '41.116457', '-75.011966'),
      ( 'T09', 'Main Falls', 'Good view of the main falls. Lower gorge and upper canyon.', '41.120482', '-75.008075'),
      ( 'T10', 'Crag View', 'Good view of Valley and table rocks.', '41.788075', '-74.118835'),
      ( 'T11', 'Reflection Lake', 'Beautiful view of Mt Rainier in the still water.', '46.769692', '-121.730220'),
      ( 'T12', 'Panorma Point', 'Beautiful views of Mt Adams, Mt St. Helens, Mount Hood, Pinnacle Peak.', '46.802175', '-
121.728730'),   
      ( 'T13', 'Nisqually Glacier', 'Beautiful view of the Nisqually Glacier up close and personal.', '46.786582', '-
121.744790'), 
      ( 'T14', 'Colorado River', 'Beautiful view at the bottom of the Grand Canyon!! Phantom Ranch is here.', '36.069168', '-
112.132697'), 
      ( 'T15', 'Plateu Point', 'Nice view of the colorado river. Look for the Condors flying around!!', '36.092854', '-
112.117010'),
      ( 'T16', 'Indian Garden', 'Rest area. Close to Plateau Point. Donkey"s kept here!!', '36.092854', '-112.117010'),
      ( 'T17', 'Phantom Ranch', 'Campground, cabins, restrooms/showers on the colorado river.!!', '36.105708', '-112.094772'),
      ( 'T18', 'Delicate Arch', 'The arch is 64 feet high and 45 feet wide, making it the largest free-standing arch in the 
park!!', '38.735653,', '-109.520592'),
      ( 'T19', 'Landscape Arch', 'Rest area. Close to Plateau Point. Donkey"s kept here!!', '38.782709', '-109.595107'),
      ( 'T20', 'Vernal and Nevada Falls', 'Views of the Vernal and Nevada Falls.', '37.724819', '-119.533301'),
      ( 'T21', 'Old Faithful', 'Views of the most famous geyser that erupts every 74 mins. Super volcano Park.', '44.459054', '-
110.822318'),
      ( 'T22', 'Beaver Ponds', 'Forest and meadows. Near Mammoth Hot Springs', '44.986003', '-110.713942'),
      ( 'T23', 'Perkins Cove', 'Beautiful view of the cove.', '43.241607', '-70.588814');
 
-- DifficultyLevel --
-- Difficulty Descriptions from: http://hikethehudsonvalley.com/frequently-asked-questions/  --
INSERT INTO DifficultyLevel(  difficultyID, diffLevel, diffDesc )
Values( 1, 'Level 1', 'Similar to the walk from the couch to the fridge.'),
      ( 2, 'Level 2', 'Tingly sensation spreads across the lips.  Wait, no, that’s 2 peppers on a Thai menu.'),
      ( 3, 'Level 3', 'Okay, this is starting to feel like a hike now.'),
      ( 4, 'Level 4', 'Last safe number on which to bring friends who don’t like hiking.  Starting to feel a lot like 
exercise.'),
      ( 5, 'Level 5', 'If you don’t break a sweat, you might be a cyborg and not even realize it.  Yet.'),
      ( 6, 'Level 6', 'You owe yourself at least three slices of pizza after this.'),
      ( 7, 'Level 7', 'This might hurt tomorrow.'),
      ( 8, 'Level 8', 'Very hard.'),
      ( 9, 'Level 9', 'Rough'),
      (10, 'Level 10', 'Extreme');
      
-- Visitor Table --
INSERT INTO Visitors(  visitorID, visitorState, trailID, visitorHikeTimeHrs )
Values( 4, 'New York','T09', 3),
       ( 3, 'New York', 'T14', 3.2 ),
       ( 23, 'Arizona', 'T15', 6.3 ),
       ( 13, 'California', 'T05', 3 ),
       ( 11, 'New Jersey', 'T07', 7 ),
       ( 7, 'Washington', 'T04', 9 ),
       ( 5, 'Oregon', 'T14', 10.2 ),
       ( 2, 'Maine', 'T10', 2 ),
       ( 1, 'Wyoming', 'T21', 4),
       ( 16, 'Texas', 'T18', 1.5),
       ( 18, 'Arizona', 'T03', 5),
       ( 20, 'Washington', 'T13', 4),
       ( 21, 'Utah', 'T18', 5),
       ( 14, 'California', 'T12',3.7 ),
       ( 12, 'Pennsylvania', 'T08', 1.3),
       ( 21, 'Utah', 'T11', 5.3);


-- SQL Query Statements -----
  
Select *
from personnel;

select *
from people;

select *
from maintenanceteams;

select *
from parks;

select * 
from states;

select * 
from cities;

select *
from facilities;

select *
from trails;

select *
from waypoints;

select *
from difficultylevel;

select *
from visitors;


-- -------------------------------------------------------------------

-- *******************************************************************************************
--  *** SQL statements: Stored Procedure: Views                                                         ***  ----
-- List of trails and their locations and distances. Joins trails, cities, states, wayPoints
-- Trail Difficulty
-- ********************************************************************************************

--  CREATE OR REPLACE VIEW TrailDetails AS
SELECT pk.pName as "Park Name", t.tName as "Trail Name",  t.trailDistanceMiles as "Trail Distance(miles)", df.diffLevel as "Difficulty Level", 
w.wayName as "WayPoint", w.wayDesc as "WayPoint Desc", c.cityName as "City", s.stateName as "State"
FROM Trails t
INNER JOIN Parks pk ON t.parkID = pk.parkID
INNER JOIN Cities c ON pk.cityID = c.cityID
INNER JOIN States s ON s.stateID = c.stateID
INNER JOIN WayPoints w ON w.trailID = t.trailID
INNER JOIN DifficultyLevel df ON df.difficultyID = t.difficultyID
ORDER BY pk.pName
;



-- Select *
-- from TrailDetails
-- order by "Park Name" ASC;


-- **********************************************************************************
--  ***  VIEW   SQL statements: List the trails by Difficulty                      ***  ----
--  TO DO ADD IN who did it faster --
-- **********************************************************************************

CREATE OR REPLACE VIEW TrailDifficulty AS
select t.tName as "Trail Name", df.diffLevel as "Difficulty Level", df.diffDesc as "Difficulty Descripiton"
FROM Trails t
INNER JOIN DifficultyLevel df ON df.difficultyID = T.difficultyID
;

-- Query --
Select *
FROM TrailDifficulty
order by "Trail Name" ASC;


-- ***************************************************************** ****************************--
-- View to show the States visitors came from and where they went to visit. NOT their home states.-
-- **********************************************************************************************--

CREATE OR REPLACE VIEW OutofStateVisitors AS
SELECT s.stateName as "State Of Park", v.visitorState as "Visitors State", pk.pName as "Park Name", t.tName as "Trail Name",
t.trailDistanceMiles as "Trail Distance(Miles)", p.lastName as "Last Name",  p.firstName as "First Name", p.ageYrs as "Age(Years)"
FROM Trails t
INNER JOIN Parks pk ON t.parkID = pk.parkID
INNER JOIN Cities c ON pk.cityID = c.cityID
INNER JOIN States s ON s.stateID = c.stateID
INNER JOIN WayPoints w ON w.trailID = t.trailID
INNER JOIN People p ON p.personID = t.visitorID
INNER JOIN Visitors v ON v.trailID =  t.trailID
where s.stateName != v.visitorstate
;

--  Query for the above -- 
Select *
from OutofStateVisitors
order by "State Of Park" ASC;


-- ****************************************************************************** --
-- ***** Views Table Inner joins  Where visitors are from the same state as the trails ****** --
-- ****************************************************************************** --
CREATE OR REPLACE VIEW InStateVisitors AS
SELECT s.stateName as "State Of Park", v.visitorState as "Visitors State", pk.pName as "Park Name", t.tName as "Trail Name",
t.trailDistanceMiles as "Trail Distance(Miles)", p.lastName as "Last Name",  p.firstName as "First Name", p.ageYrs as "Age(Years)"
FROM Trails t
INNER JOIN Parks pk ON t.parkID = pk.parkID
INNER JOIN Cities c ON pk.cityID = c.cityID
INNER JOIN States s ON s.stateID = c.stateID
INNER JOIN WayPoints w ON w.trailID = t.trailID
INNER JOIN People p ON p.personID = t.visitorID
INNER JOIN Visitors v ON v.trailID =  t.trailID
where s.stateName = v.visitorstate
;

-- Query for the Above --
Select *
from InStateVisitors
order by "State Of Park" ASC;

-- ---------------------------------------------------------------------------
-- ***************************************************************** --
--  REPORT People who hiked trails in Washington that are over 30 years old. --
-- ******************************************************************--

SELECT pk.pName as "Park Name", t.tName as "Trail Name", t.trailDistanceMiles as "Trail Distance(Miles)", p.firstName as "First Name",
p.lastName as "Last Name", p.ageYrs as "Age(Yrs)"

FROM Trails t
INNER JOIN People p ON t.visitorID = p.personID
INNER JOIN Parks pk ON t.parkID = pk.parkID
INNER JOIN WayPoints w ON w.trailID = t.trailID
where p.ageYrs >=30
;

-- ***********************************************************************************
-- **********************************************************************************************--
--                   Used for Report  Query to track how many visitors hiked each trail in each park.
-- **********************************************************************************************--
select pk.pName as "Park Name", t.tName as "Trail Name", count(*)
FROM Visitors v
INNER JOIN Trails t ON v.trailID = t.trailID
INNER JOIN People p ON p.personID = t.visitorID
INNER JOIN Parks pk ON pk.parKID = t.parkID
group by pk.pName, t.tName
order by "Park Name" ASC
;

-- ********************************************************************************


-- **********************************************************************************
--  ***  Used as a report   SQL statements: List the trails by Difficulty                      ***  ----
--  TO DO ADD IN who did it faster --
-- **********************************************************************************

--   CREATE OR REPLACE VIEW TrailDifficulty AS
select pk.pName as "Park Name", t.tName as "Trail Name", df.diffLevel as "Difficulty Level", df.diffDesc as "Difficulty Descripiton" 
FROM Trails t
INNER JOIN DifficultyLevel df ON df.difficultyID = T.difficultyID
INNER JOIN Parks pk ON pk.parkID = t.parkID
ORDER BY pk.pName ASC
;

-- **************************************************************************************************

-- Stored Procedures --

-- Calculate Average age of Visitors to parks
DROP FUNCTION averageAgeOfVisitors(refcursor);
CREATE OR REPLACE FUNCTION averageAgeOfVisitors (REFCURSOR) returns refcursor AS 
$$
DECLARE
      resultset REFCURSOR := $1;
BEGIN
   OPEN resultset for
      select avg(p.ageYrs) as "average age"
      from people p
      ;
      
   return resultset;
END;
$$
LANGUAGE PLPGSQL;

select averageAgeOfVisitors('results');
fetch all from results;

-- *******************************************************************************************
--  *** SQL statements: Views  Stored Procedures With Trigger                        ***  ----
-- List of trails and their locations and distances. Joins trails, cities, states, wayPoints
-- Valid Data Checks to make sure a Trail distance is entered.
-- ********************************************************************************************
CREATE OR REPLACE FUNCTION ValidTrailData() returns TRIGGER AS 
$$

BEGIN
   IF NEW.trailDistanceMiles IS NULL THEN
   		RAISE EXCEPTION 'DANGER WILL ROBINSON!!!  Trail Distance cannot be NULL. Please try again.';
   END if;
   RETURN NEW;   
      
END;
$$
LANGUAGE PLPGSQL;

-- Runs the Trigger
CREATE TRIGGER ValidTrailData
BEFORE INSERT OR UPDATE ON Trails
FOR EACH ROW
EXECUTE PROCEDURE ValidTrailData();


-- Test of the Trigger


INSERT INTO Trails(  trailID, parkID, visitorID,  maxElevationFt, elevationGainFt, avgHikeTimeHrs, difficultyID )
VALUES('T04','P05', 2, 1617, 973, 3.1, 9 );

--  **************************************************************************


-- Grant and Revoke Access --

CREATE ROLE TrailAdmin;
GRANT SELECT INSERT UPDATE DELETE ON ALL TABLES IN SCHEMA PUBLIC
TO TrailAdmin;

CREATE ROLE Visitor;
GRANT SELECT INSERT UPDATE ON Visitors, People IN SCHEMA PUBLIC
TO Visitor;





