CREATE TYPE type_role AS ENUM ('admin', 'user');

CREATE TYPE order_status AS ENUM ('pending', 'paid', 'canceled', 'refunded');

-- USERS & PROFILES
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role type_role,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE profiles (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users (id),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone VARCHAR(20),
    avatar_url VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- MOVIES
CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    tmdb_id INT UNIQUE,
    title VARCHAR(255),
    overview TEXT,
    release_date DATE,
    runtime INT,
    poster_path VARCHAR(255),
    backdrop_path VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- GENRES & CATEGORIES
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    tmdb_id INT UNIQUE,
    name VARCHAR(100)
);

CREATE TABLE movie_genres (
    movie_id INT REFERENCES movies (id),
    genre_id INT REFERENCES genres (id),
    PRIMARY KEY (movie_id, genre_id)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);

CREATE TABLE movie_categories (
    movie_id INT REFERENCES movies (id),
    category_id INT REFERENCES categories (id),
    PRIMARY KEY (movie_id, category_id)
);

-- CASTS & CREW
CREATE TABLE persons (
    id SERIAL PRIMARY KEY,
    tmdb_id INT UNIQUE,
    name VARCHAR(100),
    profile_path VARCHAR(255)
);

CREATE TABLE movie_casts (
    movie_id INT REFERENCES movies (id),
    person_id INT REFERENCES persons (id),
    role VARCHAR(50),
    PRIMARY KEY (movie_id, person_id)
);

-- CINEMA, LOCATION, TIME
CREATE TABLE cinemas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    image_url VARCHAR(255)
);

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    location VARCHAR(100)
);

CREATE TABLE times (
    id SERIAL PRIMARY KEY,
    start_time TIMESTAMP
);

-- SCHEDULES
CREATE TABLE schedules (
    id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies (id),
    cinema_id INT REFERENCES cinemas (id),
    location_id INT REFERENCES locations (id),
    time_id INT REFERENCES times (id),
    date DATE
);

-- ORDERS
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (id),
    schedule_id INT REFERENCES schedules (id),
    order_date TIMESTAMP,
    total_price DECIMAL(10, 2),
    status order_status
);

-- OPTIONAL SEATS
CREATE TABLE seats (
    id SERIAL PRIMARY KEY,
    cinema_id INT REFERENCES cinemas (id),
    seat_code VARCHAR(10)
);

CREATE TABLE order_seats (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders (id),
    seat_code VARCHAR(10)
);

-- PAYMENTS
CREATE TABLE payments_method (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT UNIQUE REFERENCES orders (id),
    payment_method_id INT REFERENCES payments_method (id),
    virtual_account VARCHAR(20) UNIQUE,
    amount DECIMAL(10, 2),
    status order_status,
    paid_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- ORDER HISTORY
CREATE TABLE order_history (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (id),
    order_id INT REFERENCES orders (id),
    status order_status,
    created_at TIMESTAMP
);

DROP TABLE IF EXISTS movie_genres,
movie_categories,
genres,
categories,
movies CASCADE;

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    tmdb_id INT UNIQUE,
    title VARCHAR(255),
    overview TEXT,
    release_date DATE,
    runtime INT,
    poster_path VARCHAR(255),
    backdrop_path VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- GENRES
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    tmdb_id INT UNIQUE,
    name VARCHAR(100)
);

CREATE TABLE movie_genres (
    movie_id INT REFERENCES movies (id) ON DELETE CASCADE,
    genre_id INT REFERENCES genres (id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, genre_id)
);

-- CATEGORIES
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);

CREATE TABLE movie_categories (
    movie_id INT REFERENCES movies (id) ON DELETE CASCADE,
    category_id INT REFERENCES categories (id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, category_id)
);