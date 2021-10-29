-- This query checks the number of listings that are marked as unavailable at some point
-- in the next 365 days, but have not had a review on their listing in the last 12 months.

-- This could be indicative of a host marking their listing as unavailable as opposed to
-- booking their listing with guests.

SELECT
	id,
	number_of_reviews_ltm,
	ROUND (CAST (availability_365 AS NUMERIC) / 365, 2) AS availability_percent,
	ROUND ((1 - CAST (availability_365 AS NUMERIC) / 365), 2) AS occupancy_rate
		FROM nyc_airbnb
		WHERE number_of_reviews_ltm = 0 AND 
			ROUND (CAST (availability_365 AS NUMERIC) / 365, 2) != 1