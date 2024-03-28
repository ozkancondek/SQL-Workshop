Sales Table:
| ProductCategory | Region | Amount |
|-----------------|--------|--------|
| Electronics     | North  | 100    |
| Clothing        | South  | 150    |
| Electronics     | North  | 200    |
| Electronics     | South  | 120    |
| Clothing        | North  | 180    |


--Now, let's say you want to know the total sales amount for each combination of product category and region. You can achieve this using the GROUP BY clause with two attributes.

SELECT ProductCategory, Region, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY ProductCategory, Region;



--This query will group the sales data by both the "ProductCategory" and "Region" columns and calculate the total sales amount for each combination. The result will look like this:

| ProductCategory | Region | TotalSales |
|-----------------|--------|------------|
| Electronics     | North  | 300        |
| Electronics     | South  | 120        |
| Clothing        | North  | 180        |
| Clothing        | South  | 150        |
