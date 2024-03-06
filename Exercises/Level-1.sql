

-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store
-- 1.1 Select the names of all the products in the store.

SELECT NAME FROM PRODUCTS;

-- 1.2 Select the names and the prices of all the products in the store.

SELECT NAME,PRICE FROM PRODUCTS;

-- 1.3 Select the name of the products with a price less than or equal to $200.

SELECT Name FROM PRODUCTS
WHERE Price <= 200
;

-- 1.4 Select all the products with a price between $60 and $120.

SELECT *
FROM PRODUCTS
WHERE PRICE  BETWEEN 60 AND 120
;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).

SELECT name, price*100
FROM PRODUCTS
;

-- 1.6 Compute the average price of all the products.
SELECT AVG(Price)
FROM PRODUCTS;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.

SELECT AVg(Price)
FROM PRODUCTS
WHERE MANUFACTURER = 2
;

-- 1.8 Compute the number of products with a price larger than or equal to $180.

SELECT COUNT(CODE)
FROM PRODUCTS
WHERE PRICE >= 180
;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).

SELECT NAME,PRICE
FROM PRODUCTS
WHERE PRICE >= 180
ORDER BY PRICE DESC, NAME ASC
;


-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.

SELECT *
FROM PRODUCTS
JOIN MANUFACTURERS ON PRODUCTS.MANUFACTURER = MANUFACTURERS.CODE
;

-- 1.11 Select the product name, price, and manufacturer name of all the products.

SELECT p.name,p.price,m.name
FROM PRODUCTS p
JOIN MANUFACTURERS m ON p.MANUFACTURER = m.CODE
;

 SELECT Products.Name, Price, Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code;
   
   
-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.

SELECT  m.code, AVG (p.price)
FROM PRODUCTS p
JOIN MANUFACTURERS m ON p.MANUFACTURER = m.CODE
GROUP BY m.code
;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.

SELECT  m.name, AVG (p.price)
FROM PRODUCTS p
JOIN MANUFACTURERS m ON p.MANUFACTURER = m.CODE
GROUP BY m.name
;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.

SELECT  m.code, AVG (p.price)
FROM PRODUCTS p
JOIN MANUFACTURERS m ON p.MANUFACTURER = m.CODE
GROUP BY m.code
HAVING AVG (p.price) >= 150
;
-- 1.15 Select the name and price of the cheapest product.

SELECT name,price
FROM PRODUCTS
WHERE PRICE = (SELECT MIN(PRICE) FROM PRODUCTS);

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.

SELECT m.name, MAX(p.price)
FROM MANUFACTURERS m
JOIN PRODUCTS p ON m.code = p.MANUFACTURER
GROUP BY m.name
;

   SELECT A.Name, A.Price, F.Name
   FROM Products A INNER JOIN Manufacturers F
   ON A.Manufacturer = F.Code
     AND A.Price =
     (
       SELECT MAX(A.Price)
         FROM Products A
         WHERE A.Manufacturer = F.Code
     );


-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
 INSERT INTO Products( Code, Name , Price , Manufacturer)
  VALUES ( 11, 'Loudspeakers' , 70 , 2 );


-- 1.18 Update the name of product 8 to "Laser Printer".

UPDATE PRODUCTS
SET NAME = 'Laser Printer'
WHERE CODE = 8
;
 
-- 1.19 Apply a 10% discount to all products.

UPDATE PRODUCTS
  SET Price = Price - (Price * 0.1);
;