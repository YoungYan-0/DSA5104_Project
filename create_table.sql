CREATE TABLE `customer` (
  `cid` int PRIMARY KEY,
  `name` varchar(40)
);

CREATE TABLE `neighborhood` (
  `name` varchar(40) PRIMARY KEY,
  `overview` varchar(500)
);

CREATE TABLE `host` (
  `hid` int[pk],
  `url` varchar(80),
  `name` varchar(40),
  `since` datetime,
  `location` varchar(40),
  `description` varchar(500),
  `response_time` Enum,
  `response_rate` float,
  `acceptance` float,
  `is_super_host` int,
  `thumbnail` varchar(80),
  `picture` varchar(80),
  `neighborhood` varchar(40),
  `email_verified` int,
  `phone_verified` int,
  `work_email_verified` int,
  `identity_verified` int
);

CREATE TABLE `transaction` (
  `tid` int PRIMARY KEY,
  `customer` int,
  `property` int,
  `start_date` datetime,
  `end_date` datetime,
  `total_price` int,
  `review` varchar(500)
);

CREATE TABLE `listing` (
  `lid` int PRIMARY KEY,
  `url` varchar(80),
  `name` varchar(40),
  `description` varchar(500),
  `neighborhood` varchar(40),
  `picture_url` varchar(80),
  `host` int,
  `latitude` float,
  `longitude` float,
  `property_type` Enum,
  `accommodates` int,
  `bathrooms` varchar(40),
  `bedrooms` int,
  `beds` int,
  `amenities` varchar(500)
);

CREATE TABLE `calendar` (
  `date` datetime,
  `property` int,
  `availability` int,
  `min_nights` int,
  `max_nights` int,
  `price` int,
  `adjusted_price` int,
  PRIMARY KEY (`date`, `property`)
);

ALTER TABLE `host` ADD FOREIGN KEY (`neighborhood`) REFERENCES `neighborhood` (`name`);

ALTER TABLE `transaction` ADD FOREIGN KEY (`customer`) REFERENCES `customer` (`cid`);

ALTER TABLE `transaction` ADD FOREIGN KEY (`property`) REFERENCES `listing` (`lid`);

ALTER TABLE `listing` ADD FOREIGN KEY (`neighborhood`) REFERENCES `neighborhood` (`name`);

ALTER TABLE `listing` ADD FOREIGN KEY (`host`) REFERENCES `host` (`hid`);

ALTER TABLE `calendar` ADD FOREIGN KEY (`property`) REFERENCES `listing` (`lid`);
