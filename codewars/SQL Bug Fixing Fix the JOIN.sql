/* Ok, what? This problem is not difficult but I ran the test cases and they did not always work. 
I used round on my end so are the randomly generated test cases hinting at something? */

SELECT 
  DISTINCT j.job_title,
  ROUND(SUM(j.salary) / COUNT(p), 2)::float as average_salary,
  COUNT(p.id)::INT as total_people,
  ROUND(SUM(j.salary), 2)::float as total_salary
  FROM people p
    JOIN job j ON j.people_id = p.id
  GROUP BY j.job_title
  ORDER BY average_salary DESC