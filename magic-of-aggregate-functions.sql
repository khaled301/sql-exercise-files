-- #***************Aggregate or summerize or combine data****************
-- SHOW DATABASES;
-- USE book_shop;
-- SELECT DATABASE();


-- #******************** 01 COUNT **********************
-- # 01//COUNT

-- SELECT COUNT(*) FROM books;

-- SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
-- SELECT COUNT(title) FROM books WHERE author_fname LIKE '%da%';
-- SELECT COUNT(title) FROM books WHERE title LIKE '%the%';

-- SELECT author_fname FROM books;
-- SELECT COUNT(DISTINCT author_fname) FROM books; #//number of Unique author first names 

-- #//number of Unique authors 
-- SELECT COUNT(DISTINCT author_fname, author_lname) AS 'full name count' FROM books;




-- #******************** 02 GROUP BY **********************
-- # 02//GROUP BY summerizes or aggregates identical data into Single rows



#Show us the number of books each author has written
-- SELECT author_fname, author_lname, COUNT(*) FROM books 
-- GROUP BY author_fname, author_lname;

-- SELECT title, author_fname, author_lname, COUNT(*) FROM books 
-- GROUP BY title, author_fname, author_lname;

-- SELECT released_year, COUNT(*) FROM books
--  GROUP BY released_year
--  ORDER BY released_year DESC;

-- SELECT CONCAT('In ', released_year, ' - ',COUNT(*), ' book(s) released.') AS year 
-- FROM books
--  GROUP BY released_year
--  ORDER BY released_year DESC;




-- #******************** 03 MIN and MAX **********************
-- # 03//Find Minimum or Maximum value in a TABLE | Its a group function


-- SELECT MIN(released_year) FROM books;
-- SELECT MAX(released_year) FROM books;

-- SELECT MIN(pages) FROM books;
-- SELECT MAX(pages) FROM books;


-- #**************** SUB QUERY ***************
-- # 03.1//SUB Query one Query inside of another Query

-- #find out the title of a book that has max page
-- SELECT title, pages FROM books
--  WHERE pages = (SELECT MAX(pages) FROM books);

-- SELECT * FROM books WHERE pages = (SELECT MAX(pages) FROM books);
-- SELECT * FROM books ORDER BY pages DESC LIMIT 1;

-- #find the first published book year amonst all authors 
-- SELECT author_fname, released_year 
-- FROM books 
-- WHERE released_year = (SELECT MIN(released_year) FROM books)
-- GROUP BY author_fname, released_year;

-- #Find first published book years for each author 
-- SELECT author_fname, author_lname, MIN(released_year) 
-- FROM books
-- GROUP BY author_fname, author_lname;

-- SELECT author_fname, author_lname, MAX(released_year) 
-- FROM books
-- GROUP BY author_fname, author_lname;

-- #Find the longest page count of book for each author  
-- SELECT author_fname, author_lname, MAX(pages) 
-- FROM books
-- GROUP BY author_fname, author_lname;

-- #Using ALias to make table cleaner
-- SELECT CONCAT(author_fname,' ', author_lname) AS 'full name',
-- MAX(pages) As 'longest book'
-- FROM books
-- GROUP BY author_fname, author_lname;



-- #******************** 04 SUM and AVG **********************
-- # 04//SUM = Adds things together
-- # 04//AVG = Average data

-- SELECT SUM(pages) FROM books;

-- SELECT CONCAT(author_fname, ' ' ,author_lname) AS 'full name',
-- SUM(pages) AS 'total pages'
-- FROM books
-- GROUP BY author_fname, author_lname
-- ORDER BY author_fname, author_lname;

-- SELECT CONCAT(author_fname, ' ' ,author_lname) AS 'full name',
-- SUM(pages) AS 'total pages'
-- FROM books
-- GROUP BY author_fname, author_lname
-- ORDER BY SUM(pages) DESC;

-- #****************** AVG ********************

-- SELECT AVG(released_year) FROM books;

-- SELECT released_year, AVG(stock_quantity)
--  FROM books
--  GROUP BY released_year;

-- SELECT author_fname,author_lname, AVG(pages)
--  FROM books
--  GROUP BY author_fname,author_lname;



-- #****************** EXCERCISE ********************

SELECT * FROM books;

SELECT COUNT(title) AS 'Disticnt Number of books' FROM books;

SELECT SUM(stock_quantity) AS 'TOTAL Number of books in Stock' FROM books;

SELECT released_year, COUNT(*) AS 'Number of books per year' FROM books
GROUP BY released_year;

SELECT author_fname, author_lname, AVG(released_year) FROM books
GROUP BY author_fname, author_lname;

-- SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name',
--  MAX(pages) AS 'longest book\'s pages' FROM books
--  WHERE pages = (SELECT MAX(pages) FROM books)
-- GROUP BY author_fname, author_lname;

-- SELECT CONCAT(author_fname,' ', author_lname) AS 'full name',
-- MAX(pages) As 'longest book'
-- FROM books
-- GROUP BY author_fname, author_lname
-- ORDER BY MAX(pages) DESC LIMIT 1;

SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name',
pages AS 'longest book\'s pages'
FROM books
ORDER BY pages DESC LIMIT 1;


SELECT released_year AS year, COUNT(*) AS books, AVG(pages) AS 'avg pages'
 FROM books
 GROUP BY released_year
 ORDER BY released_year ASC;
