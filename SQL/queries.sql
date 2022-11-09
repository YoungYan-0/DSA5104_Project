SELECT availability
FROM calendar JOIN listing ON calendar.property = listing.lid
WHERE listing.name = 'Nice room with superb city view' AND date = '2022-07-20';

SELECT customer.name, transaction.start_date, transaction.end_date, transaction.total_price, transaction.review, listing.review_scores_rating
FROM transaction JOIN customer ON transaction.customer = customer.cid JOIN listing ON transaction.property = listing.lid
WHERE listing.name = 'Nice room with superb city view'
ORDER BY transaction.start_date DESC;

SELECT host.name, host.description, host.response_rate, host.response_time, host.is_super_host, host.email_verified, host.phone_verified, host.work_email_verified, host.identity_verified, host_url.url
FROM host JOIN host_url ON host.hid = host_url.hid JOIN listing ON host.hid = listing.host
WHERE listing.name = 'Nice room with superb city view';

SELECT *
FROM listing
WHERE name = 'Nice room with superb city view';

UPDATE calendar
SET availability = 0
WHERE property = 10547346 AND date >= '2022-07-20' AND date <= '2022-07-23';

SELECT *
FROM listing JOIN calendar ON listing.lid = calendar.property
WHERE calendar.date = '2022-07-20' AND calendar.availability = 1;

SELECT *
FROM listing
WHERE listing.neighbourhood = 'Sathon' AND listing.property_type = 'Apartment' AND listing.bedrooms = 1 AND listing.beds = 1 AND listing.bathrooms = 1 AND listing.accommodates = 2 AND listing.review_scores_rating >= 4;

UPDATE transaction
SET review = 'This is a great place to stay. The host is very nice and the room is clean and comfortable. I would definitely recommend this place to my friends.'
WHERE tid = 1;

SELECT *
FROM host
WHERE host.response_rate >= 0.9 AND 
        EXISTS (SELECT * 
                FROM listing 
                WHERE listing.host = host.hid AND listing.review_scores_rating >= 4);

SELECT *
FROM host
WHERE host.name = 'John';

SELECT *
FROM customer
WHERE customer.name = 'Alice';