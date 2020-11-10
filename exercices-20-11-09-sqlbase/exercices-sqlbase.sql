
-- 3. Créer une base de données ‘netflix’ 


CREATE DATABASE netflix;

USE netflix;


-- 4. Créer une table appelée ‘netflix_title’, importer les données provenant du fichier netflix_titles.csv 


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


-- 5. Créer une table appelée ‘netflix_shows’ provenant du fichier Netflix Shows.csv Avec la table netflix_titles 


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


-- 6. Afficher tous les titres de films de la table netflix_titles dont l’ID est inférieur strict à 80000000 


SELECT TITLE
FROM NETFLIX_TITLE
WHERE SHOW_ID < 80000000


-- 7. Afficher toutes les durée des TV Show 


SELECT title, duration
FROM netflix_title
WHERE TYPE = "TV SHOW"


-- 9. Afficher tous les noms de films communs aux 2 tables (netflix_titles et netflix_shows) 

SELECT ns.title
FROM netflix_shows ns
INNER JOIN netflix_title nt 
ON ns.title = nt.title
GROUP BY title
ORDER BY title
;

-- 10. Calculer la durée totale de tous les TV Show de votre table netflix_titles 

SELECT SUM(duration)
FROM netflix_title NT
WHERE type = "movie"
;

-- 11. Compter le nombre de TV Shows de votre table ‘netflix_shows’ dont le ‘ratingLevel’ est renseigné. 

SELECT count(title)
FROM netflix_shows       
WHERE rating_level IS NOT NULL # Si on a pas preciser not null dans la creation

-- OR

SELECT count(title)
FROM netflix_shows
WHERE rating_level NOT IN    # Si on a preciser not null dans la creation
	(SELECT rating_level 
	FROM netflix_shows 
	WHERE rating_level = "")
;

-- 12. Compter les films et TV Shows pour lesquels les noms (title) sont les mêmes sur les 2 tables et dont le ‘release year’ est supérieur à 2016.

SELECT count(ns.title)
FROM netflix_shows ns
INNER JOIN netflix_title nt 
ON ns.title = nt.title
WHERE nt.release_year > 2016

-- 13. Supprimer la colonne ‘rating’ de votre table ‘netflix_shows’ 

ALTER TABLE netflix.netflix_shows DROP COLUMN rating;

-- 14. Supprimer les 100 dernières lignes de la table ‘netflix_shows’ 

DELETE FROM netflix_shows
ORDER BY id DESC LIMIT 100

-- 15. Le champs “ratingLevel” pour le TV show “Marvel's Iron Fist” de la table ‘netflix_shows’ est vide, pouvez-vous ajouter un commentaire ? 

UPDATE netflix_shows
SET rating_level = "Ceci est un commentaire :)"
WHERE title = "Marvel's Iron Fist"

/*
-- 17. Modéliser (Merise) votre Base de données netflix. Que pouvez-vous dire de cette modélisation ?


Voir mcd_sqlbase.jpg
	 mld_sqlbase.md

Notre base ne contient que deux table, cependant on constate que Netflix_shows depend de Netflix_Title,
donc la Primary Key de Netflix_Title (title) se retrouve en temps que Foreign Key dans Netflix_Shows.
Il aurait été bien de mettre Show_ID dans les deux tables, les clefs serait bien plus logique vu que Netflix_Show
possède des doublons au niveau des titres.

*/