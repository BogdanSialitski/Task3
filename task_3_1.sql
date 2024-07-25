--Вывести количество фильмов в каждой категории, отсортировать по убыванию
SELECT c.name AS name, COUNT(fc.film_id) AS count_films
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY count_films DESC;
