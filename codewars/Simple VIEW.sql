/* 
-- Format of a VIEW
CREATE VIEW name AS
SELECT ...;

-- Pull data from VIEW
SELECT * FROM name;


output: members.id, members.name, members.email, "total_spending" which is the SUM(products.prices)

select members that spend more than 1000
work only in the department_id that have a total product price > 10000
  get this table by using WHERE sales.department.id IN (SELECT ...)
check the total_spending and the total product price for the deparment 
  use HAVING() since we check the result of SUM()
*/

CREATE VIEW members_approved_for_voucher AS 
SELECT members.id, members.name, members.email, SUM(products.price) AS total_spending 
FROM sales 
  JOIN members ON members.id = sales.member_id 
  JOIN products ON products.id = sales.product_id
WHERE sales.department_id IN (
  SELECT sale.department_id 
  FROM sales sale 
    JOIN products product ON sale.product_id = product.id
  GROUP BY sale.department_id
  HAVING SUM(product.price) > 10000)
GROUP BY members.id, members.name, members.email
HAVING SUM(products.price) > 1000
ORDER BY members.id;

SELECT * FROM members_approved_for_voucher;
