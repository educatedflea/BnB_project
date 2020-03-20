-- 1. CREATE DATABASE bnb;

-- 2. Create Room table
CREATE TABLE rooms (
	id SERIAL PRIMARY KEY,
	room_name VARCHAR(60),
	date VARCHAR(60),
	description VARCHAR(240),
	price VARCHAR(60),
  landlord_name VARCHAR(60),
  availability  VARCHAR(60)
 );

-- Insert demo values
INSERT INTO rooms (room_name, date, description, price, landlord_name, availability) VALUES ('Seaview', '18/3/20', 'Room with view of the sea', 100, 'Olivia', 'Available');

 -- 3. create landlord table
 CREATE TABLE landlord (
 	id SERIAL PRIMARY KEY,
 	landlord_name VARCHAR(60)
  );

  -- Insert demo values
INSERT INTO landlord (landlord_name) VALUES ('Olivia');

--  4. create renter table
CREATE TABLE renter (
	id SERIAL PRIMARY KEY,
	renter_name VARCHAR(60)
 );

  -- Insert demo values
INSERT INTO renter (renter_name) VALUES ('Chloe');

--  5. create bookingRequest table
CREATE TABLE bookingRequest (
	id SERIAL PRIMARY KEY,
	renter_name VARCHAR(60),
    room_name VARCHAR(60),
    date VARCHAR(60),
    request_status VARCHAR(60)
 );

-- Insert demo values
INSERT INTO bookingRequest (renter_name, room_name, date, request_status) VALUES ('Chloe', 'Seaview', '18/3/20', 'Pending');

ALTER TABLE rooms CHANGE name room_name VARCHAR(60);

EXEC sp_RENAME 'rooms.name' , 'room_name', 'COLUMN';

-- 6. adding request_message to bookingrequest table
ALTER TABLE bookingrequest ADD request_message VARCHAR(240);
