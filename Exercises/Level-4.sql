

-- https://en.wikibooks.org/wiki/SQL_Exercises/Movie_theatres
-- 4.1 Select the title of all movies.

SELECT TITLE
FROM MOVIES
;

-- 4.2 Show all the distinct ratings in the database.

SELECT DISTINCT RATING
FROM MOVIES
;


-- 4.3  Show all unrated movies.

SELECT *
FROM MOVIES
WHERE RATING IS NULL
;
-- 4.4 Select all movie theaters that are not currently showing a movie.
SELECT *
FROM MOVIETHEATERS
WHERE MOVIE IS NOT NULL
;

-- 4.5 Select all data from all movie theaters 

SELECT *
FROM MOVIETHEATERS
JOIN MOVIES ON MOVIES.CODE = MOVIETHEATERS.MOVIE  AND 
;
 
-- 4.7 Show the titles of movies not currently being shown in any theaters.
SELECT *
FROM MOVIES
WHERE CODE NOT IN (
SELECT MOVIE
FROM MOVIETHEATERS
WHERE MOVIE IS NOT NULL
 
)
;
