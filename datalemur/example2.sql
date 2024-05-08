--SQL Question 2: Monthly Average Ratings for CCC Intelligent Solutions Products

SELECT 
    extract(month from submit_date) as mth,
    product_id AS product,
    avg(star) AS avg_stars
FROM 
    review
GROUP BY 
    mth, product
ORDER BY 
    mth, product; 
