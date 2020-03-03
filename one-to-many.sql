-- #//*************************** ONE TO MANY RELATIONSHIP **************************

-- # We shoul MAINTAIN ORDER the way data will be presented

-- # COllect data from different tables and join them in
-- # in a meaningful way (using meaningful CONDITIONS)

-- #CREATE DATABASE customer_db;
-- SHOW DATABASES;
-- USE customer_db;
-- SELECT DATABASE();

-- #************************* Creating CUSTOMERS and ORDERS tables ***************

-- CREATE TABLE customers (
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- first_name VARCHAR(100) NOT NULL,
-- last_name VARCHAR(100) NOT NULL,
-- email VARCHAR(100) NOT NULL
-- );

-- DESC customers;




-- #Without foreign key reference one can store
-- # any order without associating it with existing customer
-- # which undesirable 
-- CREATE TABLE orders(
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- order_date DATE,
-- amount DECIMAL(8,2) NOT NULL,
-- customer_id INT NOT NULL,
-- FOREIGN KEY(customer_id) REFERENCES customers(id)
-- );

-- DESC orders;




-- INSERT INTO customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
--        
--        
-- SELECT * FROM customers;       








-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016/02/10', 99.99, 1),
--        ('2017/11/11', 35.50, 1),
--        ('2014/12/12', 800.67, 2),
--        ('2015/01/03', 12.50, 2),
--        ('1999/04/11', 450.25, 5);

-- #IF there is no association between customers(id) and
--  #orders(customer_id) then nothing can stop below input
--  #with no existance user with id = 98
 
-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016/06/06', 33.67, 98);



-- # Same data except with existing user and Foreign key reference
-- # to customers(id)

-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016/06/06', 33.67, 5);

-- SELECT * FROM orders;






-- #********************* JOIN ******************


-- SELECT * FROM orders 
-- WHERE 
--    customer_id = (
-- SELECT id FROM customers WHERE last_name = 'George'
-- ); 



-- #*********** CROSS JOIN **************


# take every customer and join them with all orders like multiplication
# its pretty meaningless / first join operation

-- SELECT * FROM customers, orders;




-- #********************* IMPLICIT(where) Inner JOIN **********************

#**** IMPLICIT INNER JOIN | JOIN using 'WHERE' condition is matched only ******
 
-- #Prepend the name of the tables 
-- SELECT * FROM customers, orders
-- WHERE customers.id = orders.customer_id;

-- # more condensed table 
-- SELECT first_name, last_name, order_date, amount 
-- FROM customers, orders
-- WHERE customers.id = orders.customer_id;



-- #************* EXPLICIT(JOIN & ON)  | CONVENTIONAL Inner JOIN *************

-- # ON -> WHERE -> show only matched item
-- # reason for inner join => all the orders and name next to them 



-- SELECT * FROM customers
-- INNER JOIN orders
-- ON customers.id = orders.customer_id;

-- # create Union table from RIGHT customers table and
-- # LEFT orders table using explicit JOIN and ON condition
-- # customers.id will be equal to orders.customer_id

-- SELECT first_name, last_name, order_date, amount
-- FROM customers
-- JOIN orders
-- ON customers.id = orders.customer_id;
 




-- # ************************ LEFT JOIN, IFNULL() ***********************
-- # We Will take EVERYTHING from the LEFT table and join them 
-- # with the right table matching data based on condition
-- # if there is no value on the right table for left table keys
-- # then it will fill up  with null values 


-- SELECT
--  customers.id,
--  first_name,
--  last_name,
--  SUM(amount) AS total_spent 
-- FROM customers
-- JOIN orders
-- ON customers.id = orders.customer_id
-- GROUP BY orders.customer_id
-- ORDER BY total_spent DESC;


-- SELECT first_name, last_name, order_date, amount
-- FROM customers
-- LEFT JOIN orders
-- ON customers.id = orders.customer_id;

-- SELECT
--  first_name,
--  last_name,
--  SUM(amount) AS total_spent
-- FROM customers
-- LEFT JOIN orders
-- ON customers.id = orders.customer_id
-- GROUP BY customers.id
-- ORDER BY total_spent;


-- #IFNULL(checkCondition, replaceValue)
-- SELECT
--  first_name,
--  last_name,
--  IFNULL(SUM(amount), 0) AS total_spent
-- FROM customers
-- LEFT JOIN orders
-- ON customers.id = orders.customer_id
-- GROUP BY customers.id
-- ORDER BY total_spent;







-- # ************************ RIGHT JOIN ***********************
-- # Select EVERYTHING from RIGHT table along with Matched data and 
-- # JOIN them with left table.


-- SELECT first_name, last_name, order_date, amount
-- FROM customers
-- INNER JOIN orders
-- ON customers.id = orders.customer_id;

-- SELECT first_name, last_name, order_date, amount
-- FROM customers
-- RIGHT JOIN orders
-- ON customers.id = orders.customer_id;



-- # ********* MESSING with data to Illustrate RIGHT JOIN ************

-- CREATE TABLE test_customers (
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- first_name VARCHAR(100) NOT NULL,
-- last_name VARCHAR(100) NOT NULL,
-- email VARCHAR(100) NOT NULL
-- );

