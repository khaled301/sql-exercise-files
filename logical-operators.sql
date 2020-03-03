-- #***************** LOGICAL OPERATORS ****************************
-- SHOW DATABASES;
-- USE book_shop;
-- SELECT DATABASE();


-- #**************** NOT EQUALS ****************
--  SELECT title, released_year FROM books WHERE released_year != 2016 ORDER BY released_year DESC;


-- #**************** NOT LIKE ****************
-- # LIKE usually allows us to Match PATTERNS
-- # NOT LIKE => Opposite of LIKE


-- SELECT title FROM books WHERE title LIKE 'w%';

-- SELECT title FROM books WHERE title NOT LIKE 'w%';



-- #**************** (>), (<), (>=), (<=), AND, OR, BOOLEAN(0, 1) ****************


-- SELECT title, released_year FROM books
-- WHERE released_year > 2000
--  ORDER BY released_year DESC;

-- SELECT title, released_year FROM books
-- WHERE released_year > 2000
-- AND released_year < 2011
--  ORDER BY released_year DESC;

-- SELECT title, released_year FROM books
-- WHERE released_year >= 2000
-- AND released_year <= 2012
--  ORDER BY released_year DESC;

-- SELECT * FROM books;
-- SELECT title, author_lname, released_year FROM books
-- WHERE author_lname = 'Eggers' AND released_year < 2013
-- ORDER BY released_year DESC;

-- SELECT * FROM books;
-- SELECT title, author_lname, released_year FROM books
-- WHERE author_lname = 'Eggers' AND released_year > 2001
-- ORDER BY released_year DESC;

-- SELECT 1 < 5 && 7 = 9;
-- SELECT 1 < 5 && 7 < 9;

-- SELECT 'a' < 'b' && 'c' = 'd';
-- SELECT 'a' > 'b' && 'c' = 'C';
-- SELECT 'a' < 'b' && 'c' = 'C';
-- SELECT 'a' <= 'b' && 'c' <= 'C';

-- SELECT * FROM books;

-- SELECT * FROM books
-- WHERE released_year >= 2000
-- AND title LIKE '%the%' 
-- AND author_lname = 'Eggers';


-- SELECT title, released_year FROM books
-- WHERE released_year < 2000
-- OR released_year > 2012
--  ORDER BY released_year DESC;

-- SELECT title, author_lname, released_year FROM books
-- WHERE author_lname = 'Eggers'
-- || author_lname = 'Lahiri'
-- AND released_year > 2002
-- OR author_lname = 'Harris'
-- ORDER BY released_year DESC;

-- SELECT 'a' = 'b' || 'a' > 'b';
-- SELECT 'a' = 'b' || 'a' < 'b';



-- #********************** Boolean **************

-- SELECT 99 < 1; #//false => 0
-- SELECT 99 > 1; #//true => 1;

-- SELECT 'a' < 'b'; #// TRUE!!! because 'b' comes after 'a';
-- SELECT 'a' > 'b'; #// FALSE!!! because 'a' comes before 'b';

-- SELECT 'a' > 'A'; #//CASE insensitive
-- SELECT 'a' < 'A';
-- SELECT 'a' = 'A';




-- #********************** BETWEEN, IN and NOT IN **************


#Excludes 2001 and 2013
-- SELECT title, released_year FROM books WHERE released_year > 2001 AND released_year < 2013;

#Includes 2001 and 2013
-- SELECT title, released_year FROM books WHERE released_year BETWEEN 2001 AND 2013; 
-- SELECT title, released_year FROM books WHERE released_year >= 2001 AND released_year <= 2013;

-- SELECT title , released_year FROM books WHERE released_year NOT BETWEEN 2001 AND 2013;

-- SHOW DATABASES;

-- USE item_db;

-- SELECT DATABASE();

-- SHOW TABLES;

-- SELECT * FROM people;

-- #comparing two strings even though they are not DATETIME = birthdt bcz MySQL is smart enoough
-- SELECT name, birthdt FROM people 
-- WHERE birthdt BETWEEN '1982-01-01' AND '1984-01-01';

#RECOMENDED WAY
-- SELECT name, birthdt FROM people 
-- WHERE birthdt BETWEEN CAST('1981-01-01' AS DATETIME) 
-- AND CAST('1984-01-01' AS DATETIME);


