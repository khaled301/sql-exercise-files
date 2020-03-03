-- DROP DATABASE trigger_demo;
-- CREATE DATABASE trigger_demo;
-- USE trigger_demo;
-- SELECT DATABASE();

-- DROP TABLE users;
-- CREATE TABLE users(
-- username VARCHAR(100),
-- age INT
-- );

-- DESC users;

-- INSERT INTO users(username, age) VALUES ('Bobby', 23);





-- #*******************************************************************************



-- DROP TRIGGER must_be_adult;

-- DELIMITER $$

-- CREATE TRIGGER must_be_adult
-- BEFORE INSERT ON users FOR EACH ROW 
-- BEGIN
-- 	IF NEW.age < 18
--     THEN
-- 		SIGNAL SQLSTATE '45000'
-- 			SET MESSAGE_TEXT = 'Must be an adult!';
--     END IF;        
-- END;
-- $$ 

-- DELIMITER ;

-- SELECT * FROM users;



-- INSERT INTO users(username, age) VALUES ('Nishat', 16);



-- #***************************************************************************



-- SHOW DATABASES;
-- USE ig_clone;
-- SELECT DATABASE();
-- SHOW TABLES;
-- SELECT * FROM follows;



-- DROP TRIGGER prevent_self_follow;

-- DELIMITER $$

-- CREATE TRIGGER prevent_self_follow
-- BEFORE INSERT ON follows FOR EACH ROW
-- BEGIN
-- 	IF NEW.follower_id = NEW.followee_id
-- 		THEN 
-- 			SIGNAL SQLSTATE '45000'
-- 				SET MESSAGE_TEXT = 'Can not follow yourself!';
--     END IF;
-- END;

-- $$

-- DELIMITER ;

-- SELECT * FROM follows ORDER BY created_at DESC ;
-- INSERT INTO follows(follower_id, followee_id) VALUES (1, 1);
-- INSERT INTO follows(follower_id, followee_id) VALUES (88, 1);
-- INSERT INTO follows(follower_id, followee_id) VALUES (88, 88);






-- #************************************************************



-- SELECT DATABASE();

-- SHOW TABLES;


-- DROP TABLE deleted_follows;

-- CREATE TABLE deleted_follows(
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- follower_id INT NOT NULL,
-- followee_id INT NOT NULL,
-- created_at TIMESTAMP DEFAULT NOW()
-- );

-- DESC deleted_follows;







-- DROP TRIGGER deleted_followsLog;

-- DELIMITER $$ 

-- CREATE TRIGGER deleted_followsLog
-- AFTER DELETE ON follows FOR EACH ROW
-- BEGIN
-- 	INSERT INTO deleted_follows(follower_id, followee_id)
--     VALUES (OLD.follower_id, OLD.followee_id);
-- END;

-- $$

-- DELIMITER ;



-- DELETE FROM follows WHERE follower_id = 88 AND followee_id = 1;
-- DELETE FROM follows WHERE follower_id = 2 AND followee_id = 1;
-- SELECT * FROM follows ORDER BY created_at DESC ;



-- #************************************************



-- DROP TABLE unfollows;

-- CREATE TABLE unfollows(
-- follower_id INT NOT NULL,
-- followee_id INT NOT NULL,
-- created_at TIMESTAMP DEFAULT NOW(),
-- FOREIGN KEY(follower_id) REFERENCES users(id),
-- FOREIGN KEY(followee_id) REFERENCES users(id),
-- PRIMARY KEY(follower_id, followee_id)
-- );

-- DESC unfollows;

-- DROP TRIGGER create_unfollow;

-- DELIMITER $$ 

-- CREATE TRIGGER create_unfollow
-- AFTER DELETE ON follows FOR EACH ROW
-- BEGIN
-- 	INSERT INTO unfollows
--     SET follower_id = OLD.follower_id,
-- 		followee_id = OLD.followee_id;
-- END;

-- $$

-- DELIMITER ;


-- DELETE FROM follows WHERE follower_id = 2 AND followee_id = 3;
-- DELETE FROM follows WHERE follower_id = 2 AND followee_id = 4;
-- DELETE FROM follows WHERE follower_id = 3;
-- SELECT * FROM follows ORDER BY created_at DESC ;

-- SELECT * FROM unfollows;



#*********************************** Managing Triggers *******************************

-- SHOW TRIGGERS;













