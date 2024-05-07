--SQL Question 1: Identify Most Frequent Customers
--https://datalemur.com/blog/ccc-intelligent-solutions-sql-interview-questions

SELECT user_id, COUNT(*) as total_purchases
FROM purchases
GROUP BY user_id
ORDER BY total_purchases DESC
LIMIT 5;
