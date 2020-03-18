-- 1. CREATE DATABASE bnb;

-- 2. Create Room table
CREATE TABLE rooms (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60),
	date VARCHAR(60),
	description VARCHAR(240),
	price VARCHAR(60),
  landlord_name VARCHAR(60),
  availability  VARCHAR(60)
 );

-- Insert test values
INSERT INTO rooms (name, date, description, price, landlord_name, availability) VALUES ('Test room', '18/3/20', 'Test description', 100, 'Test landlord', 'Available');

 -- 3. create landlord table
 CREATE TABLE landlord (
 	id SERIAL PRIMARY KEY,
 	landlord_name VARCHAR(60)
  );

--  4. create renter table
CREATE TABLE renter (
	id SERIAL PRIMARY KEY,
	renter_name VARCHAR(60)
 );

--  5. create bookingRequest table
CREATE TABLE bookingRequest (
	id SERIAL PRIMARY KEY,
	renter_name VARCHAR(60),
    room_name VARCHAR(60),
    date VARCHAR(60),
    request_status VARCHAR(60)
 );
