-- Select count of actors first names in descending order
SELECT first_name, COUNT(first_name) AS count
FROM actor
GROUP BY first_name
ORDER BY count DESC;

-- Select the average duration of movies by rating
SELECT rating, ROUND(AVG(length), 2) AS avg_duration
FROM film
GROUP BY rating
ORDER BY avg_duration ASC;

-- Select top ten replace costs for the length of the movie
SELECT length, ROUND(AVG(replacement_cost),2) as avg
FROM film
GROUP BY LENGTH
ORDER BY avg DESC
LIMIT 10;

-- Select the count of countries
SELECT country.country AS nation, COUNT(country.country) AS count
FROM city
JOIN country
ON city.country_id = country.country_id
GROUP BY nation 
ORDER BY count DESC;