-- Problem 9781 (Find the rate of processed tickets for each type)

/*
There are two types, 0 and 1 (int) and processed checks TRUE and FALSE (bools)

Rate: #true/(#true + #false)
where #true + #false = the amount processed
"for every amount processed attempts, #true passes"
seperate by type with GROUP BY

structure:
-- divide the result of SUM() and COUNT(1) to get a ratio
-- SUM() can have CASE WHEN
SELECT type, SUM(CASE WHEN processed = TRUE THEN 1 ...) / COUNT(1)
GROUP BY type to determine which type to check CASE and to then SUM
*/

SELECT "type", SUM(CASE 
    WHEN processed = TRUE THEN 1
    ELSE 0 END)::NUMERIC / COUNT(1)
FROM facebook_complaints
GROUP BY "type"
