-- Counts the number of listings that have have no reviews in the last 12 months
-- and are also fully booked.

-- The result is 13330, which is roughly 36% of the dataset.

WITH t1 AS (
	SELECT
		id,
		number_of_reviews_ltm,
		ROUND (CAST (availability_365 AS NUMERIC) / 365, 2) AS availability_percent,
		ROUND ((1 - CAST (availability_365 AS NUMERIC) / 365), 2) AS occupancy_rate
			FROM nyc_airbnb
			WHERE number_of_reviews_ltm = 0 AND 
				ROUND (CAST (availability_365 AS NUMERIC) / 365, 2) != 1
	)
	
	SELECT COUNT(*) FROM t1
		WHERE number_of_reviews_ltm = 0 AND
			occupancy_rate = 1