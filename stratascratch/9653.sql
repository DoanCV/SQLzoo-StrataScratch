-- Problem 9653 (Count the number of user events performed by MacBookPro users)
-- Count the number of user events performed by MacBookPro users.
-- Output the result along with the event name.
-- Sort the result based on the event count in the descending order.

/*
event count
    -- Use SUM(CASE WHEN device = 'macbook pro' THEN 1 ELSE 0 END)
    -- this will show macbook pro and the other devices
    -- check for device = macbook pro inside the SUM(CASE WHEN)
instead use WHERE and then COUNT(1)

GROUP BY event_type
ORDER BY event count DESC
*/

SELECT event_name, COUNT(1) AS total
FROM playbook_events
WHERE device = 'macbook pro'
GROUP BY event_name
ORDER BY total DESC
