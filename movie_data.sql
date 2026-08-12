-- Database: movie_data

-- DROP DATABASE IF EXISTS movie_data;

CREATE DATABASE movie_data
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;




-- create the directors table 



CREATE TABLE directors (
	director_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30) NOT NULL,
	date_of_birth DATE,
	nationality VARCHAR(20)

);

SELECT * FROM directors

-- create actors table for practice

create TABLE actors (
	actor_oid SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30) NOT NULL,
	Gender CHAR(1),
	date_of_birth DATE
);

SELECT * FROM actors;

-- next lesson practice creating movie db

CREATE TABLE movie (
 		 movie_id SERIAL PRIMARY KEY,
		 movie_name VARCHAR(50) NOT NULL,
		 movie_length INT,
		 movie_lang VARCHAR(20),
		 release_date DATE,
		 age_certification VARCHAR(5),
		 director_id INT REFERENCES directors (director_id)
);


drop table movie;

CREATE TABLE movies (
 		 movie_id SERIAL PRIMARY KEY,
		 movie_name VARCHAR(50) NOT NULL,
		 movie_length INT,
		 movie_lang VARCHAR(20),
		 release_date DATE,
		 age_certification VARCHAR(5),
		 director_id INT REFERENCES directors (director_id)
);


SELECT * FROM movies;

-- create practice table movie_revenues

CREATE TABLE movie_revenues (
		revenue_id SERIAL PRIMARY KEY,
		movie_id INT REFERENCEs movies (movie_id),
		domestic_takings NUMERIC(6,2),
		international_takings NUMERIC(6,2)
);

SELECT * FROM movie_revenues;

--correcting columnn name in actors db from actor_oid to actor_id

ALTER TABLE actors
RENAME COLUMN actor_oid TO actor_id;

-- creating junction table

CREATE TABLE movies_actors(
		movie_id INT REFERENCES movies (movie_id),
		actor_id INT REFERENCES actors (actor_id),
		PRIMARY KEY (movie_id,actor_id)
);

SELECT * FROM movies_actors;

