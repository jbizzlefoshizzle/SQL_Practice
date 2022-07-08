-- 1. What is the average cost to rent a film in the Sakila stores?
SELECT ROUND(
	AVG(rental_rate),2)
FROM film;

-- 2. What is the average rental cost of films by rating? On average, what is the cheapest rating of films to rent? Most expensive?
DROP VIEW IF EXISTS avg_rental_cost

CREATE VIEW avg_rental_cost AS 
SELECT rating, ROUND(
	AVG(rental_rate),2)
	as avg_cost
FROM film
GROUP BY rating
ORDER BY avg_cost DESC;

SELECT * FROM avg_rental_cost;

SELECT rating, avg_cost
FROM avg_rental_cost
WHERE avg_cost=(
	SELECT MIN(avg_cost)
	FROM avg_rental_cost)
UNION
SELECT rating, avg_cost
FROM avg_rental_cost
WHERE avg_cost=(
	SELECT MAX(avg_cost)
	FROM avg_rental_cost)
;

-- 3. How much would it cost to replace all the films in the database?
SELECT SUM(replacement_cost)
FROM film;

-- 4. How much would it cost to replace all the films in each ratings category?
SELECT rating, SUM(replacement_cost) as sum_replace
FROM film
GROUP BY rating
ORDER BY sum_replace ASC;

-- 5. How long is the longest movie in the database? The shortest?
SELECT title, length
FROM film
WHERE length=(
	SELECT MAX(length) FROM film)
UNION ALL
SELECT title, length
FROM film
WHERE length=(
	SELECT MIN(length) FROM film)
;