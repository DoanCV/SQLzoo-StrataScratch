/* Structure of a function:

CREATE FUNCTION name(paramters) RETURNS data-type AS alias

$$
DECLARE ;

BEGIN ;

END;
$$

LANGUAGE SQL

*/

/* We already have the age*/
CREATE FUNCTION agecalculator(date_var date) RETURNS integer AS 

$$
SELECT CAST(date_part('year', AGE(NOW(), date_var)) AS int) AS AGE
$$ 

LANGUAGE SQL