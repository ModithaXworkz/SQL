CREATE DATABASE movies;

USE movies;

CREATE TABLE movies_details(
id INT,
name VARCHAR(25) UNIQUE NOT NULL,
year YEAR,
lang VARCHAR(25) NOT NULL,
director VARCHAR(25),
platform VARCHAR(25) DEFAULT'Theaters',
budget DOUBLE,
collections DOUBLE,
ratings FLOAT CHECK(ratings>0 AND ratings<10.0),
PRIMARY KEY(id)
);

DESC movies_details;

SELECT * FROM movies_details;

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(1,'GGVV',2021,'Kannada','Raj B Shetty',10000,30000,9.4);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(2,'ASN',2019,'Kannada','Sachin',50000,40000,7.9);

INSERT INTO movies_details VALUE(3,'Ratnan Prapancha',2021,'Kannada','Rohith','Amazon Prime',20000,60000,9.6);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(4,'KGF',2018,'Kannada','Prashanth Neel',20000,50000,9.1);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(5,'Yuvaratna',2021,'Kannada','Santosh Anand Ram',50000,80000,9.0);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(6,'Suryavamshi',2021,'Hindi','Akshay',30000,90000,6.2);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(7,'Pushpa',2021,'Telugu','Arvinfd',50000,10000,5.5);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(8,'Dia',2020,'Kannada','Ashok',90000,70000,9.9);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(9,'Love Mocktail',2020,'Kannada','Darling Krishna',90000,80000,9.6);

INSERT INTO movies_details(id,name,year,lang,director,budget,collections,ratings) VALUE(10,'Ninna Sanihake',2021,'Kannada','Ravi',80000,70000,9.8);

SELECT * FROM movies_details WHERE ratings>=8 AND platform='Amazon Prime';

SELECT * FROM movies_details WHERE platform='Netflix' OR platform='Amazon Prime';

SELECT * FROM movies_details WHERE lang='Kannada';

SELECT * FROM movies_details WHERE director='Raj B Shetty'

OR director='Rohith' OR director='Sachin' OR director='Prashanth Neel';

SELECT * FROM movies_details WHERE director IN ('Raj B Sheety','Sachin','Rohith','Prashanth Neel');

SELECT * FROM movies_details WHERE year=2020;

SELECT * FROM movies_details WHERE year>2000 AND year<=2020;


SELECT * FROM movies_details WHERE year BETWEEN 2000 AND 2020;

SELECT name FROM movies_details;

SELECT director FROM movies_details;

SELECT DISTINCT director FROM movies_details;

SELECT DISTINCT director,year FROM movies_details;

SELECT * FROM movies_details ORDER BY year;

SELECT * FROM movies_details ORDER BY ratings DESC;

INSERT INTO movies_details(id,name,year,lang,budget,collections,ratings) VALUE(11,'Avatar',2006,'English',82000,96000,9.5);
SELECT * FROM movies_details WHERE director IS NULL;

SELECT * FROM movies_details WHERE director IS NOT NULL;

ALTER  TABLE movies_details MODIFY COLUMN platform VARCHAR(20)NOT NULL;

ALTER TABLE movies_details ADD PRIMARY KEY(ID);

DELETE FROM movies_details WHERE name='Pushpa';

DELETE FROM movies_details WHERE name='Avatar' AND year=2008;

TRUNCATE TABLE series_details;

DROP TABLE series_details;

DROP DATABASE series_details;

SELECT * FROM movies_details LIMIT 5;

SELECT * FROM movies_details ORDER BY id DESC LIMIT 5;

SELECT * FROM movies_details WHERE name LIKE '%prapancha';

SELECT * FROM movies_details WHERE name LIKE 'gg%';

SELECT * FROM movies_details WHERE name LIKE '%ratnan%';

SELECT * FROM movies_details WHERE director LIKE '%Anand%';

SELECT * FROM movies_details WHERE name LIKE '_g%';

SELECT * FROM movies_details WHERE name LIKE 'A_A%';

SELECT * FROM movies_details WHERE name LIKE '_U__A%';
-- Alias--
SELECT name AS movies_name FROM movies_details;

SELECT collections AS total_movie_collections FROM movies_details;

