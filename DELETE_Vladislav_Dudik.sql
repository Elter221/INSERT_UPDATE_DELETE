-- Удаляем данные из film_actor
DELETE FROM film_actor
WHERE film_id = (SELECT film_id
	FROM film
	WHERE title = 'In Bruges')

--Если бы были записи rental, то сначала надо очистить payment
DELETE FROM payment
WHERE rental_id = (
	SELECT rental_id
	FROM rental
	WHERE inventory_id = (
		SELECT inventory_id
		FROM inventory
        JOIN film USING(film_id)
        WHERE title = 'In Bruges'))

--Если бы были записи в rental то удалим и их
DELETE FROM rental
WHERE inventory_id = (
		SELECT inventory_id FROM inventory
        JOIN film USING(film_id)
        WHERE title = 'In Bruges')

--Удаляем данные в inventory
DELETE FROM inventory
WHERE film_id = (
	SELECT film_id
	FROM film
	WHERE title = 'In Bruges'
)

-- Удаляем сам фильм
DELETE FROM film
WHERE title = 'In Bruges'

DELETE FROM payment
WHERE customer_id = (
	SELECT customer_id
	FROM customer
	WHERE last_name = 'Dudik')

DELETE FROM rental
WHERE customer_id = (
	SELECT customer_id
	FROM customer
	WHERE last_name = 'Dudik')

