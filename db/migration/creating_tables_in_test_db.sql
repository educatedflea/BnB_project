-- Since we have the room table created
-- Which need to be added columns for landlord and status
-- Then we need to create table for landlord,renter,bookingrequest

-- 1. drop table rooms to put in new table with consistent column names
DROP TABLE rooms;

-- Create a new table with amended column name
CREATE TABLE rooms (
	id SERIAL PRIMARY KEY,
	room_name VARCHAR(60),
	date VARCHAR(60),
	description VARCHAR(240),
	price VARCHAR(60),
  landlord_name VARCHAR(60),
  availability  VARCHAR(60)
 );

-- 2. create landlord table
CREATE TABLE landlord (
	id SERIAL PRIMARY KEY,
	landlord_name VARCHAR(60)
 );

--  3. create renter table
CREATE TABLE renter (
	id SERIAL PRIMARY KEY,
	renter_name VARCHAR(60)
 );

--  4. create bookingRequest table
CREATE TABLE bookingRequest (
	id SERIAL PRIMARY KEY,
	renter_name VARCHAR(60),
    room_name VARCHAR(60),
    date VARCHAR(60),
    request_status VARCHAR(60)
 );
