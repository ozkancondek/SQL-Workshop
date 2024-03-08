---------------------------------------
-- The Warehouse
-- lINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_warehouse
--3.1 Select all warehouses.

SELECT *
FROM WAREHOUSES
;

--3.2 Select all boxes with a value larger than $150.

SELECT *
FROM BOXES
WHERE VALUE >=150
;

--3.3 Select all distinct contents in all the boxes.

SELECT DISTINCT CONTENTS
FROM BOXES
;

--3.4 Select the average value of all the boxes.

SELECT AVG(VALUE)
FROM BOXES
;
--3.5 Select the warehouse code and the average value of the boxes in each warehouse.
SELECt w.CODE, AVG(b.VALUE)
FROM WAREHOUSES w
JOIN BOXES b ON w.CODE = b.WAREHOUSE
GROUP BY w.CODE
;

 SELECT Warehouse, AVG(Value)
  FROM Boxes
  GROUP BY Warehouse; 

--3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
 SELECT Warehouse, AVG(Value)
  FROM Boxes
  GROUP BY Warehouse
  HAVING AVG(VALUE) > 150
  ; 


--3.7 Select the code of each box, along with the name of the city the box is located in.

SELECT b.CODE,w.LOCATION
FROM BOXES b
JOIN WAREHOUSES w ON w.CODE = b.WAREHOUSE
;
--3.8 Select the warehouse codes, along with the number of boxes in each warehouse.


SELECT WAREHOUSE, COUNT(CODE)
FROM BOXES
GROUP BY WAREHOUSE
;
 
 -- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
--3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).

WITH BoxCounts AS (
    SELECT 
        WAREHOUSE,
        COUNT(*) AS BOX_COUNT
    FROM 
        BOXES
    GROUP BY 
        WAREHOUSE
)
 
SELECT 
    w.CODE AS W_CODE,
    w.CAPACITY AS W_CAPACITY, 
    bc.BOX_COUNT AS BOXNUMBER,
    CASE
        WHEN w.CAPACITY < bc.BOX_COUNT THEN 'SATURATED'
        WHEN w.CAPACITY = bc.BOX_COUNT THEN 'IN LIMIT'
        ELSE 'STILL CAPACITY'
    END AS CAPACITY_SITUATION
FROM 
    WAREHOUSES w
JOIN 
    BoxCounts bc ON w.CODE = bc.WAREHOUSE;
    
 

-------or------
SELECT 
    w.CODE AS W_CODE,
    w.CAPACITY AS W_CAPACITY, 
    COUNT(b.CODE) AS BOXNUMBER,
    CASE
        WHEN w.CAPACITY < (SELECT COUNT(*) FROM BOXES WHERE WAREHOUSE = w.CODE)
            THEN 'SATURATED'
        WHEN w.CAPACITY = (SELECT COUNT(*) FROM BOXES WHERE WAREHOUSE = w.CODE)
            THEN 'IN LIMIT'
        ELSE 'STILL CAPACITY'
    END AS CAPACITY_SITUATION
FROM 
    WAREHOUSES w
JOIN 
    BOXES b ON w.CODE = b.WAREHOUSE
GROUP BY 
    w.CODE, w.CAPACITY;

 
--3.10 Select the codes of all the boxes located in Chicago.


SELECT b.CODE,w.LOCATION
FROM BOXES b
JOIN WAREHOUSES w ON w.CODE = b.WAREHOUSE AND w.LOCATIOn = 'Chicago'
;
--3.11 Create a new warehouse in New York with a capacity for 3 boxes.

 INSERT 
   INTO WAREHOUSES
        (Location,Capacity)
 VALUES ('New York',3);
--3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.

 INSERT INTO Boxes
   VALUES('H5RT','Papers',200,2);
   
--3.13 Reduce the value of all boxes by 15%.

UPDATE BOXES
SET VALUE =VALUE *0.85;

--3.14 Remove all boxes with a value lower than $100.

DELETE FROM BOXES
WHERE VALUE < 100
;
-- 3.15 Remove all boxes from saturated warehouses.
WITH SAT AS (
 SELECT WAREHOUSE, COUNT(CODE) AS BCOUNT
 FROM BOXES
 GROUP BY WAREHOUSE
)
 
DELETE FROM BOXES
WHERE CODE IN (
         SELECT b.CODE
 FROM WAREHOUSES w
 JOIN BOXES b ON b.WAREHOUSE = w.CODE
 JOIN SAT s ON s.WAREHOUSE = b.WAREHOUSE
 WHERE w.CAPACITY < s.BCOUNT
 
) ;
