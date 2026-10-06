use project_movie_database;
-- Q1. a) Get all data about movies
select * from movies;
select count(*) as movie_table_count from movies;

-- Q2. b) Get all data about directors
select * from directors;
select count(*) as directors_table_count from directors;

-- Q3. c) Check how many movies are present in IMDB.
select count(*) as movie_table_count from movies;

-- Q4. d) Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors where name IN ('James Cameron','Luc Besson','John Woo');

-- Q5. e)	Find all directors with name starting with S.
select * from directors where name like 'S%';

-- Q6. f) Count female directors
-- gender: 0/2 = Male, 1 = Female
select COUNT(*) AS female_director_count from directors where gender='1';

-- Q7. g) Find the name of the 10th first women director
select name from directors where gender='1' order by id asc limit 9,1;

-- Q8. h) What are the 3 most popular movies
select * from movies order by popularity desc limit 3;

-- Q9. i) What are the 3 most bankable movies?
select title,budget,revenue,(revenue - budget) AS profit from movies order by profit desc limit 3;

-- Q10. j) What is the most awarded average vote since Jan 1, 2000?
select title, release_date, vote_average from movies where release_date >= '2000-01-01' order by vote_average desc limit 1;

-- Q11. k) Which movie(s) were directed by Brenda Chapman?
select m.original_title,m.title,m.director_id,d.name AS director_name from movies as m join directors d on m.director_id = d.id where d.name='Brenda Chapman';
select * from directors where name = 'Brenda Chapman';
select * from movies where director_id = 4801;

-- Q12. l) Which director made the most movies?
select d.name as director_name, count(m.id) as movies_count from movies as m join directors d on m.director_id = d.id group by director_name order by movies_count desc;

-- Q13. m) Which director is the most bankable?
-- "bankable" = highest total profit across all their movies
select d.name as director_name, sum(m.revenue - m.budget) as total_profit, count(m.id) as movies_count from movies as m join directors d on m.director_id = d.id group by director_name order by total_profit desc limit 5;

SELECT COUNT(*) AS zero_budget_count FROM movies WHERE budget = 0 OR budget IS NULL; 
SELECT COUNT(*) AS zero_revenue_count FROM movies WHERE revenue = 0 OR revenue IS NULL;
   
   


