-- USERS
INSERT INTO
    users (
        id,
        email,
        password_hash,
        role,
        created_at,
        updated_at
    )
VALUES (
        1,
        'ce@mail.com',
        'hashed_ce_pass',
        'admin',
        NOW(),
        NOW()
    ),
    (
        2,
        'oped@mail.com',
        'hashed_oped_pass',
        'user',
        NOW(),
        NOW()
    ),
    (
        3,
        'radif@mail.com',
        'hashed_radif_pass',
        'user',
        NOW(),
        NOW()
    );

-- PROFILES
INSERT INTO
    profiles (
        id,
        user_id,
        first_name,
        last_name,
        phone,
        avatar_url,
        created_at,
        updated_at
    )
VALUES (
        1,
        1,
        'Ce',
        'Gans',
        '081234567890',
        'https://img.com/ce.png',
        NOW(),
        NOW()
    ),
    (
        2,
        2,
        'Oped',
        'As',
        '081298765432',
        'https://img.com/oped.png',
        NOW(),
        NOW()
    ),
    (
        3,
        3,
        'Radif',
        'Muh',
        '081211122233',
        'https://img.com/radif.png',
        NOW(),
        NOW()
    );

-- MOVIES
INSERT INTO
    movies (
        id,
        tmdb_id,
        title,
        overview,
        release_date,
        runtime,
        poster_path,
        backdrop_path,
        created_at,
        updated_at
    )
VALUES (
        1,
        27205,
        'Inception',
        'A thief enters dreams to steal secrets.',
        '2010-07-16',
        148,
        '/poster1.jpg',
        '/backdrop1.jpg',
        NOW(),
        NOW()
    ),
    (
        2,
        157336,
        'Interstellar',
        'Explorers travel through a wormhole in space.',
        '2014-11-07',
        169,
        '/poster2.jpg',
        '/backdrop2.jpg',
        NOW(),
        NOW()
    ),
    (
        3,
        299534,
        'Avengers: Endgame',
        'Final battle against Thanos.',
        '2019-04-26',
        181,
        '/poster3.jpg',
        '/backdrop3.jpg',
        NOW(),
        NOW()
    );

-- GENRES
INSERT INTO
    genres (id, tmdb_id, name)
VALUES (1, 28, 'Action'),
    (2, 12, 'Adventure'),
    (3, 878, 'Sci-Fi'),
    (4, 18, 'Drama');

-- MOVIE_GENRES
INSERT INTO
    movie_genres (movie_id, genre_id)
VALUES (1, 3), -- Inception - Sci-Fi
    (2, 3), -- Interstellar - Sci-Fi
    (2, 4), -- Interstellar - Drama
    (3, 1), -- Endgame - Action
    (3, 2);
-- Endgame - Adventure

-- CATEGORIES
INSERT INTO
    categories (id, name)
VALUES (1, 'Upcoming'),
    (2, 'Popular'),
    (3, 'Top Rated');

-- MOVIE_CATEGORIES
INSERT INTO
    movie_categories (movie_id, category_id)
VALUES (1, 3), -- Inception - Top Rated
    (2, 2), -- Interstellar - Popular
    (3, 1);
-- Endgame - Upcoming

-- PERSONS (Cast & Crew)
INSERT INTO
    persons (
        id,
        tmdb_id,
        name,
        profile_path
    )
VALUES (
        1,
        500,
        'Leonardo DiCaprio',
        '/leo.jpg'
    ),
    (
        2,
        3223,
        'Matthew McConaughey',
        '/matt.jpg'
    ),
    (
        3,
        1245,
        'Robert Downey Jr.',
        '/rdj.jpg'
    );

-- MOVIE_CASTS
INSERT INTO
    movie_casts (movie_id, person_id, role)
VALUES (1, 1, 'Actor'),
    (2, 2, 'Actor'),
    (3, 3, 'Actor');

-- CINEMAS
INSERT INTO
    cinemas (id, name, image_url)
VALUES (
        1,
        'CGV Mall A',
        'https://img.com/cgv.png'
    ),
    (
        2,
        'XXI Mall B',
        'https://img.com/xxi.png'
    );

-- LOCATIONS
INSERT INTO
    locations (id, location)
VALUES (1, 'Jakarta'),
    (2, 'Bandung');

-- TIMES
INSERT INTO
    times (id, start_time)
VALUES (1, '2025-09-05 19:00:00'),
    (2, '2025-09-06 20:00:00'),
    (3, '2025-09-07 18:30:00');

-- SCHEDULES
INSERT INTO
    schedules (
        id,
        movie_id,
        cinema_id,
        location_id,
        time_id,
        date
    )
VALUES (1, 1, 1, 1, 1, '2025-09-05'),
    (2, 2, 2, 2, 2, '2025-09-06'),
    (3, 3, 1, 1, 3, '2025-09-07');

-- SEATS (cinema seat layout)
INSERT INTO
    seats (id, cinema_id, seat_code)
VALUES (1, 1, 'A1'),
    (2, 1, 'A2'),
    (3, 1, 'A3'),
    (4, 2, 'B1'),
    (5, 1, 'C1');

-- ORDERS
INSERT INTO
    orders (
        id,
        user_id,
        schedule_id,
        order_date,
        total_price,
        status
    )
VALUES (1, 2, 1, NOW(), 50000, 'paid'),
    (
        2,
        3,
        2,
        NOW(),
        60000,
        'pending'
    );

-- ORDER_SEATS
INSERT INTO
    order_seats (id, order_id, seat_code)
VALUES (1, 1, 'A2'), -- Budi pesan Inception seat A2
    (2, 2, 'B1');
-- Siti pesan Interstellar seat B1

-- PAYMENT METHODS
INSERT INTO
    payments_method (id, name)
VALUES (1, 'BCA VA'),
    (2, 'GoPay'),
    (3, 'OVO');

-- PAYMENTS
INSERT INTO
    payments (
        id,
        order_id,
        payment_method_id,
        virtual_account,
        amount,
        status,
        paid_at,
        created_at,
        updated_at
    )
VALUES (
        1,
        1,
        1,
        '1234567890',
        50000,
        'paid',
        NOW(),
        NOW(),
        NOW()
    ),
    (
        2,
        2,
        2,
        '9876543210',
        60000,
        'pending',
        NULL,
        NOW(),
        NOW()
    );

-- ORDER HISTORY
INSERT INTO
    order_history (
        id,
        user_id,
        order_id,
        status,
        created_at
    )
VALUES (1, 2, 1, 'paid', NOW()),
    (2, 3, 2, 'pending', NOW());