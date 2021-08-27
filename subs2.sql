-- Inner Join on the Actor and Film_Actor Table
SELECT actor.actor_id, first_name,last_name,film_id
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

SELECT film.film_id, title, release_year, actor_id
FROM film_actor
JOIN film
ON film.film_id = film_actor.film_id;

SELECT film.film_id, title, actor.actor_id, first_name, last_name, release_year
FROM film_actor
JOIN actor
ON film_actor.actor_id = actor.actor_id
JOIN film
ON film.film_id = film_actor.film_id
WHERE actor.last_name LIKE '%s'
ORDER BY film.title;


-- SUBQUERIES --
-- 2 seperate queries which are combined with one executing based on result of first execution

-- Find all customers that have made payment of more than 175

SELECT *
FROM payment;

-- need customer_id and amount

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 6.99
ORDER BY SUM(amount) DESC;

SELECT *
FROM customer
WHERE customer_id IN (148, 526, 178, 137, 144, 459);

--PUT INTO SUBQUERY--
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

--BAD EXAMPLE--
-- Return a table of films based on the film_id = actor_id
SELECT *
FROM film
WHERE film_id IN (
    -- SUBQ is return a list of actors who have been in > 10 films
    SELECT actor_id
    FROM film_actor
    WHERE actor_id < 10
);



SELECT film.title, actor.first_name, actor.last_name
FROM film_actor
JOIN film
ON film_actor.film_id = film.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE film.film_id IN (
    SELECT film_id
    FROM film
    WHERE rental_rate >= 4.99
)
ORDER BY film.title;