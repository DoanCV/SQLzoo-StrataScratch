SELECT COUNT(DISTINCT LOWER(SPLIT_PART(business_address, ' ', 2))), business_postal_code FROM sf_restaurant_health_violations
GROUP BY business_postal_code
ORDER BY COUNT(LOWER(SPLIT_PART(business_address, ' ', 2))) DESC, business_postal_code ASC