SELECT movies_details.name,movies_details.director FROM movies_details;

SELECT M.name,M.director FROM movies_details M;

SELECT MAX(collections) AS Highest_Movie_Collection FROM movies_details;

SELECT MAX(budget) AS Highest_Movie_Budget FROM movies_details;

SELECT MIN(collections) AS Lowest_Movie_Collection FROM movies_details;

SELECT MIN(budget) AS Lowest_Movie_Budget FROM movies_details;

SELECT AVG(collections) AS Average_Movie_Collection FROM movies_details;

SELECT SUM(collections) AS Total_Movie_Collection FROM movies_details;

SELECT COUNT(name) AS No_of_Movies FROM movies_details;

SELECT COUNT(director) AS No_of_directors FROM movies_details;

SELECT COUNT(*) AS No_of_Movies FROM movies_details;

SELECT COUNT(DISTINCT director) AS No_of_Movies_By_Unique_Directors FROM movies_details;

SELECT COUNT(DISTINCT lang) AS No_of_Movies_By_Unique_lang FROM movies_details;
-- Current date
SELECT CURDATE() AS Present_Date;

SELECT CURTIME() AS Present_Time;

SELECT NOW() AS Present_Date_Time;

INSERT INTO movies_details VALUE(now());

DESC movies_details;

INSERT INTO movies_details(id,name,lang,platform,released_date_time)VALUE(12,'Badava Rascal','kannada','Theaters','2021-12-24 11:05:05');

INSERT INTO movies_details(id,name,lang,platform,released_date_time)VALUE(13,'Spider Man','English','Theaters',NOW());

SELECT name,DATE(released_date_time) FROM movies_details WHERE id=12;

SELECT name,Time(released_date_time)AS release_time FROM movies_details WHERE id=12;

SELECT name,MONTHNAME(released_date_time) FROM movies_details WHERE id=12;

SELECT name,Year(released_date_time) FROM movies_details WHERE id=12;

SELECT name,DAYName(released_date_time) FROM movies_details WHERE id=12;

SELECT name,Hour(released_date_time) FROM movies_details WHERE id=12;

SELECT name,Minute(released_date_time) FROM movies_details WHERE id=12;

SELECT name,Second(released_date_time) FROM movies_details WHERE id=12;
-- no of movies in each year
SELECT COUNT(name) AS No_of_Movies_In_2021, year FROM movies_details WHERE YEAR=2021; 
-- no of movies done by each year
SELECT COUNT(name) AS No_of_Movies_In_each_year, year FROM movies_details GROUP BY year ; 
-- no of movies done by each director
SELECT COUNT(name) AS No_of_Movies_By_each_Director,director from movies_details GROUP BY director;
-- no of movies available in each platform
SELECT COUNT(name) AS No_of_Movies_By_Platform,platform FROM movies_details GROUP BY platform;
-- no of movies done in each month
SELECT COUNT(name) AS No_of_Movies_By_Month,MONTHNAME(released_date_time) AS released_month FROM movies_details GROUP BY released_month;
-- no of movies done in each lang
SELECT COUNT(name) AS No_of_Movies_By_Lang,lang from movies_details GROUP  BY lang;
-- no of movies by each year and director
SELECT COUNT(name) AS No_of_Movies_By_Year_And_Director,year,director FROM  movies_details GROUP BY year,director;
-- highest collections done in each year
SELECT MAX(collections) AS Highest_Collection_By_Year,year FROM movies_details GROUP BY year ORDER BY Highest_Collection_By_Year DESC;
-- highest ratings in each  platform order by rating desc
SELECT MAX(ratings) AS Highest_Rating_By_Platform,platform FROM movies_details GROUP BY platform ORDER BY Highest_Rating_By_Platform DESC;
-- lowest collection done in each year
SELECT MIN(collections) AS Lowest_Collection_By_year,year FROM movies_details GROUP BY year ORDER BY Lowest_Collection_By_Year;
-- lowest budget by each director
SELECT MIN(budget) AS Lowest_Budget_By_Director,director FROM movies_details GROUP BY director ORDER BY Lowest_Budget_By_Director;
-- total collections done by each platform order by collections in desc
SELECT SUM(collections)AS Total_Collections_By_Platform,platform FROM movies_details GROUP BY platform  ORDER BY Total_Collections_By_Platform DESC;
-- average collection by each year
SELECT AVG(collections) AS Average_Collection_By_Year,year FROM movies_details GROUP BY year ORDER BY Average_Collection_By_Year;
-- average collection by selected director
SELECT AVG(collections) AS Average_Collection_By_Director,director FROM movies_details WHERE director IN('Akshay','Rohith','Sachin') GROUP BY director;
-- average collection by each director having collections greater than 50thousand
SELECT AVG(collections) AS Average_Collection_By_Director,director FROM movies_details GROUP BY director HAVING Average_Collection_By_Director>50000 ;
-- total collections by each director having total lesser than 90000
SELECT SUM(collections)AS Total_Collection_By_Director,director FROM movies_details GROUP BY director HAVING Total_Collection_By_Director<90000;

