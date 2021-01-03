/*
Use two self joins 
a is the start WHERE the name is 'Craiglockhart' d is the end WHERE the name is 'Lochend'
b and c are the transfer point which either can show the transfer stop in the SELECT

The two self joins are in paris of a + b and c + d, on the services stored in route table

JOIN stop and a,b,c,d to call the names by string instead of number
*/

SELECT a.num, a.company, stopb.name, d.num, d.company
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
             JOIN route c ON (b.stop = c.stop)
             JOIN route d ON (d.company = c.company AND c.num = d.num)
             JOIN stops stopa ON a.stop = stopa.id
             JOIN stops stopb ON b.stop = stopb.id
             JOIN stops stopc ON c.stop = stopc.id
             JOIN stops stopd ON d.stop = stopd.id
WHERE stopa.name = 'Craiglockhart' AND stopd.name = 'Lochend'
ORDER BY a.company, a.num, stopb.name, d.num