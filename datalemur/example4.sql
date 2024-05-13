--SQL Question 4: The SQL question might be to determine the total revenue by product and customer for the month of June.

SELECT p.product_name, c.customer_name, SUM(od.quantity * p.price) as total_revenue
FROM OrderDetails od
JOIN Orders o ON od.order_id = o.order_id
JOIN Products p ON od.product_id = p.product_id
JOIN Customers c ON o.customer_id = c.customer_id
WHERE DATE_PART('month', o.order_date) = 6
GROUP BY p.product_name, c.customer_name;
