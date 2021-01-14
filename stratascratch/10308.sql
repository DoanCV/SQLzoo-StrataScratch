/* With INNER JOIN */
SELECT 
    ABS(
        (SELECT MAX(db_employee.salary) FROM db_employee
        JOIN db_dept ON db_employee.department_id = db_dept.id WHERE db_dept.department = 'engineering')
        - 
        (SELECT MAX(db_employee.salary) FROM db_employee 
        JOIN db_dept ON db_employee.department_id = db_dept.id WHERE db_dept.department = 'marketing')
    )

/* 
Without INNER JOIN 

SELECT ABS(

    (
        SELECT MAX(db_employee.salary) FROM db_employee 
        WHERE db_employee.department_id IN (SELECT id FROM db_dept WHERE db_dept.department = 'engineering')
    )

    -

    (
        SELECT MAX(db_employee.salary) FROM db_employee
        WHERE db_employee.department_id IN (SELECT id FROM db_dept WHERE db_dept.department = 'marketing')
    )
)

*/