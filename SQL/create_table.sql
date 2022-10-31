DROP DATABASE airbnb;

CREATE DATABASE airbnb;
ALTER DATABASE airbnb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE Airbnb;

CREATE TABLE `customer` (
  `cid` int PRIMARY KEY,
  `name` nvarchar(200)
);

-- CREATE TABLE `neighborhood` (
--   `name` varchar(200) PRIMARY KEY,
--   `overview` varchar(2000)
-- );

CREATE TABLE `host` (
  `hid` int PRIMARY KEY,
  `name` varchar(200),
  `since` datetime,
  `location` varchar(1000),
  `description` varchar(10000),
  `response_time` Enum('within an hour', 'within a day', 'within a few hours', 'a few days or more', '') DEFAULT NULL,
  `response_rate` float,
  `acceptance` float,
  `is_super_host` int,
  `neighborhood` varchar(200),
  `email_verified` int,
  `phone_verified` int,
  `work_email_verified` int,
  `identity_verified` int
);

CREATE TABLE `host_url` (
  `hid` int PRIMARY KEY,
  `url` varchar(200)
);

CREATE TABLE `host_thumbnail` (
  `hid` int PRIMARY KEY,
  `thumbnail` varchar(200)
);

CREATE TABLE `host_picture` (
  `hid` int PRIMARY KEY,
  `picture` varchar(200)
);

CREATE TABLE `transaction` (
  `tid` int PRIMARY KEY,
  `customer` int,
  `property` bigint,
  `start_date` datetime,
  `end_date` datetime,
  `total_price` int,
  `review` varchar(500)
);

CREATE TABLE `listing` (
  `lid` bigint PRIMARY KEY,
  `name` varchar(500),
  `description` varchar(10000),
  `neighborhood` varchar(100),
  `neighborhood_overview` varchar(2000),
  `host` int,
  `latitude` float,
  `longitude` float,
  `property_type` varchar(50),
--   `property_type` Enum('Entire condo', 
-- 	   'Room in hostel', 
-- 	   'Room in hotel',
--        'Private room in serviced apartment',
--        'Private room in home',
-- 	   'Private room in rental unit', 
--        'Private room in condo', 
--        'Private room in hostel',
--        'Entire rental unit',
--        'Entire serviced apartment',
--        'Entire home',
--        'Shared room in rental unit'),
  `accommodates` int,
  `bathrooms` varchar(100),
  `bedrooms` int,
  `beds` int,
  `amenities` varchar(2000)
);

CREATE TABLE `listing_url` (
  `lid` bigint PRIMARY KEY,
  `url` varchar(200)
);

CREATE TABLE `listing_picture` (
  `lid` bigint PRIMARY KEY,
  `picture` varchar(200)
);

CREATE TABLE `calendar` (
  `property` bigint,
  `date` datetime,
  `availability` int,
  `min_nights` int,
  `max_nights` int,
  `price` float,
  `adjusted_price` float,
  PRIMARY KEY (`date`, `property`)
);

ALTER TABLE `host_url` ADD FOREIGN KEY (`hid`) REFERENCES `host` (`hid`);

ALTER TABLE `host_thumbnail` ADD FOREIGN KEY (`hid`) REFERENCES `host` (`hid`);

ALTER TABLE `host_picture` ADD FOREIGN KEY (`hid`) REFERENCES `host` (`hid`);

ALTER TABLE `transaction` ADD FOREIGN KEY (`customer`) REFERENCES `customer` (`cid`);

ALTER TABLE `transaction` ADD FOREIGN KEY (`property`) REFERENCES `listing` (`lid`);


ALTER TABLE `listing` ADD FOREIGN KEY (`host`) REFERENCES `host` (`hid`);

ALTER TABLE `listing_url` ADD FOREIGN KEY (`lid`) REFERENCES `listing` (`lid`);

ALTER TABLE `listing_picture` ADD FOREIGN KEY (`lid`) REFERENCES `listing` (`lid`);

ALTER TABLE `calendar` ADD FOREIGN KEY (`property`) REFERENCES `listing` (`lid`);


