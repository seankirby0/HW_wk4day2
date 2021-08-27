SELECT *
FROM actor

--1. List all customers who live in Texas (use JOINs)
SELECT *
FROM address
-- JOIN customer


WHERE district = 'Texas';

-- INNER JOIN actor
-- ON actor.actor_id = film_actor.actor_id;

--DONE

--2. Get all payments above $6.99 with the Customer’s full name
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 6.99
ORDER BY SUM(amount) DESC;
--DONE



--3. Show all customer names who have made payments over $175 (use subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);
-- DONE


--4. List all customers that live in Nepal (use the city table)
SELECT * 
FROM city 
WHERE city = 'Nepal';
-- 0 customers live in Nepal

-- 5. Which staff member had the most transactions?
SELECT *
FROM sales_by_store


-- 6. What film had the most actors in it?
SELECT film_id, COUNT(*)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(*) DESC;

SELECT *
FROM film
WHERE film_id = '508'
-- Lambs Cincinatti (id 508) has the most actors--


-- 7. Which actor has been in the least movies?



-- 8. How many districts have more than 5 customers in it?