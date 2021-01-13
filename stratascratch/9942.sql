SELECT games, COUNT(DISTINCT id) FROM olympics_athletes_events
GROUP BY games
ORDER BY COUNT(id) DESC LIMIT 1 