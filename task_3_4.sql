--Вывести названия фильмов, которых нет в inventory. Написать запрос без использования оператора IN.
SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL;
