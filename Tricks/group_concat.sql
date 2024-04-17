--You can use the GROUP_CONCAT function to concatenate strings from multiple rows into a single row.
--This is useful when you need to combine multiple values into a single string. Here's an example:

-- Retrieve all products and their categories
SELECT p.product_id, p.product_name, GROUP_CONCAT(c.category_name SEPARATOR ', ') AS categories
FROM products AS p
JOIN product_categories AS pc ON p.product_id = pc.product_id
JOIN categories AS c ON pc.category_id = c.category_id
GROUP BY p.product_id
