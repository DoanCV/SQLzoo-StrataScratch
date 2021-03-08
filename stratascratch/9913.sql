--Problem 9913 (Order Details)
--Find order details made by Jill and Eva.
--Consider the Jill and Eva as first names of customers.
--Output the order date, details and cost along with the first name.
--Order records based on the customer id in ascending order.

SELECT customers.first_name, orders.order_date, orders.order_details, orders.order_cost 
FROM customers 
JOIN orders ON customers.id = orders.cust_id
WHERE customers.first_name LIKE any(array['%Jill%', '%Eva%'])
ORDER BY orders.cust_id ASC
