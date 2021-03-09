-- Problem was removed from the site
SELECT lyft_rides_log.distance, lyft_users.name FROM lyft_rides_log JOIN lyft_users ON (lyft_users.id = lyft_rides_log.user_id)
ORDER BY lyft_rides_log.distance DESC LIMIT 10
