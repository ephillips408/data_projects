-- Gives the number of private rooms per neighborhood alongside median price
-- room_type can be changed as needed

SELECT
	neighborhood,
	COUNT(*),
	PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY price)
	FROM nyc_airbnb
		WHERE room_type = 'Private room'
		GROUP BY (neighborhood)
		ORDER BY count DESC