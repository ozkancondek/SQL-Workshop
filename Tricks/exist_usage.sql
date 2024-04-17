-- Retrieve all customers who have placed an order
SELECT *
FROM customers AS c
WHERE EXISTS (
    SELECT *
    FROM orders AS o
    WHERE o.customer_id = c.customer_id
)
