-- Week 5 - Monday Questions


-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg';
-- A) There are two actors with the last name 'Wahlberg'
--------------------------------------------------------------------


-- 2. How many payments were made between $3.99 and $5.99?

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- A) there are 5,602 payments made that are 3.99 and 5.99
--------------------------------------------------------------------


-- 3. What film does the store have the most of? (search in inventory)

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
-- A) The store has 72 different films that each have 8 copies, which is the highest number of copies of any film. These IDs are (193 789 730 378 595 849 231 586 69 764 745 1 767 369 738 638 31 356 199 683 127 609 403 174 266 109 434 220 239 873 893 468 525 897 697 835 773 945 444 412 880 846 331 911 621 301 1000 361 91 200 358 973 350 559 86 489 382 702 531 856 870 295 206 73 418 460 103 341 748 500 753 572)
--------------------------------------------------------------------


-- 4. How many customers have the last name ‘William’?

SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William';
-- A) There are no customers with the last name 'William'
--------------------------------------------------------------------


-- 5. What store employee (get the id) sold the most rentals?

SELECT COUNT(rental_id), staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_id);
-- A) The employee with the staff ID '1' has the most rentals with 8040, coming in first out of two.
--------------------------------------------------------------------


-- 6. How many different district names are there?

SELECT COUNT(DISTINCT district)
from address;
-- A) There are 378 unique district names.
--------------------------------------------------------------------


-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;
-- A) The film with the ID '508' has the most actors in it with 15.
--------------------------------------------------------------------


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(last_name)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';
-- A) There are 13 customers at store ID '1' that have last names that end with 'es'
--------------------------------------------------------------------


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)

SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;
-- A) Three payment amounts (0.99, 2.99, & 4.99) had payment amounts above 250 for the customers with IDs that are between 380 and 430
--------------------------------------------------------------------


-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?

SELECT COUNT(DISTINCT rating)
FROM film;

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;
-- A) There are five films rating categories, of which PG-13 contains the most films.