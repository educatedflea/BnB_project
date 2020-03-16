CREATE TABLE rooms (id SERIAL PRIMARY KEY,
	name VARCHAR(60),
	date VARCHAR(60),
	description VARCHAR(240),
	price VARCHAR(60)
 );

--  to pass the first test, in psql:

-- 1. create test db 
-- CREATE DATABASE bnb_test;

-- 2. create table 
-- command see above

-- 3. insert value 
-- INSERT INTO rooms (description) values ('This is a test room');