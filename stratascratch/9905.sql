-- Problem 9905 (Highest target under manager)
-- Find the highest target achieved by the employee or employees who works under the manager id 13. 
-- Output the first name of the employee and target achieved. 
-- The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

/*
SELECT: first_name, target
WHERE: manager_id = 13
NESTED query IN WHERE clause: SELECT MAX(target)
-- There can be more than one employee who falls under these conditions
*/

SELECT first_name, target FROM salesforce_employees
WHERE target IN (
        SELECT MAX(target) FROM salesforce_employees
        WHERE manager_id = 13)
