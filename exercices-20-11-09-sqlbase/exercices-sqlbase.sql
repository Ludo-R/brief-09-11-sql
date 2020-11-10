/*

1. Réaliser une veille sur les les différents SGBD. Proposer un exemple concret d’utilisation pour argumenter vos explications.

- Base de données hiérarchique

	 C'est une base de donnée qui se base sur la hiérachie avec des restrictions.
	 Exemple => une base de donnée animal > Le "Canard" appartient à la famille des "Volailles" qui appartient à la famille des "Terrestres"


- Base de données réseau

	 Meme chose que les base de donnée hiérachique sauf que le peut faire des associations, afin de lever les restrictions.


- Base de données orientée texte

	 Se presente sous la forme d'un fichier texte possédant une seul entrée par ligne => Exemple : Un fichier texte contenant une liste de titres de livres


- Base de données SQL (relationnelle)

	 Se presente sous la forma d'un modèle avec différente table => Exemple : Gestion administrative d'une société .


- Base de données distribuée

	 Est une base de données dont la gestion est traitée par un réseau d'ordinateurs interconnectés qui stockent des données de manière distribuée.


- Base de données cloud

	 Dans un modèle de Cloud traditionnel, une base de données s'exécute via une machine virtuelle.


- Base de données NoSQL

	 NoSQL désigne une famille de systèmes de gestion de base de données (SGBD) qui s'écarte du paradigme classique des bases relationnelles.


- Base de données orientée objets

     Dans une base de données à objets les informations sont regroupées sou forme de conteneur logique qui englobe des informations et des traitements relatifs à une chose du monde réel.


- Base de données orientée graph

	 C'est une base de donnée orientée objet > orientée graphe correspond à un système de stockage capable de fournir une adjacence entre éléments voisins : chaque voisin d'une entité est accessible grâce à un pointeur physique



● Descriptions des SGBD relationnels classiques (forces des SGBD relationnels classiques et les propriétés ACID, faiblesses des SGBD relationnels classiques) 

Avantages : 

-Modèle de données simple : via structure de table
-Faible redondance des données : grace aux régles de normalisation
-Cohérence élevée des données : verificationd automatique des condition d'intégrité
-Traitement quantitatives : avec les commandes JOIN
-Langage de requete uniforme : Entre tout les SGBD relationnelle, le langage est le même

Inconvénients :

-Pas de schéma hiérarchiques : Toute les données sont aux même niveau
-Segmentation des données : Tout ce qui est connexes n’est pas nécessairement stocké ensemble. > requete complexes
-Performances inférieurs a noSQL : vitesse extrèmement plus lent du au maintient de la cohérence des donnée
-Affichage tabulaire des données : affichae sous forme de tableau/table obligatoire

Les propriété ACID : 

L'atomicité

Les transactions constituent l'unité logique de travail, toute la transaction est exécutée ou bien rien du tout, mais jamais une partie seulement de la transaction.

La cohérence

Les transactions préservent la cohérence de la BD, c'est à dire qu'elle transforme la BD d'un état cohérent à un autre (sans nécessairement que les états intermédiaires internes de la BD au cours de l'exécution de la transaction respectent cette cohérence)

L'isolation

Les transactions sont isolées les unes des autres, c'est à dire que leur exécution est indépendante des autres transactions en cours. Elles accèdent donc à la BD comme si elles étaient seules à s'exécuter, avec comme corollaire que les résultats intermédiaires d'une transaction ne sont jamais accessibles aux autres transactions.

La durabilité

Les transactions assurent que les modifications qu'elles induisent perdurent, même en cas de défaillance du système.


Exemple d'utilisation : Gestion de quantité de donnée moyenne, avec pas trop de tables. 


● Quelles sont les spécificités des systèmes NoSQL 

Avantages :

-Rapidité : Le modèle NoSQL ne suit pas le modèle relationnel. Pas de schéma de bases avec les contraintes sur les champs. Cela apporte de la flexibilité dans la gestion des données et de la rapidité.

-La scalablité est facilitée : Elles offrent un niveau de scalabilité excellent sur des environnements clusterisés

-Moins cher : Les solutions de gestion de base de données non relationnelles sont pour la plupart en Open Source. Les entreprises qui l'utilisent bénéficient d'un bon rapport qualité/prix

Inconvénients :

-Support limité : due à la jeunesse des bases de données NoSQL, le support de la communauté est parfois limité.

-Manque de standardisation : Pas de langage "NoSQL" standard sur les différentes bases de données.

-Intéropérabilité : La passage d'une base de données NoSQL vers une autre n'est pas transparente pour une application.


Exemple d'utilisation : Quand les données sont compliqué à stocker sur le SGBD de manière tabulaire (images ...), ou bien si le nombres de donnée nous demande de créee une stucture trop grande qui demanderais des requetes trop complexes.

● Quelles sont les spécificités des systèmes NewSQL 

Le NewSQL est un melange entre base de donnée relationnelle et noSQL.
En effet NewSQL possède la scabilité de noSQL, mais possède également l'interface relationnelle via le SQL.
On peut faire des requete SQL avec NewSQL

2. Dataset 
Récupérer les 2 datasets


3. Créer une base de données ‘netflix’ 

*/

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

