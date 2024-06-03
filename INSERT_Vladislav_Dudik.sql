INSERT INTO film(
	title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext)
	VALUES (
	'In Bruges',
	'Belgium, the last place in the world Ray wants to be',
	2008, 
	(SELECT language_id 
	FROM language
	WHERE UPPER(name) = UPPER('german')),
	(SELECT language_id 
	FROM language
	WHERE UPPER(name) = UPPER('english')),
	2,
	4.99,
	107,
	19.99,
	'NC-17',
	DEFAULT,
	'{Trailers}',
	'caper:1 car:11 convent:20 fate:4 moos:8 motion:2 must:13 mysql:19 pursu:14 saga:5 woman:16');

INSERT INTO actor(first_name, last_name)
	VALUES 
	('Colin', 'Farrell'),
	('Brendan', 'Gleeson'),
	('Ralph', 'Fiennes');

INSERT INTO film_actor(actor_id, film_id)
	SELECT a.actor_id, (SELECT f.film_id
	FROM film f
	WHERE f.title = 'In Bruges')
	FROM actor a
	WHERE a.first_name ='Colin' AND a.last_name = 'Farrell'
	UNION ALL
	SELECT a.actor_id, (SELECT f.film_id
	FROM film f
	WHERE f.title = 'In Bruges')
	FROM actor a
	WHERE a.first_name ='Brendan' AND a.last_name = 'Gleeson'
	UNION ALL
	SELECT a.actor_id, (SELECT f.film_id
	FROM film f
	WHERE f.title = 'In Bruges')
	FROM actor a
	WHERE a.first_name ='Ralph' AND a.last_name = 'Fiennes';

INSERT INTO inventory(film_id, store_id)
	SELECT film_id, (2)
	FROM film
	WHERE title = 'In Bruges';


SELECT *
from film
where title = 'In Bruges'

SELECT *
FROM actor
WHERE actor_id IN (201,202,203)

SELECT *
FROM film_actor
WHERE film_id = 1001

SELECT *
from inventory
where film_id = 1001