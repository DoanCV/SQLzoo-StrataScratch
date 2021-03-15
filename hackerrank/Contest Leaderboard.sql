/*
The total score of a hacker is the sum of their maximum scores for all of the challenges.
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.

SELECT hacker_id, name, SUM(max_submission.max_score) AS total_score
FROM hackers 
    INNER JOIN (SELECT hacker_id, MAX(score) AS max_score 
                FROM submissions 
                GROUP BY submissions.hacker_id, challenge_id) 
                AS max_submission 
                ON max_submission.hacker_id = hackers.hacker_id
GROUP BY hacker_id, name
HAVING total_score > 0
ORDER BY total_score DESC, hacker_id ASC

inner join hackers table with a copy of variation that has the max scores grouped by the hacker_id so that we can join and also group by challenge_id so that you dont have repeating submisssions and scores for the same challenge and from the same person 
*/

SELECT hackers.hacker_id, name, SUM(max_submission.max_score) AS total_score
FROM hackers JOIN (SELECT submissions.hacker_id, MAX(score) AS max_score FROM submissions GROUP BY submissions.hacker_id, challenge_id) AS max_submission ON max_submission.hacker_id = hackers.hacker_id
GROUP BY hackers.hacker_id, name
HAVING total_score > 0
ORDER BY total_score DESC, hackers.hacker_id ASC