-- 8. Réaliser une veille sur ces notions MySQL (https://sql.sh/fonctions/right) 

/*
a. Tri des données 

La commande ORDER BY permet de trier les lignes dans un résultat d’une requête SQL. 
Il est possible de trier les données sur une ou plusieurs colonnes, par ordre ascendant ou descendant.

b. Renommage 

Dans le langage SQL il est possible d’utiliser des alias pour renommer temporairement 
une colonne ou une table dans une requête. 
Cette astuce est particulièrement utile pour faciliter la lecture des requêtes

c. Agrégation & e. Opération 

Les fonctions d’agrégation dans le langage SQL permettent d’effectuer des opérations statistiques 
sur un ensemble d’enregistrement. Étant données que ces fonctions s’appliquent à plusieurs lignes en même temps, 
elle permettent des opérations qui servent à récupérer l’enregistrement le plus petit, 
le plus grand ou bien encore de déterminer la valeur moyenne sur plusieurs enregistrement.

d. Jointures 

Les jointures en SQL permettent d’associer plusieurs tables dans une même requête. 
Cela permet d’exploiter la puissance des bases de données relationnelles 
pour obtenir des résultats qui combinent les données de plusieurs tables de manière efficace.

*/

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

-- 16. Réaliser une veille sur le modèle d’analyse et de conception Merise 

/*

La conception du système d'information se fait par étapes, afin d'aboutir à un système d'information fonctionnel reflétant une réalité physique. 
Il s'agit donc de valider une à une chacune des étapes en prenant en compte les résultats de la phase précédente. D'autre part, 
les données étant séparées des traitements, il faut vérifier la concordance entre données et traitements afin de vérifier que toutes les données 
nécessaires aux traitements sont présentes et qu'il n'y a pas de données superflues.

Cette succession d'étapes est appelée cycle d'abstraction pour la conception des systèmes d'information :

L'expression des besoins est une étape consistant à définir ce que l'on attend du système d'information automatisé, il faut pour cela :

faire l'inventaire des éléments nécessaires au système d'information
délimiter le système en s'informant auprès des futurs utilisateurs
Cela va permettre de créer le MCC (Modèle conceptuel de la communication) qui définit les flux d'informations à prendre en compte.

L'étape suivante consiste à mettre au point le MCD (Modèle conceptuel des données) et le MCT (Modèle conceptuel des traitements) décrivant les règles et les contraintes à prendre en compte.

Le modèle organisationnel consiste à définir le MOT (Modèle organisationnel des traitements) décrivant les contraintes dues à l'environnement (organisationnel, spatial et temporel).

Le modèle logique représente un choix logiciel pour le système d'information.




-- 17. Modéliser (Merise) votre Base de données netflix. Que pouvez-vous dire de cette modélisation ?


Voir mcd_sqlbase.jpg
	 mld_sqlbase.md

Notre base ne contient que deux table, cependant on constate que Netflix_shows depend de Netflix_Title,
donc la Primary Key de Netflix_Title (title) se retrouve en temps que Foreign Key dans Netflix_Shows.
Il aurait été bien de mettre Show_ID dans les deux tables, les clefs serait bien plus logique vu que Netflix_Show
possède des doublons au niveau des titres.

*/