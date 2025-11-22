USE sakila;
SELECT COUNT(*) FROM film;
SELECT COUNT(*) FROM film_text;

-- 1) Display all available tables in the Sakila database.
SHOW FULL TABLES;

-- 2) Retrieve all the data from the tables `actor`, `film` and `customer`.
SELECT * FROM actor, film, customer;

-- 3. Retrieve the following columns from their respective tables:
	-- 3.1 Titles of all films from the `film` table
	-- 3.2 List of languages used in films, with the column aliased as `language` from the `language` table
	-- 3.3 List of first names of all employees from the `staff` table
    
select f.title, l.name as language
from sakila.film f inner join sakila.language l on f.language_id = l.language_id;

select first_name from staff;

-- 4. Retrieve unique release years.
SELECT DISTINCT release_year FROM film

-- 5. Counting records for database insights:
	-- 5.1 Determine the number of stores that the company has.
	-- 5.2 Determine the number of employees that the company has.
	-- 5.3 Determine how many films are available for rent and how many have been rented.
	-- 5.4 Determine the number of distinct last names of the actors in the database.

SELECT count(*) FROM store; 
SELECT count(*) FROM staff; 

SELECT
    (SELECT COUNT(*) 
     FROM inventory)                      AS films_available_for_rent,
    (SELECT COUNT(DISTINCT inventory_id)  
     FROM rental)                         AS films_rented;

select count(distinct last_name) from actor;

-- 6. Retrieve the 10 longest films.
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

-- 7.  Use filtering techniques in order to:
	-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT *
FROM actor
WHERE first_name  = "SCARLETT";

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes. 
SELECT * 
FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

	-- 7.3 Determine the number of films that include Behind the Scenes content
SELECT COUNT(*)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';