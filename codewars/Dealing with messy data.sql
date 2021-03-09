-- (4 Kyu) Dealing with messy data
/*
Your company has an internal policy to determine your customers' credit limit, but this procedure has been questioned recently by the board as being too conservative.

Your CEO wants to increase the current customer base credit limits in order to upsell a new line of products. In order to do that, the company hired several external consultancies to produce new credit limit estimates.

The problem is that each agency has produced the report in its own format. Some use the format "First-name Last-name" to identify a person, others use the format "Last-name, First-name". There is also no consensus on how to capitalize each word, so some used all uppercase, others used all lowercase, and some used mixed-case.

Internally, the data is structured as follows:

Table: customers
================

id: INT
first_name: TEXT
last_name: TEXT
credit_limit: FLOAT

The data you've received from all agencies was consolidated in the following table:

Table: prospects
================
full_name: TEXT
credit_limit: FLOAT

Keep in mind that the agencies had access only to a partial customer base. There is also the possibility of more than one agency prospecting the same customer, so it's highly likely that there will be duplicates. Finally, they've prospected customers that were not in your customer base as well.

For this task you are interested in the prospected customers that are already in your customer base and the prospected credit limit is higher than your internal estimate. When more than one agency prospected the same customer, chose the highest estimate.

You have to produce a report with the following fields:

first_name
last_name
old_limit [the current credit_limit]
new_limit [the highest credit_limit found]

Good luck!

Notes:

only list the customers that a higher credit limit was found.
*/

-- (4 Kyu) Dealing with messy data
/*
Your company has an internal policy to determine your customers' credit limit, but this procedure has been questioned recently by the board as being too conservative.

Your CEO wants to increase the current customer base credit limits in order to upsell a new line of products. In order to do that, the company hired several external consultancies to produce new credit limit estimates.

The problem is that each agency has produced the report in its own format. Some use the format "First-name Last-name" to identify a person, others use the format "Last-name, First-name". There is also no consensus on how to capitalize each word, so some used all uppercase, others used all lowercase, and some used mixed-case.

Internally, the data is structured as follows:

Table: customers
================

id: INT
first_name: TEXT
last_name: TEXT
credit_limit: FLOAT

The data you've received from all agencies was consolidated in the following table:

Table: prospects
================
full_name: TEXT
credit_limit: FLOAT

Keep in mind that the agencies had access only to a partial customer base. There is also the possibility of more than one agency prospecting the same customer, so it's highly likely that there will be duplicates. Finally, they've prospected customers that were not in your customer base as well.

For this task you are interested in the prospected customers that are already in your customer base and the prospected credit limit is higher than your internal estimate. When more than one agency prospected the same customer, chose the highest estimate.

You have to produce a report with the following fields:

first_name
last_name
old_limit [the current credit_limit]
new_limit [the highest credit_limit found]

Good luck!

Notes:

only list the customers that a higher credit limit was found.
*/


/*
Some names are not first last but are seperated by columns
  Use CONCAT()
  Just to stay consistent lowercase everything with LOWER()
  However, the final output will seperate them by column, still combine to compare
Other names are last then first delimited with a comma and the full name is last first

Alphabetical order final output

The credit limits from customers and prospects are different 
  Only include the customers with a higher credit limit than old credit limit
  HAVING MAX(prospect credit limit) > old credit limit, can't use aliases in having statement

GROUP BY first_name, last_name, old credit_limit
*/

-- First iteration of my solution, works but runtime error. 
-- Couldn't figure out why until I saw two things: A special function use or no use of concat() as working solutions
-- I'm not even using a JOIN. Also, when I tried an accepted solution, I also had a runtime error.

SELECT 
  customers.first_name,
  customers.last_name,
  customers.credit_limit AS old_limit,
  MAX(prospects.credit_limit) AS new_limit
FROM customers, prospects
WHERE CONCAT(LOWER(customers.first_name), ' ', LOWER(customers.last_name)) = LOWER(prospects.full_name)
  OR CONCAT(LOWER(customers.last_name), ', ', LOWER(customers.first_name)) = LOWER(prospects.full_name)
GROUP BY customers.first_name, customers.last_name, old_limit
HAVING MAX(prospects.credit_limit) > customers.credit_limit
ORDER BY customers.first_name, customers.last_name
