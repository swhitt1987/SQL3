-- List all customers who live in Texas (use JOINs)
SELECT first_name,last_name,district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
where district like 'Texas'

-- Get all payments above $6.99 with the Customer's Full Name
SELECT first_name,last_name,amount
from payment
full join customer
on customer.customer_id = payment.customer_id 
where amount > 6.99

-- Show all customers names who have made payments over $175(use subqueries)
SELECT store_id,first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY store_id,first_name,last_name;

-- List all customers that live in Nepal (use the city table)
select * from customer
select * from address
select * from city
select * from country


SELECT customer.first_name,customer.last_name,country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- Which staff member had the most transactions?
select staff_id, sum(staff_id) from rental group by staff_id;

select * from salesperson;

--How many movie sof each rating are there?
select count(rating)
from film
where rating = 'G'

select count(rating)
from film
where rating = 'PG'

select count(rating)
from film
where rating = 'R'

select count(rating)
from film
where rating = 'NC-17'

-- Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 6.99
	ORDER BY SUM(amount) DESC
)
GROUP BY first_name,last_name;

-- #8
select * from rental

select * from payment

SELECT count(amount)
from payment
full join rental
on payment.rental_id  = rental.rental_id 
where amount < 0.01



