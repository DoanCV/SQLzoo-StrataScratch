/* 
Each decimal place takes up 256 
We need to find the difference
(Trivial solution if I use string::inet type casting and directly taking the difference:
--SELECT ip_addresses.id, ip_addresses.last::inet - ip_addresses.first::inet AS ips_between FROM ip_addresses
)

The data type for the first and last are strings so use PARSE() or split_part()
-- PARSE(  AS INT) AS firstIP
-- PARSE(  AS INT) AS lastIP

Since lastIP > firstIP is guranteed we try lastIP - firstIP, though not directly
split_part() would be better than PARSE() since we get rid of decimal points

split_part -> 1.2.3.4

SELECT id,
split_part(first,'.',4) AS fourthFirst -> 4
split_part(first,'.',3) AS thirdFirst -> 3
and so on then the same thing for lastIPs

use minus sign for subtraction
type cast the above split_parts to subtract
SELECT (fourthLast - fourthFirst)*256^0 AS fourthDifference, (thirdLast - thirdFirst)*256^1, and so on 
*/

SELECT ip_addresses.id,
((split_part(ip_addresses.last, '.', 4)::int - split_part(ip_addresses.first, '.', 4)::int) * 256^0 + 
(split_part(ip_addresses.last, '.', 3)::int - split_part(ip_addresses.first, '.', 3)::int) * 256^1 +
(split_part(ip_addresses.last, '.', 2)::int - split_part(ip_addresses.first, '.', 2)::int) * 256^2 +
(split_part(ip_addresses.last, '.', 1)::int - split_part(ip_addresses.first, '.', 1)::int) * 256^3)::bigint AS ips_between
FROM ip_addresses

