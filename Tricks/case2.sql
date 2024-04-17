-- Assign a customer tier based on order count
SELECT customer_id, COUNT(*) AS order_count,
    CASE
        WHEN COUNT(*) < 5 THEN 'Bronze'
        WHEN COUNT(*) >= 5 AND COUNT(*) < 10 THEN 'Silver'
        WHEN COUNT(*) >= 10 THEN 'Gold'
    END AS customer_tier
FROM orders
GROUP BY customer_id
