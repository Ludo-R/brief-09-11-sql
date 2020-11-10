Brief Bases de données relationnelle 

Groupe 1 Bassem Fatima Ines Wiem 
Groupe 2 Xavier Jean-Pierre Myriam Roger 
Groupe 3 Caroline Cécilia Joshua Pierre-Etienne 
Groupe 4 Dan Ludovic Nidhal Olivier Sacia 
Groupe 5 Hachem Julien Anthony Constant 

1. Réaliser une veille sur les les différents SGBD. Proposer un exemple concret d’utilisation pour argumenter vos explications. 
● Descriptions des SGBD relationnels classiques (forces des SGBD relationnels classiques et les propriétés ACID, faiblesses des SGBD 
relationnels classiques) 
● Quelles sont les spécificités des systèmes NoSQL 
● Quelles sont les spécificités des systèmes NewSQL 

2. Dataset 
Récupérer les 2 datasets suivant : 
2.1. 
https://www.kaggle.com/shivamb/netflix-shows 
netflix_titles.csv : 12 colonnes (9 string, 1 DateTime, 1 Integer, 1 other) 
(show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description) 

2.2 
https://www.kaggle.com/chasewillden/netflix-shows?select=Netflix+Shows.csv 
netflix_titles.csv : 7 colonnes (6 String, 1 Integer) 
(title, rating, ratingLevel, ratingDescription, release year, user rating score, user rating size) 


3. Créer une base de données ‘netflix’ 

4. Créer une table appelée ‘netflix_title’, importer les données provenant du fichier netflix_titles.csv 

5. Créer une table appelée ‘netflix_shows’ provenant du fichier Netflix Shows.csv 
Avec la table netflix_titles 

6. Afficher tous les titres de films de la table netflix_titles dont l’ID est inférieur strict à 80000000 

7. Afficher toutes les durée des TV Show 

8. Réaliser une veille sur ces notions MySQL (https://sql.sh/fonctions/right) 
a. Tri des données 
b. Renommage 
c. Agrégation 
d. Jointures 
e. Opération 

9. Afficher tous les noms de films communs aux 2 tables (netflix_titles et netflix_shows) 

10. Calculer la durée totale de tous les TV Show de votre table netflix_titles 

11. Compter le nombre de TV Shows de votre table ‘netflix_shows’ dont le ‘ratingLevel’ est renseigné. 

12. Compter les films et TV Shows pour lesquels les noms (title) sont les mêmes sur les 2 tables et dont le ‘release year’ est supérieur à 2016. 

13. Supprimer la colonne ‘rating’ de votre table ‘netflix_shows’ 

14. Supprimer les 100 dernières lignes de la table ‘netflix_shows’ 

15. Le champs “ratingLevel” pour le TV show “Marvel's Iron Fist” de la table ‘netflix_shows’ est vide, pouvez-vous ajouter un commentaire ? 

16. Réaliser une veille sur le modèle d’analyse et de conception Merise 

17. Modéliser (Merise) votre Base de données netflix. Que pouvez-vous dire de cette modélisation ?
