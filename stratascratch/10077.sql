SELECT sf_employee.employee_title, sf_employee.sex, AVG(sf_employee.salary + sf_bonus.bonus)
FROM sf_employee JOIN sf_bonus ON sf_employee.id = sf_bonus.worker_ref_id
GROUP BY sf_employee.employee_title, sf_employee.sex