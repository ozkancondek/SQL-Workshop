--https://datalemur.com/questions/sql-third-transaction

---------------------------------------------------
--Assume you are given the table below on Uber transactions made by users.
-- Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

 --solution 0
 
 WITH RankedTransactions AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY USER_ID ORDER BY TRANSACTION_DATE) AS TransactionRank
    FROM Uber_Transactions
)

SELECT USER_ID, SPEND, TRANSACTION_DATE
FROM RankedTransactions
WHERE TransactionRank = 3;


--Solution 1
WITH TransactionCounts AS (
    SELECT USER_ID, COUNT(TRANSACTION_DATE) AS TransactionCount
    FROM Uber_Transactions
    GROUP BY USER_ID
)

SELECT t.USER_ID, t.SPEND, t.TRANSACTION_DATE
FROM Uber_Transactions t
JOIN TransactionCounts tc ON tc.USER_ID = t.USER_ID
WHERE tc.TransactionCount = 3
ORDER BY t.TRANSACTION_DATE DESC
LIMIT 1;


---solution 2
SELECT 
    user_id,
    spend,
    transaction_date
FROM 
    Uber_Transactions ut1
WHERE 
    3 = (
        SELECT 
            COUNT(*)
        FROM 
            Uber_Transactions ut2
        WHERE 
            ut1.user_id = ut2.user_id
            AND ut1.transaction_date >= ut2.transaction_date
    );
