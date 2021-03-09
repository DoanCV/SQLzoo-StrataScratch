-- (4 Kyu) Challenge: Two actors who cast together the most

/*
actor -> film_actor ON actor_id
film -> film_actor ON film_id

Check the film table for films that both actors were casted in
  This will be in a table called matches
  The final output will select the title from film where film_id are the ones from matches table
    Several actors can be casted together but I am looking for the most
    The only table with film_id and actor_id is film_actor
      SELF JOIN film_actor, treating each copy as an actor, first and second
        JOIN ON matching film_id 
        AND
        One actor will be higher up so use a < or > depending on the order, we don't want duplicates
      I will use array_agg() to get the film IDs that matches to fit in one row
      Find the most matches:
      --ORDER BY COUNT(actor_id) DESC LIMIT 1
    matches also returns the actor_id of both actors
JOIN matches with copies of actor table, treating each copy as an actor ON each of the IDs of most frequently casted pair
  combine first name and last name by a whitespace
  -- CONCAT()
*/

SELECT 
  CONCAT(actorOne.first_name, ' ', actorOne.last_name) AS first_actor,
  CONCAT(actorTwo.first_name, ' ', actorTwo.last_name) AS second_actor,
  film.title
FROM (
  SELECT 
    actorOneInfo.actor_id AS actorOneID, 
    actorTwoInfo.actor_id AS actorTwoID, 
    COUNT(actorOneInfo.film_id) AS casted_together,
    array_agg(actorOneInfo.film_id) AS film_ids
  FROM film_actor actorOneInfo JOIN film_actor actorTwoInfo
  ON actorOneInfo.film_id = actorTwoInfo.film_id 
    AND actorOneInfo.actor_id < actorTwoInfo.actor_id 
  group by actorOneInfo.actor_id, actorTwoInfo.actor_id
  order by casted_together desc
  limit 1
) AS matches
JOIN actor actorOne ON matches.actorOneID = actorOne.actor_id
JOIN actor actorTwo ON matches.actorTwoID = actorTwo.actor_id
JOIN film ON film.film_id = any(matches.film_ids) 
