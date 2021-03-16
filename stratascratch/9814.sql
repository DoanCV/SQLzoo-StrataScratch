-- Problem 9814 (Counting Instances in Text)
-- Find the number of times the words 'bull' and 'bear' occur in the contents. We're counting the number of times the words occur so words like 'bullish' should not be included in our count.
-- Output the word 'bull' and 'bear' along with the corresponding number of occurrences.

/*
output shows 
    -- 'bull' and 'bear'
    -- count of 'bull' and count of 'bear'

we can UNION two queries, one which SUM(CASE WHEN the string is bull) and another for the string bear
to print out the actual string as one column of the output, use single quote and alias for the UNION to recognize a seperate entry if not already
*/

(
    SELECT 
        'bull' AS word, 
        SUM(CASE WHEN contents LIKE '%bull%' THEN 1 ELSE 0 END)
    FROM google_file_store
)
UNION
(
    SELECT
        'bear' AS word,
        SUM(CASE WHEN contents LIKE '%bear%' THEN 1 ELSE 0 END)
    FROM google_file_store
)
