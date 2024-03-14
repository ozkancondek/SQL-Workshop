 
 -- https://en.wikibooks.org/wiki/SQL_Exercises/Pieces_and_providers
-- 5.1 Select the name of all the pieces.

SELECT NAME
FROM PIECES
;
 
-- 5.2  Select all the providers' data. 

SELECT *
FROM PROVIDERS
;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).

  SELECT Piece, AVG(Price)
    FROM Provides
GROUP BY Piece;

-- 5.4  Obtain the names of all providers who supply piece 1.

SELECT PROVIDERS.NAME
FROM PROVIDES
JOIN PROVIDERS ON PROVIDERS.CODE = PROVIDES.PROVIDER
WHERE PROVIDES.PIECE = 1
;

-- 5.5 Select the name of pieces provided by provider with code "HAL".

SELECT pr.PIECE,pi.NAME
FROM PROVIDES pr
JOIN PIECES pi ON pr.PIECE = pi.CODE
WHERE pr.PROVIDER = 'HAL'
;


-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).

SELECT Pieces.Name, Providers.Name, Price
   FROM Pieces INNER JOIN Provides ON Pieces.Code = Piece
               INNER JOIN Providers ON Providers.Code = Provider
   WHERE Price =
   (
     SELECT MAX(Price) FROM Provides
     WHERE Piece = Pieces.Code
   );



 
