
--SQL Question 8: Analyzing Click-Through Rates for CCC Intelligent Solutions
 
--https://datalemur.com/blog/ccc-intelligent-solutions-sql-interview-questions
 
SELECT ac.ad_id, 
       COUNT(DISTINCT ca.user_id)::float / COUNT(DISTINCT ac.user_id) AS conversion_rate
FROM ad_clicks AS ac
LEFT JOIN cart_adds AS ca
ON ac.user_id = ca.user_id
AND ca.add_time > ac.click_time
AND EXTRACT(MONTH FROM ac.click_time) = 6
AND EXTRACT(YEAR FROM ac.click_time) = 2022
GROUP BY ac.ad_id;
