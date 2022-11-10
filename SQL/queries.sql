USE Airbnb;

SELECT availability
FROM calendar JOIN listing ON calendar.property = listing.lid
WHERE listing.name = 'Nice room with superb city view' AND date = '2022-07-20';

UPDATE calendar
SET availability = 0
WHERE property = 27934 AND date >= '2022-07-20' AND date <= '2022-07-23';

SELECT *
FROM listing
WHERE listing.neighbourhood = 'Sathon' 
        AND listing.bedrooms = 1 
        AND listing.beds = 1 
        AND listing.accommodates = 2 
        AND listing.review_scores_rating >= 4;

UPDATE transaction
SET review = "This is B&B is new, clean, and the staff is extremely friendly. 
				But most importantly, Tor is an excellent host! He personally 
                showed me around his neighborhood to give me tips on where to eat, 
                get a massage, which pharmacy speaks English, etc. He even helped me 
                with reservations at a resort for my trip outside of Bangkok and 
                assisted me over the phone when I was in a bit of trouble. My 
                10-day stay in Bangkok would not have been as enjoyable as it was had 
                it not been for Tor.<br/>Thank you sooo much, man!"
WHERE tid = 180261;

SELECT *
FROM host
WHERE host.response_rate >= 1 AND 
        EXISTS (SELECT * 
                FROM listing 
                WHERE listing.host = host.hid AND listing.review_scores_rating >= 4);

SELECT *
FROM customer
WHERE customer.name = 'Tom';

SELECT host.name, host.description, host.response_rate, host.response_time, host.is_super_host, host.email_verified, host.phone_verified, host.work_email_verified, host.identity_verified, host_url.url
FROM host JOIN host_url ON host.hid = host_url.hid JOIN listing ON host.hid = listing.host
WHERE listing.name = 'Nice room with superb city view';

SELECT customer.name, transaction.start_date, transaction.end_date, transaction.total_price, transaction.review, listing.review_scores_rating
FROM transaction JOIN customer ON transaction.customer = customer.cid JOIN listing ON transaction.property = listing.lid
WHERE listing.name = 'Nice room with superb city view'
ORDER BY transaction.start_date DESC;

SELECT *
FROM listing
WHERE name = 'Nice room with superb city view';

SELECT *
FROM listing JOIN calendar ON listing.lid = calendar.property
WHERE calendar.date = '2022-07-20' AND calendar.availability = 1;

SELECT *
FROM host
WHERE host.name = 'John';

SELECT *
FROM Transaction;
