-- Problem 9897 (Highest Salary in Department)
-- Find the employee with the highest salary per department.
-- Output the department name, employee's first name along with the corresponding salary.

/*
get department, first_name, MAX(salary)
GROUP BY department
-- however, group by requires first_name as well but that means MAX() is by first_name

instead:
we need an inner query
WHERE can take in tuple
    WHERE (department, salary) IN (SELECT ...)
*/

SELECT department, first_name, salary
FROM employee
WHERE (department, salary) IN (
    SELECT department, MAX(salary)
    FROM employee
    GROUP BY department
)
