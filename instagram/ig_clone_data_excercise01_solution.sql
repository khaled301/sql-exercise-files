-- # SHOW DATABASES;
-- # USE ig_clone;
-- # SELECT DATABASE();

-- # SELECT * FROM users;
-- # SELECT * FROM photos;
-- # SELECT * FROM comments;
-- # SELECT * FROM follows;
-- # SELECT * FROM likes;
-- # SELECT * FROM tags;
-- # SELECT * FROM photo_tags;




-- #***************************************** CHALLENGE 01 *******************************
-- # We want to reward our users who have been around the longest.
-- #  Find the 5 oldest users.

-- SELECT * FROM users
-- ORDER BY created_at ASC LIMIT 5;


-- #***************************************** CHALLENGE 02 *******************************
-- # Whata day of the week do most user register on
-- # We need to figure out when to schedule an ad campaign

-- SELECT 
--  WEEKDAY(created_at) AS week_day,
--  DAYNAME(created_at) AS day_name ,
--  COUNT(WEEKDAY(created_at)) AS week_day_count
-- FROM users
-- GROUP BY WEEKDAY(created_at), DAYNAME(created_at) 
-- ORDER BY week_day_count DESC LIMIT 5;



-- #***************************************** CHALLENGE 03 *******************************
-- # We want to target inactive users with an email campaign
-- # find the users who have never posted a photo


-- SELECT
--  users.username AS name,
--  photos.image_url AS image_source
--  FROM users
-- LEFT JOIN photos
-- ON users.id = photos.user_id
-- WHERE photos.user_id IS NULL
-- ORDER BY users.id ASC;



-- #***************************************** CHALLENGE 04 *******************************
-- # We're running a new contest to see who can get the mostlikes on a single photo
-- # who own??


-- SELECT
-- users.username AS username,
--  photos.id AS photo_id,
--  photos.image_url AS image,
--  COUNT(*) AS total_likes
-- FROM photos
-- INNER JOIN likes
-- ON photos.id = likes.photo_id
-- INNER JOIN users
-- ON photos.user_id = users.id
-- GROUP BY photo_id
-- ORDER BY total_likes DESC LIMIT 1;


-- #***************************************** CHALLENGE 05 *******************************
-- # Our investors want to know...
-- # How many times does the average user post??
-- # Calculate avg number of photos per user.



-- SELECT username, COUNT(photos.user_id) as posts_number
-- FROM photos
-- INNER JOIN users
-- ON photos.user_id = users.id
-- GROUP BY photos.user_id
-- ORDER BY posts_number DESC;

-- SELECT 
-- (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg_posts;



-- #***************************************** CHALLENGE 06 *******************************
-- # A brand wants to know which hashtags to use in a post
-- # What are the top 5 most commonly used hashtags??


-- SELECT
--  photo_tags.tag_id,
--  tags.tag_name,
--  COUNT(*) AS total_appearances
-- FROM photo_tags
-- INNER JOIN tags
-- ON photo_tags.tag_id = tags.id
-- GROUP BY photo_tags.tag_id
-- ORDER BY total_appearances DESC LIMIT 6;



-- #********************** INTRO TO " H-A-V-I-N-G "  CHALLENGE 07 *******************************
-- # We have a small problem with bots on our site...
-- # Find users who have liked every single photo on the site.


-- ## Unlike WHERE, -> HAVING <- works on GROUP BY data and sit after it.
 
SELECT username, user_id, COUNT(*) AS num_likes
FROM users
INNER JOIN likes
ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);










