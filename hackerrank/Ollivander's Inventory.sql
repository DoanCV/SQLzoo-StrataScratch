/*
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

ok this problem is poorly worded, i realize that a subquery is necessary to find the minimum cost first

age and code are one to one

INNER JOIN wands and wands_property on code columns

SELECT id, age, coins_needed, power
WHERE code <> 3 since that is_evil == 1, either condition works
    AND SUBQUERY
ORDER BY power DESC, age DESC


SUBQUERY: 
    SELECT the minimum coins_needed FROM a joined copy of wands and wands_property (alias these) on code
    WHERE the powers and age match across original and copy 
*/

SELECT wands.id, wands_property.age, wands.coins_needed, wands.power FROM wands JOIN wands_property ON wands.code = wands_property.code
WHERE wands_property.is_evil = 0 
    AND wands.coins_needed = 
    (SELECT MIN(coins_needed) 
     FROM wands w JOIN wands_property p ON w.code = p.code 
     WHERE wands.power = w.power AND wands_property.age = p.age)
ORDER BY wands.power DESC, wands_property.age DESC