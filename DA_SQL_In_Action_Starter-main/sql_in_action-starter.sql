-- <<<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>>
-- TODO: Remove the "--" from the below SELECT query and run the query
--    NOTE: When writing queries, make sure each one ends with a semi-colon

SELECT * FROM final_airbnb;



-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out how many rows are in the table "final_airbnb"
-- EXPECTED OUTPUT: 146

SELECT COUNT(id) FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out the name of the host for "host_id" 63613
-- HINT: "Where" could it be?

-- EXPECTED OUTPUT: Patricia

SELECT host_name FROM final_airbnb WHERE host_id = 63613;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to just show the unique neighbourhoods listed
-- HINT: This is a "distinct" operation...

-- EXPECTED OUTPUT: 40 neighbourhoods listed

SELECT DISTINCT neighbourhood FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>>

-- Find both the highest price listing and the lowest price listing, displaying the entire row for each
-- HINT: This can be two different queries.

-- FOOD FOR THOUGHT: Think about the results. Are the high and low prices outliers in this data set?

-- EXPECTED OUTPUT: Highest = 785, Lowest = 55

SELECT MIN(price), MAX(price) FROM final_airbnb; 

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the average availability for all listings in the data set (using the availability_365 column)
-- HINT: Aggregates are more than just big rocks...

-- EXPECTED OUTPUT: 165.3904

SELECT AVG(availability_365) FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>>
-- Find all listings that do NOT have a review
-- HINT: There are a few ways to go about this. Remember that an empty cell is "no value", but not necessarily NULL

-- EXPECTED OUTPUT: 6 rows

SELECT * FROM final_airbnb WHERE number_of_reviews = 0;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 7 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the id of the listing with a room_type of "Private room" that has the most reviews 
-- HINT: Sorting is your friend!

-- EXPECTED OUTPUT: 58059
SELECT id FROM final_airbnb WHERE room_type = 'Private Room' ORDER BY number_of_reviews DESC LIMIT 1;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 8 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the most popular neighbourhood for listings 
-- HINT: Look for which neighbourhood appears most frequently in the neighbourhood column
-- HINT: You are creating "summary rows" for each neighbourhood, so you will just see one entry for each neighbourhood

-- EXPECTED OUTPUT: Williamsburg
-- INVESTIGATE: Should Williamsburg be crowned the most popular neighbourhood?

SELECT neighbourhood, count(neighbourhood) FROM final_airbnb GROUP BY neighbourhood ORDER BY COUNT(neighbourhood) DESC;
-- Williamsburg should not be crowned the most popular neighbourhood because Harlem also has 16 appearances in the data. 

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 9 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to discover which listing is the most popular using the reviews_per_month for all listings with a minimum_nights value of less than 7
-- HINT: Sorting is still your friend! So are constraints.

-- EXPECTED OUTPUT: 58059

SELECT id FROM final_airbnb ORDER BY reviews_per_month DESC, minimum_nights < 7;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 10 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out which host has the most listings. 
-- Create a NEW column that will show a calculation for how many listings the host for each listing has in the table
-- Display the column using aliasing.
-- HINT: Work this one step at a time. See if you can find a way to just display the count of listings per host first.

-- EXPECTED OUTPUT: The Box House Hotel with 6 listings

ALTER TABLE final_airbnb ADD COLUMN total_listings_for_host varchar(146);
SELECT host_name, COUNT(*) as total_listings_for_host FROM final_airbnb GROUP BY host_name ORDER BY COUNT(host_name) DESC;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 11 >>>>>>>>>>>>>>>>>>>>>>>
-- <<<<<<<<<<<<<<<<<<<<<<< WRAP UP >>>>>>>>>>>>>>>>>>>>>>>>>
-- What do you think makes a successful AirBnB rental in this market? What factors seem to be at play the most?
-- Write a few sentances and include them with your project submission in the README file 

SELECT * FROM final_airbnb WHERE number_of_reviews >=300 LIMIT 10;
SELECT neighbourhood_group, COUNT(neighbourhood_group) FROM final_airbnb WHERE number_of_reviews >=300 GROUP BY neighbourhood_group ORDER BY count(neighbourhood_group) DESC;
SELECT neighbourhood, COUNT(neighbourhood) FROM final_airbnb WHERE number_of_reviews >=300 GROUP BY neighbourhood ORDER BY count(neighbourhood) DESC;

-- Location is definitely a key factor in having a successful AirBnB rental in this market. The data shows that Manhattan is a well sought after neighborhood with 7 of the top 10 most reviewed listings. 

-- <<<<<<<<<<<<<<<<<<<<< ** BONUS ** >>>>>>>>>>>>>>>>>>>>>>>
-- Find the the percent above or below each listing is compared to the average price for that neighbourhood.
-- HINT: No hints! It's a bonus for a reason :)

SELECT id, price/avg(price) as price_plus_minus FROM final_airbnb ORDER BY id, price_plus_minus; 

-- only selecting first row not complete table