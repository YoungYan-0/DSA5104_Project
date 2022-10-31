USE Airbnb;

-- SHOW VARIABLES LIKE "secure_file_priv"; 
-- SET GLOBAL local_infile = true;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer.csv' 
INTO TABLE Customer 
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- SELECT * FROM Customer;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/host.csv' 
INTO TABLE `Host` 
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/host_url.csv' 
INTO TABLE Host_url 
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/host_thumbnail.csv' 
INTO TABLE Host_thumbnail 
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/host_picture.csv' 
INTO TABLE Host_picture
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/listing.csv' 
INTO TABLE Listing 
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/listing_url.csv' 
INTO TABLE Listing_url 
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/listing_picture.csv' 
INTO TABLE Listing_picture
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/calendar.csv' 
INTO TABLE Calendar
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;