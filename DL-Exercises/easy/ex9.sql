--Cities With Completed Trades
SELECT users.city,count(trades.order_id)  as cc
FROM trades
JOIN users ON users.user_id = trades.user_id 
WHERE trades.status = 'Completed'
GROUP BY users.city
ORDER BY cc DESC
LIMIT 3
;
