--Вывести категорию фильмов, у которой самое большое кол-во часов суммарной аренды в городах (customer.address_id в этом city), и которые начинаются на букву “a”. То же самое сделать для городов в которых есть символ “-”. Написать все в одном запросе.
SELECT 
    cat.name AS category_best_seller
FROM
    category cat
    JOIN film_category fc ON cat.category_id = fc.category_id
    JOIN inventory inv ON fc.film_id = inv.film_id
    JOIN rental ren ON inv.inventory_id = ren.inventory_id
    JOIN customer cust ON ren.customer_id = cust.customer_id
    JOIN address addr ON cust.address_id = addr.address_id
    JOIN city cit ON addr.city_id = cit.city_id
WHERE 
    cit.city LIKE 'a%' OR cit.city LIKE '%-%'
GROUP BY 
    cat.name
ORDER BY 
    SUM(EXTRACT(EPOCH FROM (ren.return_date - ren.rental_date)) / 3600) DESC
LIMIT 1;
