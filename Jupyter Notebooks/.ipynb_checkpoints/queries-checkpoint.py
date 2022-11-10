listing = db.Listing.findOne({"name": "Nice room with superb city view"})
db.Calendar.find({"property": listing._id, "date": "2022-07-20"}, {"available": 1})

transactions = db.Transaction.find({"property": listing._id}, {"customer": 1, "property": 1, "start_date": 1, "end_date": 1, "total_price": 1, "review": 1}).sort("start_date", -1)
transactions

db.Customer.find({"_id": {"$in": [t.customer for t in transactions]}})
db.Listing.find({"_id": {"$in": [t.property for t in transactions]}}, {"reviews_scores_rating": 1})
db.Host.find({"_id": listing.host}, {"name": 1, "description": 1, "response_rate": 1, "response_time": 1, "is_super_host": 1, "email_verified": 1, "phone_verified": 1, "identity_verified": 1})
db.Host_url.find({"host": listing.host}, {"url": 1})

listing

db.Calendar.updateMany({"property": listing._id, "date": {"$gte": "2022-07-20", "$lte": "2022-07-23"}}, {"$set": {"availability": False}})

availables = db.Calendar.find({"date": "2022-07-20", "available": True}, {"property": 1})
db.Listing.find({"_id": {"$in": [a.property for a in availables]}})

db.Listing.find({"neighbourhood": "Sathon", "property_type": "Apartment", "bedrooms": 1, "beds": 1, "bathrooms": 1, "accommodates": 2, "reviews_scores_rating": {"$gte": 4}})

db.Transaction.updateOne({"_id": ObjectId("1")}, {"$set": {"review": "Great place to stay!"}})

hosts = db.Listing.find({"review_scores_rating": {"$gte": 4}}, {"host": 1})
db.Host.find({"_id": {"$in": [h.host for h in hosts]}}, "response_rate": {"$gte": 0.9})

db.Host.find({"name": "John"})

db.Customer.find({"name": "Alice"})