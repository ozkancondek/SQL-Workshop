--fetch common records between two tables

SELECT * FROM EmployeeSalary
INTERSECT
SELECT * FROM ManagerSalary;
