-- SHOW ENGINES;
-- SHOW DATABASES;
-- USE eloquent_app;
-- SELECT DATABASE();


-- #*********** Questions *******************
-- # Create table for questions

-- USE eloquent_app;
-- SELECT DATABASE();

-- CREATE TABLE questions (
--  id int(11) unsigned NOT NULL AUTO_INCREMENT,
--  question tinytext,
--  user_id int(11) DEFAULT NULL,
--  created_at timestamp NULL DEFAULT NULL,
--  updated_at timestamp NULL DEFAULT NULL,
--  deleted_at timestamp NULL DEFAULT NULL,
--  PRIMARY KEY (id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DESC questions;



-- #*********** Answers *******************
-- # Create table for Answers

-- CREATE TABLE answers (
--  id int(11) unsigned NOT NULL AUTO_INCREMENT,
--  answer tinytext,
--  user_id int(11) DEFAULT NULL,
--  question_id int(11) DEFAULT NULL,
--  created_at timestamp NULL DEFAULT NULL,
--  updated_at timestamp NULL DEFAULT NULL,
--  deleted_at timestamp NULL DEFAULT NULL,
--  PRIMARY KEY (id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DESC answers;


-- #*********** Upvotes *******************
-- # Create table for Upvotes

-- CREATE TABLE upvotes (
--  id int(11) unsigned NOT NULL AUTO_INCREMENT,
--  answer_id int(11) DEFAULT NULL,
--  user_id int(11) DEFAULT NULL,
--  created_at timestamp NULL DEFAULT NULL,
--  updated_at timestamp NULL DEFAULT NULL,
--  deleted_at timestamp NULL DEFAULT NULL,
--  PRIMARY KEY (id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DESC upvotes;

-- SHOW TABLES;


-- #*********** Users *******************
-- # Create table for Users

-- CREATE TABLE users (
--  id int(11) unsigned NOT NULL AUTO_INCREMENT,
--  username varchar(100) DEFAULT NULL,
--  email varchar(200) DEFAULT NULL,
--  password varchar(200) DEFAULT NULL,
--  created_at timestamp NULL DEFAULT NULL,
--  updated_at timestamp NULL DEFAULT NULL,
--  deleted_at timestamp NULL DEFAULT NULL,
--  PRIMARY KEY (id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DESC users;
-- DESC answers;

-- SHOW TABLES;

-- SELECT * FROM users;
-- SELECT * FROM questions;
-- SELECT * FROM answers;
-- SELECT * FROM upvotes;


