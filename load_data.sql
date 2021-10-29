-- Loading datasets --------------------------------------------------------------------------------------------------

CREATE TABLE `table`.`tripdata202010` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202010-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202010`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;


CREATE TABLE `table`.`tripdata202011` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202011-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202011`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;               


CREATE TABLE `table`.`tripdata202012` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202012-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202012`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;

CREATE TABLE `table`.`tripdata202101` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202101-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202101`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;


CREATE TABLE `table`.`tripdata202102` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202102-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202102`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;


CREATE TABLE `table`.`tripdata202103` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202103-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202103`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;


CREATE TABLE `table`.`tripdata202104` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202104-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202104`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;


CREATE TABLE `table`.`tripdata202105` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202105-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202105`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;


CREATE TABLE `table`.`tripdata202106` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202106-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202106`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;


CREATE TABLE `table`.`tripdata202107` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202107-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202107`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;


CREATE TABLE `table`.`tripdata202108` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202108-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202108`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;


CREATE TABLE `table`.`tripdata202109` (
  `ride_id` VARCHAR(50),
  `rideable_type` VARCHAR(45),
  `started_at` TIMESTAMP,
  `ended_at` TIMESTAMP,
  `start_station_name` VARCHAR(100),
  `start_station_id` VARCHAR(45),
  `end_station_name` VARCHAR(100),
  `end_station_id` VARCHAR(45),
  `start_lat` DOUBLE,
  `start_lng` DOUBLE,
  `end_lat` DOUBLE,
  `end_lng` DOUBLE,
  `member_casual` VARCHAR(45));

LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Desktop/coursera/case_study/202109-divvy-tripdata.csv' IGNORE 
INTO TABLE `table`.`tripdata202109`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SET
ride_id = NULLIF(ride_id,''),
rideable_type = NULLIF(rideable_type,''),
start_station_name = NULLIF(start_station_name,''),
start_station_id = NULLIF(start_station_id,''),
end_station_name = NULLIF(end_station_name,''),
end_station_id = NULLIF(end_station_id,''),
member_casual = NULLIF(member_casual, '')
;

-- Merging 12 months of tripdata ---------------------------------------------------------------------------------------

create table `table`.`tripdata` as (
	select * from `table`.`tripdata202010`
    union all
    select * from `table`.`tripdata202011`
    union all
    select * from `table`.`tripdata202012`
    union all
    select * from `table`.`tripdata202101`
    union all
    select * from `table`.`tripdata202102`
    union all
    select * from `table`.`tripdata202103`
    union all
    select * from `table`.`tripdata202104`
    union all
    select * from `table`.`tripdata202105`
    union all
    select * from `table`.`tripdata202106`
    union all
    select * from `table`.`tripdata202107`
    union all
    select * from `table`.`tripdata202108`
    union all
    select * from `table`.`tripdata202109`
);


