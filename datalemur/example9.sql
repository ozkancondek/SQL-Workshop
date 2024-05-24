--SQL Question 9: Filtering customer records for CCC Intelligent Solutions

 SELECT * 
FROM customers 
WHERE first_name LIKE 'J%' AND customer_state = 'CA';
