/*
show the hacker_id and hacker's name
if they achieved full scores for more than one challenge


JOIN hackers and submissions on hacker_id
JOIN submissions and challenges on challenge_id
JOIN challenges and difficulty on difficulty_level

inner join is fine, you realistically can't have missing columns here

assuming all numerical data types are the same compare the submissions score to see if it is equal to the score from difficulty since the score from difficulty table is the max score
then count the number of times this occurs GROUP BY the hacker_id
show only if the count is greater than 1
ORDER BY 
    total challenges DESC
    hacker_id ASC by default
*/

SELECT hackers.hacker_id, hackers.name 
FROM hackers JOIN submissions ON hackers.hacker_id = submissions.hacker_id
    JOIN challenges ON submissions.challenge_id = challenges.challenge_id
    JOIN difficulty ON challenges.difficulty_level = difficulty.difficulty_level
WHERE submissions.score = difficulty.score
GROUP BY hackers.hacker_id, hackers.name
HAVING COUNT(hackers.hacker_id) > 1
ORDER BY COUNT(hackers.hacker_id) DESC, hackers.hacker_id ASC