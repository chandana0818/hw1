-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!


-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers on

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS cast;

-- Create new tables, according to your domain model
-- TODO!
CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    released_year INTEGER,
    MPAA_rating TEXT,
    director TEXT
);

CREATE TABLE person (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE casting (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    movie_id INTEGER,
    salary INTEGER,
    movie_role TEXT
);



-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
INSERT INTO movies VALUES (1,'Batman Begins', 2005, 'PG-13', 'Christopher Nolan' ), 
(2,'The Dark Knight', 2008, 'PG-13', 'Christopher Nolan' ),
(3,'The Dark Knight Rises', 2012, 'PG-13', 'Christopher Nolan' ); 

INSERT INTO person VALUES (1,'Christian', 'Bale'),  
(2,'Michael', 'Caine'),
(3,'Liam', 'Neeson'), 
(4,'Katie', 'Holmes'), 
(5,'Gary', 'Oldman'), 
(6,'Heath', 'Ledger'),
(7,'Tom', 'Hardy'),  
(8,'Joseph', 'Gordon-Levitt'),
(9,'Aaron', 'Eckhart'), 
(10,'Maggie', 'Gyllenhaal'),
(11,'Anne', 'Hathaway');

INSERT INTO casting VALUES (1,1,1, 15000000, 'Bruce Wayne'), (2,2,1, 14000000, 'Alfred'), 
(3,3,1, 12000000, 'Ras Al Ghul'), (4,4,1, 11000000,'Rachel Dawes'), 
(5,5,1, 10000000, 'Commissioner Gordon'), 
(6,1,2, 18000000, 'Bruce Wayne'), 
(7,6,2, 17000000, 'Joker'), 
(8,9,2, 16000000, 'Harvey Dent'), 
(9,2,2, 15000000, 'Alfred'), 
(10,10,2, 14000000, 'Rachel Dawes'), 
(11,1,3, 23000000, 'Bruce Wayne'),
(12,5,3, 18000000, 'Commissioner Gordon'), 
(13,7,3, 17000000, 'Bane'), 
(14,8,3, 16000000, 'John Blake'), 
(15,11,3, 15000000, 'Selina Kyle');



-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
.headers off
select title, released_year,MPAA_rating, director  from movies; 

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!
.headers off
select movies.title, (person.first_name || " " || person.last_name), casting.movie_role from casting inner join person 
on casting.person_id = person.id inner join movies on casting.movie_id = movies.id order by movies.title, casting.salary DESC;
