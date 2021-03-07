--Problem 9726 (Classify Business Type)
--Classify each business as either a restaurant, cafe, school, or other. A restaurant should have the word 'restaurant' in the business name. For cafes, either 'cafe' or 'coffee' can be in the business name. 'School' should be in the business name for schools. All other businesses should be classified as 'other'.

/* 
SELECT business_name, CASE WHENS that finds the substring in the string from business_name END AS business_type
FROM giventable

CASE
    WHEN business_name LIKE "%School%" THEN "School" 
    WHEN business_name LIKE "%Restaurant%" THEN "Restaurant"
    -- cafe and coffee will count, store two strings as array
    -- any(array['%cafe%', '%coffee%'])
    -- since theres only two I can use an OR
    -- lower(business_name) LIKE '%cafe%' OR lower(business_name) LIKE '%coffee%'
    WHEN business_name LIKE any(array['%cafe%', '%coffee%'])" THEN "Cafe"
    ELSE "other"
    END AS business_type
    
--Need to lowercase everything??? I will do that just to be sure but the table shown is capital for what I need. 
--Update, lower() is required, the test case does not match the input for casing
*/

SELECT business_name, 
    (CASE
        WHEN lower(business_name) LIKE '%school%' THEN 'school' 
        WHEN lower(business_name) LIKE '%restaurant%' THEN 'restaurant'
        WHEN lower(business_name) LIKE any(array['%cafe%', '%coffee%']) THEN 'cafe'
        ELSE 'other'
    END) AS business_type
FROM sf_restaurant_health_violations
