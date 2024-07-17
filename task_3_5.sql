SELECT 
    actor.actor_id,
    actor.first_name,
    actor.last_name,
    COUNT(film_actor.film_id) AS count_films
FROM 
    actor
    JOIN film_actor ON actor.actor_id = film_actor.actor_id
    JOIN film_category ON film_actor.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
WHERE 
    category.name = 'Children'
GROUP BY 
    actor.actor_id,
    actor.first_name,
    actor.last_name
ORDER BY 
   count_films DESC
LIMIT 3;
