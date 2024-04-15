--This clause stands for "Uncommitted Read" and is specific to IBM's DB2 database management system. 
--It is used to indicate that the query should perform an uncommitted read, which means it retrieves data without locking the rows or requiring a commitment to the transaction.


--In this context, the WITH UR clause is used to specify the isolation level for the query.
--By default, DB2 performs a "Cursor Stability" read, which means it locks the rows that are read until the end of the transaction. 
--However, by including WITH UR, you're indicating that you want to perform an uncommitted read, allowing other transactions to modify the data while the query is executing.

--So, in summary, the WITH UR clause in this SQL query instructs DB2 to perform an uncommitted read, 
--allowing the query to retrieve data without locking the rows or requiring a commitment to the transaction.

--"UR" is for Unblocking Read, which means the database can still be updated while the query is in progress
