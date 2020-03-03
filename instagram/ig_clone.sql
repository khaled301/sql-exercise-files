-- SHOW DATABASES;
-- #DROP DATABASE ig_clone
-- CREATE DATABASE ig_clone;
-- USE ig_clone;
-- SELECT DATABASE();
-- SHOW TABLES;

-- CREATE TABLE users(
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- username VARCHAR(255) UNIQUE NOT NULL,
-- created_at TIMESTAMP DEFAULT NOW()
-- );

-- DESC users;

-- INSERT INTO users(username) VALUES
-- ('BlueTheCat'), ('CharlieBrown'), ('ColtSteele');

-- SELECT * FROM users;








-- CREATE TABLE photos (
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- image_url VARCHAR(255) NOT NULL,
-- user_id INT NOT NULL,
-- created_at TIMESTAMP DEFAULT NOW(),
-- FOREIGN KEY(user_id) REFERENCES users(id)
-- ON DELETE CASCADE
-- );

-- DESC photos; 

-- INSERT INTO photos(image_url, user_id) VALUES
-- ('/aaffafafad', 1),
-- ('/badadasdsa', 2),
-- ('/cfsafsfdfd', 2);

-- SELECT * FROM photos;







-- CREATE TABLE comments(
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- comment_text VARCHAR(255) NOT NULL,
-- user_id INT NOT NULL,
-- photo_id INT NOT NULL,
-- created_at TIMESTAMP DEFAULT NOW(),
-- FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
-- FOREIGN KEY(photo_id) REFERENCES photos(id) ON DELETE CASCADE
-- );

-- DESC comments;

-- INSERT INTO comments(comment_text, user_id, photo_id) VALUES
-- ('Meow!', 1, 2), 
-- ('Amazing shot', 3, 2),
-- ('I <3 this', 2, 1);

-- SELECT * FROM comments;






-- # ***** PRIMARY KEY(user_id, photo_id) ******
-- #  prevents users from giving likes more than once

-- CREATE TABLE likes(
-- user_id INT NOT NULL,
-- photo_id INT NOT NULL,
-- created_at TIMESTAMP DEFAULT NOW(),
-- FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
-- FOREIGN KEY(photo_id) REFERENCES photos(id) ON DELETE CASCADE,
--  PRIMARY KEY(user_id, photo_id)
-- );

-- DESC likes;

-- INSERT INTO likes(user_id, photo_id) VALUES
-- (1, 1), (2, 1), (1, 2), (1, 3), (3, 3);

-- INSERT INTO likes(user_id, photo_id) VALUES (1, 1);

-- SELECT * FROM likes;








-- CREATE TABLE follows(
-- follower_id INT NOT NULL,
-- followee_id INT NOT NULL,
-- created_At TIMESTAMP DEFAULT NOW(),
-- FOREIGN KEY(follower_id) REFERENCES users(id) ON DELETE CASCADE,
-- FOREIGN KEY(followee_id) REFERENCES users(id) ON DELETE CASCADE,
-- PRIMARY KEY(follower_id, followee_id)
-- );

-- DESC follows;

--  
-- INSERT INTO follows(follower_id, followee_id) VALUES
-- (1, 2), (1, 3), (3, 1), (2, 3);

-- INSERT INTO follows(follower_id, followee_id) VALUES
-- (1, 2);

-- SELECT * FROM follows;





 -- CREATE TABLE tags(
--  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
--  tag_name VARCHAR(255) UNIQUE NOT NULL,
--  created_at TIMESTAMP DEFAULT NOW()
--  );
--  
--  DESC tags;







-- CREATE TABLE photo_tags(
-- photo_id INTEGER NOT NULL,
-- tag_id INTEGER NOT NULL,
-- FOREIGN KEY(photo_id) REFERENCES photos(id) ON DELETE CASCADE,
-- FOREIGN KEY(tag_id) REFERENCES tags(id) ON DELETE CASCADE,
-- PRIMARY KEY(photo_id, tag_id)
--  );
--  
--  DESC photo_tags;

--  INSERT INTO tags(tag_name) VALUES
--  ('adorable'), ('cute'), ('sunrise');
 
--  SELECT * FROM tags;


--  INSERT INTO photo_tags(photo_id, tag_id) VALUES
--  (1,1), (1,2), (2,3), (3,2);


--  INSERT INTO photo_tags(photo_id, tag_id) VALUES
--  (1,1);

--  SELECT * FROM photo_tags;





-- SELECT image_url, photos.created_at, username
-- FROM photos
-- LEFT JOIN users
-- ON photos.user_id = users.id
-- ORDER BY photos.created_at DESC;

-- # ****************************************************************************************









