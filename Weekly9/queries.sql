-- Login
SELECT id, email, password_hash, role
FROM users
WHERE
    email = 'ce@mail.com';

--Register
INSERT INTO
    users (
        email,
        password_hash,
        role,
        created_at,
        updated_at
    )
VALUES (
        'user1@mail.com',
        'xxxhash',
        'user',
        NOW(),
        NOW()
    );

--Get Upcoming Movie
SELECT m.id, m.title, m.release_date, m.poster_path
FROM
    movies m
    JOIN movie_categories mc ON mc.movie_id = m.id
    JOIN categories c ON c.id = mc.category_id
WHERE
    c.name = 'Upcoming';

--Get Popular Movie
SELECT m.id, m.title, m.release_date, m.poster_path
FROM
    movies m
    JOIN movie_categories mc ON mc.movie_id = m.id
    JOIN categories c ON c.id = mc.category_id
WHERE
    c.name = 'Popular';

--Get Movie with Pagination
SELECT
    id,
    title,
    release_date,
    poster_path
FROM movies
ORDER BY release_date DESC
LIMIT 10
OFFSET
    0;
-- Page 1

--Filter Movie by Name and Genre with Pagination
SELECT m.id, m.title, g.name AS genre, m.release_date
FROM
    movies m
    JOIN movie_genres mg ON mg.movie_id = m.id
    JOIN genres g ON g.id = mg.genre_id
WHERE
    m.title ILIKE '%inter%'
    AND g.name = 'Sci-Fi'
LIMIT 10
OFFSET
    0;

--Get Schedule
SELECT s.id, m.title, c.name AS cinema, l.location, t.start_time, s.date
FROM
    schedules s
    JOIN movies m ON m.id = s.movie_id
    JOIN cinemas c ON c.id = s.cinema_id
    JOIN locations l ON l.id = s.location_id
    JOIN times t ON t.id = s.time_id
WHERE
    m.id = 2;

--Get Seat Sold
SELECT os.seat_code
FROM order_seats os
    JOIN orders o ON o.id = os.order_id
WHERE
    o.schedule_id = 1
    AND o.status = 'paid';

--Get Movie Detail
SELECT
    m.id,
    m.title,
    m.overview,
    m.release_date,
    m.runtime,
    array_agg (DISTINCT g.name) AS genres,
    array_agg (DISTINCT p.name) AS casts
FROM
    movies m
    LEFT JOIN movie_genres mg ON mg.movie_id = m.id
    LEFT JOIN genres g ON g.id = mg.genre_id
    LEFT JOIN movie_casts mc ON mc.movie_id = m.id
    LEFT JOIN persons p ON p.id = mc.person_id
WHERE
    m.id = 1
GROUP BY
    m.id;

--Create Order
INSERT INTO
    orders (
        user_id,
        schedule_id,
        order_date,
        total_price,
        status
    )
VALUES (2, 1, NOW(), 50000, 'pending') RETURNING id;

--Get Profile
SELECT u.id, u.email, p.first_name, p.last_name, p.phone, p.avatar_url
FROM users u
    JOIN profiles p ON p.user_id = u.id
WHERE
    u.id = 2;

--Get History
SELECT o.id, m.title, o.total_price, o.status, o.order_date
FROM
    orders o
    JOIN schedules s ON s.id = o.schedule_id
    JOIN movies m ON m.id = s.movie_id
WHERE
    o.user_id = 2
ORDER BY o.order_date DESC;

--Edit Profile
UPDATE profiles
SET
    first_name = 'Oped Updated',
    phone = '081299988877',
    updated_at = NOW()
WHERE
    user_id = 2;

--Get All Movie (Admin)
SELECT id, title, release_date, runtime
FROM movies
ORDER BY created_at DESC;

--Delete Movie (Admin)
DELETE FROM movies WHERE id = 3;

--Edit Movie (Admin)
UPDATE movies
SET
    title = 'Inception (Updated)',
    runtime = 150,
    updated_at = NOW()
WHERE
    id = 1;