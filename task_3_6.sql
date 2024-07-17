SELECT
    ci.city,
    COUNT(CASE WHEN cu.active = 1 THEN 1 END) AS active,
    COUNT(CASE WHEN cu.active = 0 THEN 1 END) AS inactive
FROM
    city ci
LEFT JOIN
    address ad ON ci.city_id = ad.city_id
LEFT JOIN
    customer cu ON ad.address_id = cu.address_id
GROUP BY
    ci.city
ORDER BY
    inactive DESC;
