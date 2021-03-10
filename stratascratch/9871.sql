-- Problem 9871 (Highly Reviewed Hotels)
-- Find hotels with the highest number of reviews and output the hotel name along with the maximum reviews. 
-- Order records by highest number of reviews to lowest.

-- OUTPUT: hotel_name, total_number_of_reviews

SELECT hotel_name, MAX(total_number_of_reviews) AS total FROM hotel_reviews
GROUP BY hotel_name
ORDER BY total DESC
