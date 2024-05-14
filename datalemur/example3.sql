--SQL Question 3: What is a database index, and what are the different types of indexes?

--A database index is a way to optimize the performance of a database by reducing the amount of data that needs to be searched to retrieve a record.

--There are several types of indexes that can be used in a database:

--    Primary index: a unique identifier is used to access the row directly.
--    Unique index: used to enforce the uniqueness of the indexed columns in a table.
--    Composite index: created on multiple columns of a table, is used to speed up the search process for multiple columns
--    Clustered index: determines the physical order of the data in a table

--For a concrete example, say you had a table of CCC Intelligent Solutions customer payments with the following columns: payment_id, customer_id, payment_amount, and payment_date.

--Here's what a clustered index on the payment_date column would look like:

CREATE CLUSTERED INDEX payment_date_index ON ccc_intelligent_solutions_customer_payments (payment_date)

--A clustered index on the payment_date column would determine the physical order of the records in the table based on the payment_date. 
--This means that the records with the earliest payment_date values would be stored together physically in the table, followed by records with later payment_date values.

--Having a clustered index on the payment_date column can speed up queries that filter or sort the data based on the payment_date, as the records are already physically sorted in the table. 
  --For example, if you want to retrieve all the payments made in the month of January, the database can use the clustered index to quickly locate and 
  --retrieve the desired records without having to search through the entire table.
