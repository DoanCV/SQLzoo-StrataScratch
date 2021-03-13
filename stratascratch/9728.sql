-- Problem 9728 (Inspections that resulted in Violations)
-- You're given a dataset of health inspections. 
-- Count the number of inspections that resulted in a violation for 'Roxanne Cafe' for each year. 
-- If an inspection resulted in a violation, there will be a value in the 'violation_id' column.
-- Output the number of inspections by year in ascending order.

/*
WHERE business_name = 'Roxanne Cafe' AND violation_id IS NOT NULL
COUNT inpsection_id  GROUP BY year of inspection -> EXTRACT(YEAR FROM inspection_date)

*/

SELECT EXTRACT(YEAR FROM inspection_date) AS "year", COUNT(inspection_id) AS inspections
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe' AND violation_id IS NOT NULL
GROUP BY "year"
ORDER BY "year"
