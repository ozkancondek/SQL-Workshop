
--The following SQL creates a CHECK constraint on the "Age" column when the "Persons" table is created.
--The CHECK constraint ensures that the age of a person must be 18, or older:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
); 
