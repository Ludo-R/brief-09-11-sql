
-- 3. Create a "netflix" database 


CREATE DATABASE netflix;

USE netflix;


-- 4. Create a table called "netflix_title", import the data from the netflix_titles.csv file


CREATE TABLE netflix_title (
show_id int(9)
,type varchar(8)
,title varchar(105)
,director varchar(209)
,cast varchar(772)
,country varchar(124)
,date_added varchar(20)
,release_year int(4)
,rating varchar(9)
,duration varchar(11)
,listed_in varchar(80)
,description varchar(251)
);

LOAD DATA LOCAL INFILE '/home/randon/exercices/exercices-20-11-09-sqlbase/dataset/netflix_titles.csv'
INTO TABLE netflix_title
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;


-- 5. Create a table called 'netflix_shows' from the Netflix Shows.csv file With the netflix_titles table


CREATE TABLE netflix_shows(
title varchar(64),
rating varchar(9),
rating_level varchar(126),
rating_description varchar(3),
release_year int,
user_rating_score int,
user_rating_size int
);

LOAD DATA LOCAL INFILE '/home/randon/exercices/exercices-20-11-09-sqlbase/dataset/Netflix_Shows.csv'
INTO TABLE netflix_shows
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;


-- 6. Show all movie titles from the netflix_titles table whose ID is strict less than 80,000,000


SELECT TITLE
FROM NETFLIX_TITLE
WHERE SHOW_ID < 80000000


-- 7. Show all TV Show times


SELECT title, duration
FROM netflix_title
WHERE TYPE = "TV SHOW"


-- 9. Display all the movie names common to the 2 tables (netflix_titles and netflix_shows)

SELECT ns.title
FROM netflix_shows ns
INNER JOIN netflix_title nt 
ON ns.title = nt.title
GROUP BY title
ORDER BY title
;

-- 10. Calculate the total duration of all the TV Shows in your netflix_titles table

SELECT SUM(duration)
FROM netflix_title NT
WHERE type = "movie"
;

-- 11. Count the number of TV Shows in your "netflix_shows" table for which the "ratingLevel" is entered.

SELECT count(title)
FROM netflix_shows       
WHERE rating_level IS NOT NULL # If we did not specify not null in the creation

-- OR

SELECT count(title)
FROM netflix_shows
WHERE rating_level NOT IN    # If we specify not null in the creation
	(SELECT rating_level 
	FROM netflix_shows 
	WHERE rating_level = "")
;


-- 12. Count the films and TV Shows for which the names (title) are the same on the 2 tables and whose ‘release year’ is greater than 2016


SELECT count(ns.title)
FROM netflix_shows ns
INNER JOIN netflix_title nt 
ON ns.title = nt.title
WHERE nt.release_year > 2016

-- 13. Delete the "rating" column from your "netflix_shows" table

ALTER TABLE netflix.netflix_shows DROP COLUMN rating;

-- 14. Delete the last 100 rows of the 'netflix_shows' table

DELETE FROM netflix_shows
ORDER BY id DESC LIMIT 100

-- 15. The “ratingLevel” field for the TV show “Marvel's Iron Fist” in the ‘netflix_shows’ table is empty, can you add a comment?


UPDATE netflix_shows
SET rating_level = "Ceci est un commentaire :)"
WHERE title = "Marvel's Iron Fist"

/*
-- 17. Model (Merise) your netflix database. What can you say about this modeling?


See mcd_sqlbase.jpg
mld_sqlbase.md

Our database only contains two tables, however we see that Netflix_shows depends on Netflix_Title,
therefore the Primary Key of Netflix_Title (title) is found as Foreign Key in Netflix_Shows.
It would have been nice to put Show_ID in both tables, the keys would be much more logical since Netflix_Show
has duplicate titles.

*/