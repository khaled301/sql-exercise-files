-- #************************ DATA TYPES ********************
 
 -- #01//****** VARCHAR & CHAR ***********************
 
--  #  CHAR(0-255) =>  Has fixed length. if input is
--  # is lower than the defined length, spaces will be added after 
--  #them to make the length as defined. On contray if input 
--  # is greater the length defined then it will be truncated.
--  # CHAR is faster. examples: state-name, sex(M/F) 
--  # USE CHAR if input is guaranteed fix length 

--  # VARCHAR(0-255) =>  VARIABLE LENGTH. it can very from 0 - 255
--  # and it will be truncated only if it exeeds the defined length


 -- # 02//****** NUMBERS ***********************
 
 
 -- #If we need precision for decimal input(price/bank) MUST USE DECIMAL - DATA TYPE
 
--  # INT(?length) => WHOLE numbers
--  
--  # DECIMAL => FIXED point type and CALC(precision) are EXACT.
--  # DECIMATL(x, y) => x = total_allowed_num_of_digits_beforeDec_plus_afterDec,
--  #  y = num_dig_after_dec_point 

--  # DECIMAL(5, 2 ) => input(557.44444) = dec(557.44) with truncated 
--  # input(99999) = not allowed, input(9999) = not allowed 
--  # input(776.99999) => will convert to (777.00);


-- CREATE DATABASE item_db;
-- SHOW DATABASES;
-- USE item_db;
-- SELECT DATABASE();
-- CREATE TABLE items(price DECIMAL(5,2));
-- DESC items;
-- SHOW COLUMNS from items;

-- INSERT INTO items(price) VALUES (7);
-- INSERT INTO items(price) VALUES (777);
-- INSERT INTO items(price) VALUES (888.99);
-- INSERT INTO items(price) VALUES (776.99999);
-- INSERT INTO items(price) VALUES (557.44444);
-- SHOW WARNINGS;
-- SELECT * FROM items;


-- # FLOAT & DOUBLE => FLOATING point and CALC are Approximate.
-- # Store Larger number using Less space But precision is Approximate
-- # FLOAT => 7 digits(precision issues after - 7dig) - 4byts
-- # DOUBLE => 15 digits(precision issues after -15dig) - 8 bytes





 -- # 03//****** DATE & TIMES ***********************
 
 #DATE = VLAUE WITH DATE WIHOUT TIME => yyyy-mm-dd
 
 # TIME = values with TIME but no DATE => hh:mm:ss
 
 # DATETIME = values with DATE and TIME => yyyy-mm-dd hh:mm:ss 
 # DATEIME Range = '1000-01-01' to '9999-01-01' 
 
 # CURDATE() =  CURRENT DATE
 # CURTIME() =  CURRENT TIME
 # NOW() = CURRENT DATE & TIME
--  SELECT DATABASE();

-- CREATE TABLE people(
-- name VARCHAR(100),
-- birthdate DATE,
-- birthtime TIME,
-- birthdt DATETIME
-- );
 
--  DESC people;
 
--  INSERT INTO people(name, birthdate, birthtime, birthdt)
--  VALUES ('Padma', '1983-11-11', '02:04:06', '1983-11-11 02:04:06'),
--  ('Jacob', '1981-11-09', '05:07:09', '1981-11-05:07:09');
 
-- INSERT INTO people(name, birthdate, birthtime, birthdt)
-- VALUES ('Khaled', CURDATE(), CURTIME(), NOW());
--  
--  INSERT INTO people(name, birthdate, birthtime, birthdt)
-- VALUES ( CURRENT_USER(), CURRENT_DATE(), CURRENT_TIME(), CURRENT_TIMESTAMP());
 
 
 -- #//********************** DATE MATH **********************
 
--   SELECT DATEDIFF(NOW(),'1999-04-04');
 
--  SELECT DATEDIFF(NOW(), birthdate) FROM people; #//Difference in days

-- SELECT name, birthdate, DATEDIFF(NOW(), birthdate) AS 'days passed'
-- FROM people;

-- SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
-- SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
-- SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people; 

-- SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people; 
-- SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people; 

-- #CHAIN ADD/SUB DATE 
-- SELECT birthdt, birthdt + INTERVAL 1 YEAR + INTERVAL 1 MONTH
-- + INTERVAL 1 HOUR
-- FROM people; 

--  SELECT * FROM people;

 
 
  -- # 04//****** TIMESTAMPS is a DATA TYPE IN MySQL ***********************
 # Generic term -> storing information meta data at when something
 # got created or updated at
 # TIMESTAMP Range = '1970-01-01 00:00:01' to '2038-01-19 03:14:07'
 # TIMESTAMP take LESS SPACE compare to DATETIME (4B vs 8B)
 # RANGE is limited for TimeStamp
 
--  CREATE TABLE comments(
--  content VARCHAR(100),
--  created_at TIMESTAMP DEFAULT NOW()
--  ); 
--  DESC comments;

-- INSERT INTO comments(content) 
-- VALUES ('LOL what a funny article'),
-- ('I find this offensive');

-- INSERT INTO comments(content) 
-- VALUES ('What\'s wrong with you!!!');

-- SELECT * FROM comments ORDER BY created_at DESC;

-- CREATE TABLE comment2(
-- content VARCHAR(100),
-- changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
-- );

-- INSERT INTO comment2(content) 
-- VALUES ('What\'s wrong with you!!!');

-- RENAME TABLE comment2 to comments2;
-- SHOW TABLES;

-- INSERT INTO comments2(content) 
-- VALUES ('Nice!');

-- DROP TABLE comments2;



-- #// ********* On update row data We can use ON CHANGE ******** 



-- CREATE TABLE comments2(
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- content VARCHAR(100),
-- changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
-- );
-- SHOW TABLES;

-- INSERT INTO comments2(content) 
-- VALUES ('Nice!');

-- INSERT INTO comments2(content) 
-- VALUES ('Super');

-- UPDATE comments2 SET content='Nice!' WHERE content = 'Nice Article'; 

-- #FOR MySQL safe mode we have to update it using ID
-- UPDATE comments2 SET content = 'Nice Article'
-- WHERE id = 1;

-- SELECT * FROM comments2;




-- #//********************* EXCERCISE *******************

SELECT CURRENT_DATE();
SELECT DAY(CURRENT_DATE());
SELECT DAYNAME(CURRENT_DATE());
SELECT DATE_FORMAT(CURRENT_DATE(), '%m/%d/%Y');
SELECT DATE_FORMAT('2019-10-04 22:23:00', '%M %D at %h:%i');

-- CREATE TABLE tweets(
-- tweet_content CHAR(144) NOT NULL,
-- user_name VARCHAR(100),
-- created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
-- );

DESC tweets;