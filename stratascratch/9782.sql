--Problem 9782 (Customer revenue in march)
--Calculate the total revenue from each customer in March 2019. Revenue for each order is calculated by multiplying the order_quantity with the order_cost.
--Output the revenue along with the customer id and sort the results based on the revenue in descending order.

/* 
SELECT
    cust_id
--calculate total revenue
    SUM (Multiply order_quantity by order_cost) alias AS revenue
    
--datetime data type
WHERE order_date = 2019-03       
GROUP BY cust_id
ORDER BY revenue DESC
*/
SELECT cust_id, SUM(order_cost * order_quantity) AS revenue FROM orders
WHERE order_date LIKE '%2019-03%'
GROUP BY cust_id
ORDER BY revenue DESC
