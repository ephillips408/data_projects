SELECT COUNT(sub.*)
	FROM (
		SELECT 
			"TrackId",
			COUNT ("TrackId") AS "TrackCount"
			FROM public."PlaylistTrack"
				GROUP BY "TrackId"
				ORDER BY COUNT ("TrackId")
		 ) sub