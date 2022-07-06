-- 1. What is the average cost to rent a film in the Sakila stores?
SELECT ROUND(
	(SELECT AVG(rental_rate) FROM film),2)
AS "Average Rental Rate";

-- 2. What is the average rental cost of films by rating? On average, what is the cheapest rating of films to rent? Most expensive?
SELECT rating, ROUND(
	AVG(rental_rate),2) 
	AS "Average Rental Cost"
FROM FILM
GROUP BY rating
ORDER BY "Average Rental Cost" ASC;

-- 3. How much would it cost to replace all the films in the database?
SELECT SUM(replacement_cost) AS "Total Replacement Cost"
FROM film;

-- 4. How much would it cost to replace all the films in each ratings category?
SELECT rating ,SUM(replacement_cost) AS "total replacement cost"
FROM film
GROUP BY rating
ORDER BY "total replacement cost" ASC;

-- 5. How long is the longest movie in the database? The shortest?
SELECT MAX(length)
FROM film;