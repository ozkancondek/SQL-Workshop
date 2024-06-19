--Highest-Grossing Items


WITH ranked_spending_cte AS (SELECT 
  category, 
  product, 
  SUM(spend) AS total_spend ,
      ROW_NUMBER() OVER (
      PARTITION BY category ORDER BY SUM(spend) DESC ) AS row_num 
FROM product_spend 
WHERE EXTRACT(YEAR FROM transaction_date) = 2022  
GROUP BY category, product
ORDER BY category,total_spend DESC
)

SELECT 
  category, 
  product, 
  total_spend 
FROM ranked_spending_cte 
WHERE row_num <= 2 
;
