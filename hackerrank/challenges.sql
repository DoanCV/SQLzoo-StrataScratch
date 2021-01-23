/*
Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

Again poorly worded for the last sentence. But its clear that a valid solution can include subquery. Here is my interpretation:
The first 'proposition' is "more than one student created the same number of challenges"
The second 'proposition' is "the count is less than the maximum number of challenges created"
The 'conclusion' is "exclude those students from the result"

One subquery will deal with the second proposition and another will deal with the first. 
second proposition: select the max value from a subquery that returns the count of al the challenges by hacker_id
first proposition: remove counts that are unique. we can do this buy counting all rows grouped by hacker_id, then we we look at the count values themselves and see how many times they show up by counting the counts of the subquery. if the count is 1 then it is unique and we use having since we check after aggregation
However, instead of ANDing them as the sentence suggests, I will OR them since thats how the test case works.

SELECT hacker_id, name, COUNT(challenge_id) AS numChallenges
FROM hackers INNER JOIN challenges ON hacker_id
GROUP BY hacker_id, name
HAVING numChallenges = (SELECT MAX(temp.num) FROM (SELECT COUNT(*) AS num FROM challenges GROUP BY hacker_id) temp)
    OR numChallenges IN (SELECT temp.num1 FROM (SELECT COUNT(*) FROM challenges AS num1) AS temp1 GROUP BY temp.num1 HAVING COUNT(temp.num1) = 1)
ORDER BY numChallenges DESC, hacker_id
*/

SELECT hackers.hacker_id, name, COUNT(challenge_id) AS numChallenges
FROM hackers INNER JOIN challenges ON hackers.hacker_id = challenges.hacker_id
GROUP BY challenges.hacker_id, name
HAVING numChallenges = (SELECT MAX(temp.num) 
                        FROM (SELECT COUNT(*) AS num 
                              FROM challenges 
                              GROUP BY challenges.hacker_id) AS temp)
    OR numChallenges IN (SELECT temp1.num1 
                         FROM (SELECT COUNT(*) AS num1
                               FROM challenges 
                               GROUP BY challenges.hacker_id) AS temp1 
                         GROUP BY temp1.num1 
                         HAVING COUNT(temp1.num1) = 1)
ORDER BY numChallenges DESC, hackers.hacker_id