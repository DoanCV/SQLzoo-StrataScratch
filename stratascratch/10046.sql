SELECT state, COUNT(stars) AS n_businesses  FROM yelp_business
WHERE stars = 5
GROUP BY state
ORDER BY state, COUNT(stars) DESC LIMIT 5
