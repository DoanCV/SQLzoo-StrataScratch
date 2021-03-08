--Problem 10060 (Top cool votes)
--Find the business and the review_text that received the highest number of 'cool' votes.
--Output the business name along with the review text.

/*
-- Output: business_name, review_text
-- Input: yelp_reviews table

-- get MAX(cool) with a subquery
-- WHERE cool = subquery
*/

SELECT business_name, review_text FROM yelp_reviews
WHERE cool = (SELECT MAX(cool) FROM yelp_reviews)