-- #******* IN and NOT IN *******
-- # Allows us to provide set of values and then check a given column is in that set or not.

-- SHOW DATABASES;

-- USE book_shop;

-- SELECT DATABASE();

-- SELECT title, author_lname FROM books
-- WHERE author_lname = 'Lahiri' OR
-- author_lname = 'Carver' OR
-- author_lname = 'Smith';

-- -- #IN makes OR logic much simpler 
-- SELECT title, author_lname FROM books
-- WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

--   SELECT title, released_year FROM books 
--   WHERE released_year IN(1985, 2017);

-- #using only AND operator
-- SELECT title, author_lname FROM books
-- WHERE author_lname != 'Lahiri' AND
-- author_lname != 'Carver' AND
-- author_lname != 'Smith';

-- #Much simpler syntax using NOT IN operator
-- SELECT title, author_lname FROM books
-- WHERE author_lname NOT IN('Lahiri', 'Carver', 'Smith');

-- SELECT title, released_year FROM books
-- WHERE released_year >= 2000 AND 
-- released_year NOT IN (2000, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 2018)
-- ORDER BY released_year DESC;

#Much Simpler with MOD(%)
-- SELECT title, released_year FROM books
-- WHERE released_year >= 2000 AND 
-- released_year % 2 != 0
-- ORDER BY released_year DESC;




-- #****************** CASE STATEMENT *****************
-- #CONDITIONAL LOGIC

-- SELECT title, released_year,
-- CASE 
-- WHEN released_year >= 2000 AND released_year <= 2009 THEN 'Modern Lit'
-- WHEN released_year BETWEEN 2010 and 2019 THEN 'Ultra Modern Lit'
-- ELSE '20th Century Lit'
-- END AS GENRE
-- FROM books;

-- SELECT title, released_year,
-- CASE 
-- WHEN released_year >= 2010 THEN 'Super Lit'
-- ELSE 'So So'
-- END AS GENRE
-- FROM books;

-- SELECT title, stock_quantity,
-- CASE 
-- WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
-- WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
-- ELSE '***'
-- END AS STARS
-- FROM books;

-- SELECT title,
-- CASE 
-- WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
-- WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
-- ELSE '***'
-- END AS 'STARS based on STOCK'
-- FROM books;

#As the case statement logic go in order so, 
-- SELECT title, stock_quantity,
-- CASE 
-- WHEN stock_quantity <= 50 THEN '*'
-- WHEN stock_quantity <= 100 THEN '**'
-- ELSE '***'
-- END AS 'STARS based on STOCK'
-- FROM books;


-- #*********************** EXCERCISE ********************


SELECT 10 != 10;

SELECT 15 > 14 && 99-5 <= 94;

-- SELECT 1 NOT IN (5,3);
-- SELECT 9 BETWEEN 8 AND 10;

SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;


SELECT title, released_year FROM books
WHERE released_year < 1980
ORDER BY released_year DESC;

SELECT title, author_lname FROM books
WHERE author_lname IN('Eggers', 'Chabon');

SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Lahiri' AND
released_year > 2000;

SELECT title, pages FROM books
WHERE pages BETWEEN 100 AND 200;


-- SELECT title, author_lname FROM books
-- WHERE SUBSTRING(author_lname,1,1) = 'C' OR
-- SUBSTRING(author_lname,1,1) = 'S';

-- SELECT title, author_lname FROM books
-- WHERE author_lname LIKE 'C%' OR
-- author_lname LIKE 'S%';

SELECT title, author_lname FROM books
WHERE SUBSTRING(author_lname,1,1) IN('S', 'C');


SELECT title, author_lname,
CASE
WHEN title LIKE '%stories%' THEN 'Short Stories'
WHEN title LIKE '%Just Kids%' THEN 'Memoir'
WHEN title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
ELSE 'Novel'
END AS TYPE
FROM books;


SELECT author_fname, author_lname,COUNT(*)
FROM books
GROUP BY author_fname, author_lname
ORDER BY author_lname ASC;


SELECT author_fname, author_lname,
CASE
WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), ' ', 'books' )
ELSE CONCAT(COUNT(*), ' ', 'book' )
END AS COUNT
FROM books
GROUP BY author_fname, author_lname
ORDER BY author_lname ASC;
