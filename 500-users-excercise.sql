-- SHOW ENGINES;
-- SHOW DATABASES;
-- USE join_us;
-- SELECT DATABASE();


-- #*********** Excercise 01 *******************

-- # Find Ealiest Date A User Joined
SELECT DATE_FORMAT(created_at, '%M %D %Y') AS earliest_date
FROM users
ORDER BY created_at ASC LIMIT 1;


-- #*********** Excercise 02 *******************

-- # Find Email of the Ealiest user 
SELECT email, created_at
FROM users
ORDER BY created_at ASC LIMIT 1;
-- # Usin sub-query
SELECT email, created_at FROM users
WHERE created_at = (SELECT MIN(created_at) FROM users);




-- #*********** Excercise 03 *******************

-- # Find users number according to the month they joined
SELECT
 DATE_FORMAT(created_at, '%M') AS month,
 COUNT(*) AS count
 FROM users
 GROUP BY month
 ORDER BY count DESC;
 
 
 
 -- #*********** Excercise 04 *******************

-- # Find users number with yahoo email

SELECT COUNT(email) AS yahoo_users
FROM users
WHERE email LIKE '%@yahoo%';



 -- #*********** Excercise 05 *******************

-- # Calculate Total number of users for each email host

SELECT
CASE
WHEN email LIKE '%@gmail%' THEN 'gmail'
WHEN email LIKE '%@yahoo%' THEN 'yahoo'
WHEN email LIKE '%@hotmail%' THEN 'hotmail'
ELSE 'other'
END AS provider,
COUNT(email) AS total_users
FROM users
GROUP BY provider;


-- SELECT * FROM users;


