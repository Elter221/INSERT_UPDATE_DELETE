UPDATE film
SET rental_duration = 3, rental_rate = 9.99
WHERE title = 'In Bruges'

SELECT *
FROM film
WHERE title = 'In Bruges'

UPDATE customer
SET first_name = 'Vladislav',
	last_name = 'Dudik',
	address_id = (SELECT address_id FROM address WHERE city_id = (SELECT city_id FROM city WHERE city = 'Bern')),
	email = 'dudik.vladislav@student.ehu.lt'
WHERE customer_id = (
	SELECT r.customer_id
	FROM rental r
	JOIN payment p ON r.rental_id = p.rental_id
	GROUP BY r.customer_id
	HAVING COUNT(r.rental_id) >= 10 AND COUNT(p.payment_id) >= 10
	LIMIT 1)

UPDATE customer
SET create_date = current_date