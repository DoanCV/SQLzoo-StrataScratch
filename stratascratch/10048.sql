SELECT name, SUM(review_count) AS total FROM yelp_business
GROUP BY name
ORDER BY total DESC LIMIT 5