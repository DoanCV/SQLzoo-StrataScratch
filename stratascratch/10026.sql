SELECT DISTINCT winery FROM winemag_p1
WHERE lower(description) LIKE '%plum%' OR lower(description) LIKE '%cherry%' OR lower(description) LIKE '%rose%' OR lower(description) LIKE '%hazelnut%'