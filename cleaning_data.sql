-- Inspecting data for the errors ----------------------------------------------------------

# Finding duplicates in primary key
select count(*)
from tripdata
group by ride_id
having count(*) > 1;

select count(*), count(distinct ride_id)
from tripdata;

 
# Finding NULL data 
SELECT 
    count(1)
FROM
    tripdata
WHERE
    ride_id IS NULL;

SELECT DISTINCT
    rideable_type
FROM
    tripdata;

SELECT 
    COUNT(1)
FROM
    tripdata
WHERE
    started_at IS NULL OR ended_at IS NULL; 

SELECT 
    COUNT(1)
FROM
    tripdata
WHERE
    start_station_name IS NULL OR end_station_name IS NULL; # 781773 null valies spotted

SELECT DISTINCT
    member_casual
FROM
    tripdata;


# Inspecting a data range
SELECT 
    started_at
FROM
    tripdata
ORDER BY started_at ASC
LIMIT 1;

SELECT 
    started_at
FROM
    tripdata
ORDER BY started_at DESC
LIMIT 1;

SELECT 
    ended_at
FROM
    tripdata
ORDER BY ended_at ASC
LIMIT 1;

SELECT 
    ended_at
FROM
    tripdata
ORDER BY ended_at DESC
LIMIT 1;



-- Adding new columns may be useful for further analsis ----------------------------------------------

# Creating tripduration_sec columns 
ALTER TABLE tripdata
ADD tripduration_sec BIGINT AFTER ended_at;

UPDATE tripdata
SET tripduration_sec = TIMESTAMPDIFF(SECOND, started_at, ended_at);
        
        
# Creating column called day_of_week, which stores data of day of week when each ride is started
AlTER TABLE tripdata
ADD day_of_week INT AFTER started_at;

UPDATE tripdata 
SET day_of_week = WEEKDAY(started_at);


#　Creating columns for values separated from started_at column, such as year, month, day, hour.
ALTER TABLE tripdata
ADD year INT AFTER day_of_week, 
ADD month INT AFTER year, 
ADD day INT AFTER month, 
ADD hour INT AFTER day;

UPDATE tripdata
SET 
	year = YEAR(started_at),
    month = MONTH(started_at),
    day = DAY(started_at),
    hour = HOUR(started_at);
        
        
# Creting column called triplength which represents triplength in HH:MM:SS format
/* 
 * In order to format tripduration to TIME type, 'HH:MM:DD', its column type has limited ranges from 838:59:59 to -838:59:59, 
 * which is maximum 3020399 and minimum -3020399 in seconds.
 */
 SELECT 
    *
FROM
	tripdata
WHERE
    tripduration_sec >= 3020399; 
 /* 
  * After inspecting tripduration_sec column, we found 4 rows with values more than 3020399 seconds.
  * To format the entire column to HH:MM:DD, we will delete the 4 rows rows
  * To keep the original dataset as it is, we will first create a new table called, cleaned_tripdata, contains same data as the original.
  */
  
CREATE TABLE cleaned_tripdata AS (
SELECT * FROM tripdata);
    
DELETE FROM cleaned_tripdata
WHERE
    tripduration_sec >= 3020399;

### creating tripduration column 
ALTER TABLE cleaned_tripdata
ADD tripduration TIME AFTER tripduration_sec;

UPDATE cleaned_tripdata 
SET tripduration = SEC_TO_TIME(tripduration_sec);



-- Cleaning data --------------------------------------------------------------------------

# Removing duplicate row in primary key 
CREATE TABLE temp LIKE cleaned_tripdata;

ALTER TABLE temp 
ADD rn INT;

INSERT INTO temp 
SELECT 
	*,
	ROW_NUMBER() OVER (PARTITION BY ride_id) AS rn
FROM 
	cleaned_tripdata;

DELETE FROM temp 
WHERE rn >1;

DROP TABLE cleaned_tripdata;

RENAME TABLE temp TO cleaned_tripdata;

ALTER TABLE cleaned_tripdata
DROP rn;
				
           
# Removing Nulls values in start_station_name and end_station_name columns           
DELETE FROM cleaned_tripdata
WHERE start_station_name IS NULL OR end_station_name IS NULL;


# Cleaning entries where tripduration is less than or equal to 0 
DELETE FROM cleaned_tripdata 
WHERE
    tripduration <= 0;


# Fixing latitude and longitude of start station and end station
CREATE TEMPORARY TABLE avg_start_lat_lng AS(
	SELECT 
		DISTINCT start_station_name,
		ROUND(AVG(start_lat), 6) s_lat,
		ROUND(AVG(start_lng), 6) s_lng
	FROM 
		cleaned_tripdata
	GROUP BY start_station_name
);

CREATE TABLE cleaned_tripdata_v2 AS (
	SELECT 
		a.ride_id,
        a.bike_type,
        a.started_at,
        a.day_of_week,
        a.year,
        a.month,
        a.day,
        a.hour,
        a.ended_at,
        a.tripduration_sec,
        a.tripduration,
        a.start_station_name,
        a.start_station_id,
        a.end_station_name,
        a.end_station_id,
        b.s_lat AS start_lat,
        b.s_lng AS start_lng,
        a.end_lat,
        a.end_lng,
        a.user_type
	FROM 
		cleaned_tripdata a
	INNER JOIN avg_start_lat_lng b
		ON a.start_station_name = b.start_station_name
);

CREATE TEMPORARY TABLE avg_end_lat_lng AS(
	SELECT 
		DISTINCT end_station_name,
		ROUND(AVG(end_lat), 6) e_lat,
		ROUND(AVG(end_lng), 6) e_lng
	FROM 
		cleaned_tripdata_v2
	GROUP BY end_station_name
);

CREATE TABLE cleaned_tripdata_v3 AS (
	SELECT 
		a.ride_id,
        a.bike_type,
        a.started_at,
        a.day_of_week,
        a.year,
        a.month,
        a.day,
        a.hour,
        a.ended_at,
        a.tripduration_sec,
        a.tripduration,
        a.start_station_name,
        a.start_station_id,
        a.end_station_name,
        a.end_station_id,
        a.start_lat,
        a.start_lng,
        b.e_lat AS end_lat,
        b.e_lng AS end_lng,
        a.user_type
	FROM 
		cleaned_tripdata_v2 a
	INNER JOIN avg_end_lat_lng b
		ON a.end_station_name = b.end_station_name
);

DROP TABLE cleaned_tripdata;

DROP TABLE cleaned_tripdata_v2;

ALTER TABLE cleaned_tripdata_v3 
RENAME TO cleaned_tripdata;


# Noticed string variables of member_casual column had '\r' at the end, which would cause error when filtering data
update cleaned_tripdata
set member_casual = replace(member_casual, '\r', ''); 


# Renaming columns to make them easier to comprehend
ALTER TABLE cleaned_tripdata
CHANGE rideable_type bike_type VARCHAR(45),
CHANGE member_casual user_type VARCHAR(45);

