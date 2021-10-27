-- Count of listings per minimum number of nights per neighborhood

SELECT
	neighborhood,
	neighborhood_group,
	minimum_nights,
	COUNT(minimum_nights) AS num_of_listings
		FROM nyc_airbnb
		GROUP BY(neighborhood, neighborhood_group, minimum_nights)
		ORDER BY neighborhood_group, neighborhood, minimum_nights DESC