SELECT MAX(collections)FROM movies_details;
SELECT  * FROM movies_details WHERE collections=96000;
-- get the details of the movie which has the highest collection
-- outer query                                  -- inner query
SELECT  * FROM movies_details WHERE collections=(SELECT MAX(collections)FROM movies_details);

-- second highest collection of the movie
-- get the details of the movie which has the second highest collection
SELECT MAX(collections) AS Second_Highest_Collection FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details);
SELECT  * FROM movies_details WHERE collections=(SELECT MAX(collections) AS Second_Highest_Collection FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details));

-- get the third highest collection
SELECT MAX(collections) AS Third_Highest_Collection FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details));
;
SELECT  * FROM movies_details WHERE collections=(SELECT MAX(collections) AS Third_Highest_Collection FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details)));

-- second highest collection of the movie in kannada lang
SELECT * FROM movies_details WHERE lang='Kannada';
SELECT MAX(collections)AS Second_Highest_Collection_In_Kannada  FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details  WHERE lang='Kannada')AND lang='Kannada';

-- Get the details of the movie which has the second highest collection in kannnada lang
SELECT* FROM movies_details WHERE collections=(SELECT MAX(collections)AS Second_Highest_Collection_In_Kannada  FROM movies_details WHERE collections<(SELECT MAX(collections)FROM movies_details  WHERE lang='Kannada'));

-- get the movie details which has lowest collection 
SELECT * FROM movies_details WHERE collections=(SELECT MIN(collections)FROM movies_details);

-- get the details of the movies which has both highest and lowest
SELECT * FROM movies_details WHERE collections IN ((SELECT MAX(collections)FROM movies_details),(SELECT MIN(collections)FROM movies_details)) ;

-- get the movies details which has the highest collection done by each director
SELECT MAX(collections),director FROM movies_details GROUP BY director;
SELECT * FROM movies_details WHERE collections IN (SELECT MAX(collections) FROM movies_details GROUP BY director);

-- get the movies details which has the highest collection done by each director having greater than 10000
SELECT * FROM movies_details WHERE collections IN (SELECT MAX(collections) FROM movies_details GROUP BY director HAVING MAX(collections)>50000);

CREATE TABLE movies_details_duplicate(
id INT,
name VARCHAR(25) UNIQUE NOT NULL,
year YEAR,
lang VARCHAR(25) NOT NULL,
director VARCHAR(25),
platform VARCHAR(25) DEFAULT'Theaters',
budget DOUBLE,
collections DOUBLE,
ratings FLOAT CHECK(ratings>0 AND ratings<10.0),
PRIMARY KEY(id)
);

ALTER TABLE movies_details_duplicate ADD COLUMN released_data_time DATETIME;

SELECT * FROM movies_details_duplicate;

INSERT INTO movies_details_duplicate SELECT * FROM movies_details WHERE id  IN (SELECT id FROM movies_details);

-- update the rating as 9 for movies the highest collection done by each director
UPDATE movies_details SET ratings=9 WHERE collections IN(SELECT MAX(collections) FROM movies_details_duplicate GROUP BY director);

DELETE FROM movies_details WHERE id IN(select id FROM movies_details_duplicate WHERE id>11);







