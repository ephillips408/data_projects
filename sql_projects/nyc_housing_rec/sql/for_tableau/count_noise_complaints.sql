-- Gives the number of noise complaints per zip code.

SELECT
	incident_zip,
	complaint_type,
	COUNT(complaint_type),
	AVG(latitude),
	AVG(longitude)
		FROM calls_311
		WHERE complaint_type LIKE '%Noise%' AND
			incident_zip::text LIKE '1%'
		GROUP BY (incident_zip, complaint_type)