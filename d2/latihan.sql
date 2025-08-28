SELECT release_date
FROM movies
Where
    release_date BETWEEN '2020-01-01 00:00:00' AND '2020-12-31 23:59:59'

SELECT name FROM actors WHERE name LIKE '%s'

SELECT release_date, rating
FROM movies
WHERE
    rating BETWEEN 4 and 7
    AND release_date BETWEEN '2004-01-01 00:00:00' and '2010-12-31 23:59:59';

SELECT
    p.name AS promo_name,
    p.discount,
    pr.name AS product_name,
    pr.price
FROM promos p
    JOIN products pr ON p.id = pr.promo_id

SELECT
    p.name AS promo_name,
    p.discount,
    pr.name AS product_name,
    pr.price
FROM promos p
    LEFT JOIN products pr ON p.id = pr.promo_id

SELECT
    p.name AS promo_name,
    p.discount,
    pr.name AS product_name,
    pr.price
FROM promos p
    RIGHT JOIN products pr ON p.id = pr.promo_id

SELECT p.name AS promo_id, MIN(pr.price) AS min_price
FROM products pr
    JOIN promos p ON p.id = pr.promo_id
GROUP BY
    p.name;
