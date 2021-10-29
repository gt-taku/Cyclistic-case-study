-- Conduncting descriptive analysis --------------------------------------------



-- Analyzing proportion of each user type used Cyclistics bike sharing service for the past 12 months -----------------

SELECT 
    user_type,
    COUNT(*) number_of_ride,
    COUNT(*) / (SELECT 
            COUNT(*)
        FROM
            cleaned_tripdata) AS proportion
FROM
    cleaned_tripdata
GROUP BY user_type;




-- Analyze average trip duration by time and the user type  ------------------------------------------------------------------

SELECT 
    user_type,
    hour,
    FLOOR(AVG(TIME_TO_SEC(tripduration))) AS avg_trip_duration
FROM
    cleaned_tripdata
GROUP BY user_type , hour
ORDER BY hour;




-- Analyze the most used station to start ride by user type ---------------------------------------------------------------
 
# the most popular station by casual user
SELECT 
    user_type,
    start_station_name,
    start_lat,
    start_lng,
    COUNT(*) ridership,
    ROUND(COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    cleaned_tripdata
                WHERE
                    user_type = 'casual') * 100,
            4) `proportion(%)`
FROM
    cleaned_tripdata
GROUP BY user_type , start_station_name , start_lat , start_lng
HAVING user_type = 'casual'
ORDER BY ridership DESC;


# the most popular station by member
SELECT 
    user_type,
    start_station_name,
    start_lat,
    start_lng,
    COUNT(*) ridership,
    ROUND(COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    cleaned_tripdata
                WHERE
                    user_type = 'member') * 100,
            4) `proportion(%)`
FROM
    cleaned_tripdata
GROUP BY user_type , start_station_name , start_lat , start_lng
HAVING user_type = 'member'
ORDER BY ridership DESC;




-- Analyze the popular destination by user type ---------------------------------------------------------------

# the most popular destination by casual user
SELECT 
    user_type,
    end_station_name,
    end_lat,
    end_lng,
    COUNT(*) ridership,
    ROUND(COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    cleaned_tripdata
                WHERE
                    user_type = 'casual') * 100,
            4) `proportion(%)`
FROM
    cleaned_tripdata
GROUP BY user_type , end_station_name , end_lat , end_lng
HAVING user_type = 'casual'
ORDER BY ridership DESC;

# the most popular destination by member
SELECT 
    user_type,
    end_station_name,
    end_lat,
    end_lng,
    COUNT(*) ridership,
    ROUND(COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    cleaned_tripdata
                WHERE
                    user_type = 'member') * 100,
            4) `proportion(%)`
FROM
    cleaned_tripdata
GROUP BY user_type , end_station_name , end_lat , end_lng
HAVING user_type = 'member'
ORDER BY ridership DESC;




-- Analyze seasonal trend by user type  ---------------------------------------------------------------------

SELECT 
    user_type, year, month, COUNT(*) number_of_ride_per_month
FROM
    cleaned_tripdata
GROUP BY user_type , year , month
ORDER BY year , month;




-- Compare seasonal trend with COVID-19 case counts in Chicago -------------------------------------------------
/* 
 * To make comparison between how sensitive is each user to a fluctuation of number of case of COVID-19 in Chicago,
 * we will use this dataset on Chicago data portal website,
 * the dataset is collected by Illinois National Electronic Disease Surveillance System, Cook County Medical Examiner’s Office, Illinois Vital Records, American Community Survey (2018)
 * Here, take a look at the explanation of metrics used in the dataset, and here is the licese.
 */
 
 ## loading COVID-19 datasets
 CREATE TABLE `table`.`covid_19` (
  `zip_code` INT NULL,
  `week_num` INT NULL DEFAULT NULL,
  `wee_start` TEXT NULL DEFAULT NULL,
  `week_end` TEXT NULL DEFAULT NULL,
  `cases_weekly` INT NULL DEFAULT NULL,
  `cases_cumulative` INT NULL,
  `case_rate` INT NULL,
  `test_weekly` INT NULL,
  `test_cumulative` INT NULL,
  `test_rate` INT NULL,
  `test_rate_cumulative` INT NULL,
  `positve_rate` INT NULL,
  `positive_cumulative` INT NULL,
  `death_weekly` INT NULL,
  `death_cumulative` INT NULL,
  `death_rate` INT NULL,
  `death_rate_cumulative` INT NULL,
  `pop` INT NULL,
  `row_id` VARCHAR(45) NULL DEFAULT NULL,
  `zip_code_loc` VARCHAR(45) NULL);
  
LOAD DATA LOCAL INFILE '/Users/ushijimatakurou/Downloads/COVID-19_Cases__Tests__and_Deaths_by_ZIP_Code.csv' IGNORE 
INTO TABLE `table`.`covid_19`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

/*
 * combining trip data dataset and COVID-19 datasets using inner join took forever to get the result, 
 * so I decided to create temporary tables above for each datasets which contain only columns I need to join tables.
 */
create temporary table trip_temp as (
  select
    user_type,
    yearweek(started_at) yearweek, #### using function, yearweek(), which returns year of the date and week number
    count(*) number_of_ride_per_week
  from 
    cleaned_tripdata
  group by user_type, yearweek
  );
  
create temporary table case_temp as (
  select 
    str_to_date(week_start, '%m/%d/%Y') date,
    yearweek(str_to_date(week_start, '%m/%d/%Y')) yearweek,
    sum(cases_weekly) number_of_case_per_week
  from 
    covid_19
  group by date, yearweek
  );

### we are going to combine created temporary tables of both tripd ata and COVID-19 data by joining two tables by INNER JOIN statement using yearweek as a key.
SELECT 
    a.user_type,
    b.date,
    a.yearweek,
    a.number_of_ride_per_week,
    b.number_of_case_per_week
FROM
    trip_temp a
        INNER JOIN
    case_temp b ON a.yearweek = b.yearweek
ORDER BY a.yearweek;




-- Find out most popular day in a week ---------------------------------------------------------

SELECT 
    user_type,
    CASE
        WHEN day_of_week = 0 THEN 'Monday'
        WHEN day_of_week = 1 THEN 'Tuesday'
        WHEN day_of_week = 2 THEN 'Wednesday'
        WHEN day_of_week = 3 THEN 'Thursday'
        WHEN day_of_week = 4 THEN 'Friday'
        WHEN day_of_week = 5 THEN 'Saturday'
        WHEN day_of_week = 6 THEN 'Sunday'
    END AS day_of_week,
    COUNT(*) AS count
FROM
    cleaned_tripdata
GROUP BY user_type , day_of_week
ORDER BY user_type , count DESC;


  

-- Find out most popular time in a day --------------------------------------------------------


SELECT 
    user_type,
    hour,
    CASE
        WHEN hour BETWEEN 0 AND 5 THEN 'midnight'
        WHEN hour BETWEEN 6 AND 11 THEN 'morning'
        WHEN hour BETWEEN 12 AND 17 THEN 'afternoon'
        ELSE 'night'
    END AS time_period,
    COUNT(*) / TIMESTAMPDIFF(DAY,
        MIN(started_at),
        MAX(started_at)) avg_ridership
FROM
    cleaned_tripdata
GROUP BY user_type , hour
ORDER BY user_type , avg_ridership DESC;




