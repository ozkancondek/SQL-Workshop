/*
--student
| id | first_name | last_name | admission_score |
|----|------------|-----------|-----------------|
| 1  | Alice      | Smith     | 8.95            |
| 2  | Bob        | Johnson   | 8.75            |


--student_grade

| id | class_name | grade | student_id |
|----|------------|-------|------------|
| 1  | Math       | 10    | 1          |
| 2  | Math       | 9.5   | 1          |
| 3  | Math       | 9.75  | 1          |
| 4  | Science    | 9.5   | 1          |
| 5  | Science    | 9     | 1          |
| 6  | Science    | 9.25  | 1          |
| 7  | Math       | 8.5   | 2          |
| 8  | Math       | 9.5   | 2          |
| 9  | Math       | 9     | 2          |
| 10 | Science    | 10    | 2          |
| 11 | Science    | 9.4   | 2          |

*/


--filter the student records that have a 10 grade in Math
SELECT
    id, first_name, last_name
FROM
    student
WHERE EXISTS (
    SELECT 1
    FROM
        student_grade
    WHERE
        student_grade.student_id = student.id AND
        student_grade.grade = 10 AND
        student_grade.class_name = 'Math'
)
ORDER BY id


--To match all student records that have no associated student_grade with a value lower than 9

SELECT
    id, first_name, last_name
FROM
    student
WHERE NOT EXISTS (
    SELECT 1
    FROM
        student_grade
    WHERE
        student_grade.student_id = student.id AND
        student_grade.grade < 9
)
ORDER BY id
