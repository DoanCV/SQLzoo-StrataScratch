/*
Split the date: 
      The date is in year-month-day
      Assuming that the year is four digits we can use either split_part in PostgreSQL or split_string MySQL and mark a position when the info we need is delimited by a '-'
      Indexing in PostgreSQL starts with 1. In this case there are three parts so 1 - year, 2 - month, 3 - day
      Then we alias each part of the split string
I just realized that PostgreSQL has a date data type and so I can use EXTRACT() to avoid using the above method
CAST all the date values as INT since that is output format

We will have to multiply the count by the price to get the revenue
  The price is numeric, cast count to numeric since count is int
SUM() the revenue
We will also have to group the SUM() by year, month, day as well as the product_name

Inner join product with sales_details on id and product_id respectively 
Inner join sales_details with sales on sale_id and id respectively

Update after attempt:
I could not get the empty values in the table wehn only looking at month or year.
My values were correct but I needed to expand the rows. I thought of using CASE WHEN but I could not create a hierarchy 
I had no idea what ROLLUP() was so I had to forfeit the points. 
A common use of ROLLUP() is to calculate the aggregations of data by year, month, and date with the hierarchy year > month > date

*/

SELECT products.name AS product_name, EXTRACT(YEAR FROM sales.date)::INT AS "year", EXTRACT(MONTH FROM sales.date)::INT AS "month", EXTRACT(DAY FROM sales.date)::INT AS "day", SUM(sales_details.count::NUMERIC * products.price) AS total
FROM products JOIN sales_details ON products.id = sales_details.product_id JOIN sales ON sales.id = sales_details.sale_id
GROUP BY product_name, ROLLUP("year", "month", "day")
ORDER BY product_name, "year", "month", "day"