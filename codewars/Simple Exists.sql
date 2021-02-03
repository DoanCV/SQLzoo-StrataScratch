SELECT departments.id, departments.name FROM departments
WHERE EXISTS (SELECT * FROM sales 
              WHERE price > 98.00 AND departments.id = sales.department_id)
ORDER BY departments.id