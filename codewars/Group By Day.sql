SELECT DATE(created_at) AS "day", events.description, COUNT(events.name) AS "count" FROM events
WHERE events.name = 'trained'
GROUP BY "day", events.description
