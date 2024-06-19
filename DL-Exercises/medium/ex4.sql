--Top Three Salaries 

 WITH top_salaries as (
SELECT department_id,name,salary,
      DENSE_RANK() OVER (
      PARTITION BY department_id ORDER BY salary DESC ) AS row_num 
FROM employee
GROUP BY department_id,name,salary
ORDER BY department_id,salary DESC
)

SELECT d.department_name,ts.name,ts.salary
FROM top_salaries ts
JOIN department d ON d.department_id = ts.department_id
WHERE ts.row_num <=3
ORDER BY d.department_name ASC,ts.salary DESC,ts.name ASC
;  
 
