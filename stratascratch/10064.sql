--Problem 10064 (Highest Energy Consumption)
--Find the date with the highest total energy consumption from the Facebook data centers. Output the date along with the total energy consumption across all data centers.
/* 
- We have three continents to work with so we will have to add the consumption together to get the total
    - combine original tables with union all, not just union to not lose rows
        - alias AS allEnergy
    - date, SUM(consumption) by each date FROM allEnergy
        - alias AS totalEnergy
    - SELECT MAX() FROM totalEnergy
        - alias as maxEnergy
- Select the date and max value FROM INNER JOIN ...
    - there can be ties so returning equal consumptions on different dates is expected
    - join the maxEnergy and totalEnergy 
*/

/*
--First iteration of my solution. 
--I realize a JOIN is not necessary as well as the maxEnergy table. 
--A nested select will also work since I am only looking for the max value anyways. 

WITH 
    allEnergy AS (
        SELECT * FROM fb_eu_energy
        UNION ALL
        SELECT * FROM fb_asia_energy
        UNION ALL
        SELECT * FROM fb_na_energy
        ),
    totalEnergy AS (
        SELECT allEnergy.date, SUM(consumption) AS totalConsumption FROM allEnergy
        GROUP BY allEnergy.date
        ORDER BY allEnergy.date ASC
        ),
    maxEnergy AS (
        SELECT MAX(totalConsumption) AS maxConsumption FROM totalEnergy
        )
SELECT totalEnergy.date, totalEnergy.totalConsumption 
FROM totalEnergy
JOIN maxEnergy ON totalEnergy.totalConsumption = maxEnergy.maxConsumption
*/

WITH 
    allEnergy AS (
        SELECT * FROM fb_eu_energy
        UNION ALL
        SELECT * FROM fb_asia_energy
        UNION ALL
        SELECT * FROM fb_na_energy
        ),
    totalEnergy AS (
        SELECT allEnergy.date, SUM(consumption) AS totalConsumption FROM allEnergy
        GROUP BY allEnergy.date
        ORDER BY allEnergy.date ASC
        )
SELECT totalEnergy.date, totalEnergy.totalConsumption 
FROM totalEnergy
WHERE totalEnergy.totalConsumption = (SELECT MAX(totalConsumption) FROM totalEnergy)
