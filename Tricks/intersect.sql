--fetch common records between two tables

SELECT * FROM EmployeeSalary
INTERSECT
SELECT * FROM ManagerSalary;


--another approach


SELECT *
FROM EmployeeSalary
WHERE EmpId IN 
(SELECT EmpId from ManagerSalary);
