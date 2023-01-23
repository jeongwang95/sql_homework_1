-- 1. How many actors are there with the last name "Wahlberg"?
SELECT COUNT(last_name) AS count_of_wahlberg
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of?
SELECT film_id, COUNT(film_id) as count_film
FROM inventory
GROUP BY film_id
ORDER BY count_film DESC;

-- 4. How many customers have the last name "William"
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';

-- 5. What store employee sold the most rentals?
SELECT staff_id, count(rental_id) as rental_count
FROM rental
GROUP BY staff_id
ORDER BY rental_count DESC
LIMIT 1;

-- 6. How many different district names are there?
SELECT count(DISTINCT district)
FROM address;

-- 7. What film has the most actors in it?
SELECT film_id, COUNT(actor_id) as actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC
LIMIT 1;

-- 8. From store_id 1, how many customers have a last name ending with 'es'
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

-- 9. How many payment amounts had a number of rentals above 250 for customers
--    with ids between 380 and 430
SELECT amount, COUNT(DISTINCT amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;

-- 10. Within the film table, how many rating categories are there? 
--     And what rating has the most movies total?
SELECT COUNT(DISTINCT rating) as rating_type, rating, COUNT(rating) as movie_count
FROM film
GROUP BY rating
ORDER BY movie_count DESC
LIMIT 1;
