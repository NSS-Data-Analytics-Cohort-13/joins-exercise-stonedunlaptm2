--1. Give the name, release year, and worldwide gross of the lowest grossing movie.

SELECT
s.movie_id,
s.film_title,
s.release_year ,
r.worldwide_gross
FROM specs AS s
LEFT JOIN revenue AS r
ON s.movie_id=r.movie_id
ORDER BY r.worldwide_gross ASC;
--Answer: Semi-Tought, 1977, 37187139

--2. What year has the highest average imdb rating?
SELECT
s.release_year,
AVG (r.imdb_rating) as avg_rating
FROM specs AS S
LEFT JOIN rating as r
ON s.movie_id=r.movie_id
GROUP BY s.release_year
ORDER BY avg_rating DESC;
--Answer 1991

--3. What is the highest grossing G-rated movie? 

SELECT 

--Which company distributed it?

SELECT 
s.movie_id,
s.film_title,
s.mpaa_rating,
s.domestic_distributor_id,
d.distributor_id
FROM distributors as d
LEFT JOIN specs as s
ON d.distributor_id=s.domestic_distributor_id
WHERE s.mpaa_rating = 'G'
--Answer: Walt Disney

--4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.
SELECT 
	DISTINCT d.distributor_id,
	d.company_name,
	COUNT(s.movie_id) AS number_of_movies
FROM specs as s
LEFT JOIN distributors as d
ON d.distributor_id=s.domestic_distributor_id
GROUP BY d.distributor_id, d.company_name;
--Answer- Complete

--5. Write a query that returns the five distributors with the highest average movie budget.
SELECT 
r.movie_id,
r.film_budget,
d.distributor_id,
r.worldwide_gross
FROM distributor as d
LEFT JOIN revenue as r
ON d.distributor_id AND r.movie_id 
ORDER BY film_budget DESC
LIMIT 5;

--6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
SELECT 
d.company_name,
d.headquarters,
r.imdb_rating
FROM distributors as d
LEFT JOIN rating as r
ON d.distributor_id=r.movie_id
WHERE d.headquarters NOT LIKE 'CA'
ORDER BY r.imdb_rating ASC;

--7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?
SELECT
    s.movie_id,
    s.film_title,
    s.length_in_min,
    AVG(r.imdb_rating) AS avg_rating
FROM specs AS s
LEFT JOIN rating AS r 
ON s.movie_id = r.movie_id
GROUP BY s.movie_id, s.film_title, s.length_in_min, r.imdb_rating
ORDER BY avg_rating DESC;
--Answer- 2 hour or more mmovies had a higher average


--CASE WHEN (condition) THEN (return if true) ELSE (return if false) END
