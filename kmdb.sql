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

CREATE TABLE cast (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    movie_id INTEGER,
    billed_amount INTEGER,
    movie_role TEXT
);



-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
INSERT INTO movies VALUES (1,'Batman Begins', 2005, 'PG-13', 'Christopher Nolan' ), 
(2,'The Dark Knight', 2008, 'PG-13', 'Christopher Nolan' ),
(3,'The Dark Knight Rises', 2012, 'PG-13', 'Christopher Nolan' ); 

INSERT INTO person VALUES (1,'Christian', 'Bale'), (2,'Bruce', 'Wayne'), (3,'Michael', 'Caine'),
(4,'Alfred', ''), (5,'Liam', 'Neeson'), (6,'Ras', 'Al Ghul'),
(7,'Katie', 'Holmes'), (8,'Rachel', 'Dawes'), (9,'Gary', 'Oldman'),
(10,'Commissioner', 'Gordon'), (11,'Heath', 'Ledger'), (12,'Joker', ''),
(13,'Tom', 'Hardy'), (14,'Bane', ''), (15,'Joseph', 'Gordon-Levitt'),
(16,'Aaron', 'Eckhart'), (17,'Harvey', 'Dent'), (18,'Maggie', 'Gyllenhaal'),
(19,'Selina', 'Kyle'), (20,'John', 'Blake'), (21,'Anne', 'Hathaway');

INSERT INTO cast VALUES (1,1,1, 15000000), (2,2,1, 13000000), 
(3,3,1, 12000000), (4,4,1, 11000000), 
(5,5,1, 10000000), (6,6,1, 9000000), 
(7,7,1, 8000000), (8,8,1, 7000000), 
(9,9,1, 6000000), (10,10,1, 5000000),

(11,1,2, 20000000), (12,2,2, 19000000), 
(13,11,2, 18000000), (14,12,2, 17000000), 
(15,16,2, 16000000), (16,17,2, 15000000), 
(17,3,2, 14000000), (18,4,2, 13000000), 
(19,18,2, 12000000), (20,8,2, 11000000),

(21,1,3, 23000000), (22,2,3, 22000000), 
(23,9,3, 21000000), (24,10,3, 20000000), 
(25,13,3, 19000000), (26,14,3, 18000000), 
(27,15,3, 17000000), (28,20,3, 16000000), 
(29,21,3, 15000000), (30,19,3, 14000000),

-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle


-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!