

-- LINK : https://en.wikibooks.org/wiki/SQL_Exercises/Employee_management
--GitHub : https://github.com/XD-DENG/SQL-exercise/blob/master/SQL_exercise_02/2_build_schema.sql
-- 2.1 Select the last name of all employees.

SELECT lastname
FROM employes
;
 
 
-- 2.2 Select the last name of all employees, without duplicates.

SELECT DISTINCT lastname
FROM employes
;

-- 2.3 Select all the data of employees whose last name is "Smith".

SELECT *
FROM employes
WHERE LASTNAME = 'Smith'
;


 
 
-- 2.7 Select all the data of employees whose last name begins with an "S".
SELECT *
FROM employes
WHERE LASTNAME LIKE 'S%'
;

-- 2.8 Select the sum of all the departments' budgets.

SELECT SUM(budget)
FROM departments
;

-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).

SELECT d.NAME,COUNT(e.SSN)
FROM employes e
JOIN departments d ON e.DEPARTMENT = d.CODE
GROUP BY d.NAME
;


-- 2.10 Select all the data of employees, including each employee's department's data.

SELECT *
FROM employes e
JOIN departments d ON e.DEPARTMENT = d.CODE
;
-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.

SELECT e.name,e.lastname,d.name,d.budget
FROM employes e
JOIN departments d ON e.DEPARTMENT = d.CODE
;
-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.

SELECT e.name,e.lastname 
FROM employes e
where department IN (
        SELECT CODE
        FROM DEPARTMENTS
        WHERE budget >= 60000
        )
;
-- 2.13 Select the departments with a budget larger than the average budget of all the departments.

 
SELECT CODE,NAME
FROM DEPARTMENTS
WHERE BUDGET > (
        SELECT AVG(BUDGET)
        FROM DEPARTMENTS
        )
;
 
-- 2.14 Select the names of departments with more than two employees.
 

SELECT d.NAME 
FROM DEPARTMENTS d
JOIN EMPLOYES e ON e.DEPARTMENT = d.CODE
GROUP BY d.NAME
HAVING COUNT(e.ssn)>2
;

-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.

SELECT *
FROM EMPLOYES
WHERE DEPARTMENT = (
    -- Get the code of the department with the second lowest budget
    SELECT CODE
    FROM DEPARTMENTS
    ORDER BY BUDGET ASC
    LIMIT 1 OFFSET 1
);

 
-- 2.17 Reduce the budget of all departments by 10%.

UPDATE DEPARTMENTS
SET Budget = Budget*0.9
;



-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.

DELETE FROM Employees
  WHERE Department IN
  (
    SELECT Code FROM Departments
      WHERE Budget >= 60000
  );
