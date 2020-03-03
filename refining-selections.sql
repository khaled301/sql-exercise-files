-- # 01 //Basic Start With three new data insertion in books table
-- SHOW DATABASES;

-- USE book_shop;

-- SELECT DATABASE();

-- SHOW TABLES;

-- SELECT * FROM books;

-- INSERT INTO books
--     (title, author_fname, author_lname, released_year, stock_quantity, pages)
--     VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
--            ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
--            ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- SELECT * FROM books;


-- #//*********************** DISTINCT *******************************


-- # 02 //DISTINCT OR UNIQUE Return for all

-- SELECT DISTINCT author_lname FROM books;

-- SELECT DISTINCT released_year FROM books; 

-- SELECT DISTINCT author_fname AS 'firs name', 
-- author_lname AS 'last Name' FROM books;

-- #DISTINCT using CONCAT()
-- SELECT DISTINCT CONCAT_WS(' ', author_fname, author_lname) FROM books;
       


-- #//********************** ORDER BY ********************************


-- # 03// SORTING - ORDER BY
-- SELECT author_lname AS last FROM books ORDER BY author_lname;

-- SELECT title FROM books ORDER BY title;

-- SELECT title FROM books ORDER BY title DESC;

-- SELECT released_year FROM books ORDER BY released_year;

-- SELECT released_year FROM books ORDER BY released_year DESC;

-- SELECT title, released_year, pages FROM books ORDER BY released_year DESC;

-- # ORDER BY SHORT-CUT => SELECT title(1), released_year(2), pages(3)
-- SELECT title, released_year, pages FROM books ORDER BY 2 DESC;

-- # ORDER BY two different Columns | 
-- #After Sort by last name Then Sort by first name
-- SELECT author_fname, author_lname FROM books
--  ORDER BY author_lname, author_fname;



-- #//*********************** LIMIT *******************************



-- # 04// LIMIT - limit the query result

-- SELECT title FROM books LIMIT 3; 

-- SELECT title, released_year AS 'released year'FROM books
-- ORDER BY released_year DESC LIMIT 5;

-- # LIMIT 0,5 => 0 is the starting point and 5 is the limit
-- # for limit starting index is 0!!!
-- SELECT title, released_year AS 'released year'FROM books
-- ORDER BY released_year DESC LIMIT 0,5 ;

-- SELECT title, released_year AS 'released year'FROM books
-- ORDER BY released_year DESC LIMIT 11,1 ;

-- # Select All books from index 11 and onwards 
-- SELECT * FROM books LIMIT 10, 454545454454554;
-- SELECT title FROM books LIMIT 15, 454545454454554;



-- #05//************************ LIKE ******************************



-- # 05// LIKE gives us all the Results that matches the Query

-- # percentage(%) => indicates WILD CARDS = anything 

-- # under-score(_) => indicates WILD CARDS = exact number of characters.
-- # underscore is helpful to query like phone numbers (123)555-6666 see below
-- # ... LIKE '(___)___-____';    

-- SELECT * FROM books WHERE author_fname LIKE '%'; #// return everything
-- SELECT * FROM books WHERE author_fname LIKE '%da%'; #// contains 'da'
-- SELECT * FROM books WHERE author_fname LIKE 'da%'; #//Start With 'da'
-- SELECT * FROM books WHERE author_fname LIKE '%da'; #// End with 'da'
-- SELECT * FROM books WHERE author_fname LIKE 'da'; #// Exact match like 'WHERE' clause

-- #// single digit/char(_) | double chars(__) => two underscroes and so on
-- SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '___'; 

-- #*** if character includes (%) or (_) the we have to use ESCAPE CHARACTER
-- # (%\%%) or (_\__)

-- SELECT title FROM books WHERE title LIKE '%\%%';

-- SELECT title FROM books WHERE title LIKE '%\_%';

-- SELECT title FROM books WHERE title LIKE '__\%%';

-- SELECT title FROM books WHERE title LIKE '____\_%';



-- #06//************************ Exercise-portion ******************************

SELECT * FROM books;

SELECT title AS Titles FROM books
WHERE title LIKE '%stories%';

SELECT title, pages 
FROM books
ORDER BY pages DESC 
LIMIT 1;

SELECT CONCAT_WS(' - ', title, released_year) AS summery
FROM books
ORDER BY released_year DESC
LIMIT 3;
 
SELECT title,author_lname FROM books
WHERE author_lname LIKE '% %';

SELECT title,released_year,stock_quantity FROM books
ORDER BY stock_quantity,title ASC
LIMIT 3;

SELECT title,author_lname FROM books
ORDER BY author_lname,title;

SELECT UPPER(
CONCAT('My favorite author is ', author_fname, ' ', author_lname, '!' )
) AS yell
 FROM books
 ORDER BY author_lname;