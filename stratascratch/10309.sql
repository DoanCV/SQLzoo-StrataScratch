/* COUNT distinct dates and distinct productIDs, we cant have the same product purchased over time and we dont include mulitple purchases on the first day*/
/* Users have to purchase on more than one data and have to buy more than one productID */
SELECT COUNT(*) FROM (select COUNT(DISTINCT created_at) AS dates, COUNT(DISTINCT product_id) AS items FROM marketing_campaign
GROUP BY user_id) AS counts
WHERE dates > 1 AND items > 1