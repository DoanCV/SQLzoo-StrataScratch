SELECT UNNEST(string_to_array(yelp_business.categories, ';')) AS cuisine, SUM(yelp_business.review_count) FROM yelp_business
GROUP BY cuisine
ORDER BY COUNT(yelp_business.review_count) DESC