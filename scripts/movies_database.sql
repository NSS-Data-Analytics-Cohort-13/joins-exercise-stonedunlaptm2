--1. Give the name, release year, and worldwide gross of the lowest grossing movie.

SELECT
s.movie_id,
s.film_title,
s.release_year ,
r.worldwide_gross
FROM specs AS s
LEFT JOIN revenue as r
ON s.movie_id=r.movie_id
ORDER BY r.worldwide_gross ASC;
--Answer: Semi-Tought, 1977, 37187139

--2. What year has the highest average imdb rating?
SELECT
s.movie_id,
s.release_year,
r.imdb_rating
FROM specs AS S
LEFT JOIN rating as r
ON s.movie_id=r.movie_id
ORDER BY release_year DESC;
--Answer 2019

--3. What is the highest grossing G-rated movie? 

SELECT 
s.movie_id,
s.film_title,
s.mpaa_rating,
r.worldwide_gross
FROM specs as s
LEFT JOIN revenue as r
ON s.movie_id = r.movie_id
WHERE s.mpaa_rating = 'G'
ORDER BY r.worldwide_gross DESC

--Answer: Toy Story 4

--Which company distributed it?



--4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.
SELECT 
	d.distributor_id,
	d.company_name,
	s.domestic_distributor_id,
	s.film_title
FROM distributors as d
FULL JOIN specs as s
ON d.distributor_id=s.domestic_distributor_id;


--5. Write a query that returns the five distributors with the highest average movie budget.
SELECT 
r.movie_id,
r.film_budget
d.distributor_id
FROM revenue as r
INNER JOIN distributor as d
ON r.movie_id = d.distributor_id
ORDER BY film_budget DESC
LIMIT 5;

--6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
--7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?
