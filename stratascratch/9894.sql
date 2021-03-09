-- Problem 9894 (Employee and Manager Salaries)
-- Find employees who are earning more than managers.
-- Output the employee name along with the corresponding salary.

/*
Other employee_title must have higher salary than employee_title = 'Manager'

-- first_name and last_name are not together, use CONCAT()
SELECT CONCAT(), salary FROM employee
-- Update, answer only accepts first name, no need for CONCAT()
-- Can nest this in a WHERE
WHERE salary = (SELECT the MAX(salary) WHERE the employee_title = 'Manager')
*/

SELECT first_name, salary 
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee WHERE employee_title = 'Manager')
