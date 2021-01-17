/* 
COUNT all sent and accepted on a date and find rate = accepted/sent (this is the case rather than sent+accepted since I can see everything register as sent first before anything happens)
Everything must be float
left table a which capturess sent
right table b which captures accept
LEFT JOIN, line up on sender from both tables and receiver from both tables matching
GROUP BY date, doesn't matter which date
ORDER BY ASC default since earliest first
*/

SELECT
    a.date,
    COUNT(b.action)/COUNT(a.action)::FLOAT AS rate
FROM(
    SELECT *
    FROM fb_friend_requests
    WHERE action = 'sent') AS a
LEFT JOIN(
    SELECT *
    FROM fb_friend_requests
    WHERE action = 'accepted') AS b 
ON a.user_id_sender = b.user_id_sender AND a.user_id_receiver = b.user_id_receiver
GROUP BY a.date
ORDER BY a.date