-- DESC test_customers;


-- #Without foreign key reference one can store
-- # any order without associating it with existing customer
-- # which undesirable 
-- CREATE TABLE test_orders(
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- order_date DATE,
-- amount DECIMAL(8,2) NOT NULL,
-- customer_id INT NOT NULL
-- );

-- DESC test_orders;

-- SHOW TABLES;

-- INSERT INTO test_customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
       
-- SELECT * FROM test_customers;       



-- INSERT INTO test_orders (order_date, amount, customer_id)
-- VALUES ('2016/02/10', 99.99, 1),
--        ('2017/11/11', 35.50, 1),
--        ('2014/12/12', 800.67, 2),
--        ('2015/01/03', 12.50, 2),
--        ('1999/04/11', 450.25, 5);

-- SELECT * FROM test_orders; 

-- INSERT INTO test_orders(order_date, amount, customer_id)
-- VALUES ('2019/05/21', 555.5, 77), (CURDATE(), 855.5, 88);

-- SELECT * FROM test_orders;

-- SELECT
--  IFNULL(test_customers.id, 'UNKNOWN') AS customer_id,
--  IFNULL(first_name, 'MISSING') AS first_name,
--  IFNULL(last_name, 'USER') AS last_name,
--  test_orders.customer_id,
--  order_date,
--  SUM(amount) As total_spent
-- FROM test_customers
-- RIGHT JOIN test_orders
-- ON test_customers.id = test_orders.customer_id
-- GROUP BY customer_id
-- ORDER BY first_name DESC;

-- SELECT
--  IFNULL(test_customers.id, 'UNKNOWN') AS customer_id,
--  IFNULL(first_name, 'MISSING') AS first_name,
--  IFNULL(last_name, 'USER') AS last_name,
--  test_orders.customer_id,
--  order_date,
--  SUM(amount) As total_spent
-- FROM test_customers
-- RIGHT JOIN test_orders
-- ON test_customers.id = test_orders.customer_id
-- GROUP BY first_name, last_name
-- ORDER BY first_name DESC;






-- #*************** ON DELETE CASCADE *********************
-- # If there is FOREIGN key references then when PARENT gets DELETED
-- # its associate CHILDREN also need to be DELETED


-- CREATE TABLE test02_customers (
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- first_name VARCHAR(100) NOT NULL,
-- last_name VARCHAR(100) NOT NULL,
-- email VARCHAR(100) NOT NULL
-- );

-- DESC test02_customers;


-- -- # ON DELETE CASCADE => if a customer has corresponding orders
-- -- # when we delete that customer its corresponding orders will be deleted
-- -- # deleted as well

-- CREATE TABLE test02_orders(
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- order_date DATE,
-- amount DECIMAL(8,2) NOT NULL,
-- customer_id INT NOT NULL,
-- FOREIGN KEY(customer_id)
--  REFERENCES test02_customers(id)
--  ON DELETE CASCADE
-- );

-- DESC test02_orders;




-- INSERT INTO test02_customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
--               
-- SELECT * FROM test02_customers;       



-- INSERT INTO test02_orders (order_date, amount, customer_id)
-- VALUES ('2016/02/10', 99.99, 1),
--        ('2017/11/11', 35.50, 1),
--        ('2014/12/12', 800.67, 2),
--        ('2015/01/03', 12.50, 2),
--        ('1999/04/11', 450.25, 5);

-- SELECT * FROM test02_orders;   


-- SHOW TABLES;

-- DELETE FROM test02_customers WHERE first_name = 'Boy';

-- SELECT * FROM test02_customers;
-- SELECT * FROM test02_orders;  







-- #**************************** EXERCISE ****************************



-- CREATE TABLE students(
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- first_name VARCHAR(100)
-- );

-- DESC students;


-- CREATE TABLE papers(
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- title VARCHAR(100) NOT NULL,
-- grade INT NOT NULL DEFAULT 0,
-- student_id INT NOT NULL,
-- FOREIGN KEY(student_id)
--  REFERENCES students(id)
--  ON DELETE CASCADE
-- );

-- DESC papers;


-- INSERT INTO students (first_name) VALUES 
-- ('Caleb'), 
-- ('Samantha'), 
-- ('Raj'), 
-- ('Carlos'), 
-- ('Lisa');

-- INSERT INTO papers (student_id, title, grade ) VALUES
-- (1, 'My First Book Report', 60),
-- (1, 'My Second Book Report', 75),
-- (2, 'Russian Lit Through The Ages', 94),
-- (2, 'De Montaigne and The Art of The Essay', 98),
-- (4, 'Borges and Magical Realism', 89);


-- SELECT * FROM students;
-- SELECT * FROM papers;


SELECT first_name, title, grade
FROM students
INNER JOIN papers
ON students.id = papers.student_id
ORDER BY grade DESC;


SELECT first_name, title, grade
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;


SELECT
 first_name,
 IFNULL(title, 'No Record Found') AS Title,
 IFNULL(grade, 0) AS Grade
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;


SELECT
 first_name,
 IFNULL(AVG(grade), 0) AS average,
 CASE
 WHEN AVG(grade) >= 75 THEN 'PASSING'
 ELSE 'FAILING'
 END AS passing_status
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;















