SELECT 
	"ArtistId",
	COUNT (sub.*)
	FROM (
		SELECT 
			playlist."PlaylistId",
			track."TrackId",
			album."ArtistId"
		FROM public."Track" AS track
		INNER JOIN public."PlaylistTrack" AS playlist
			ON track."TrackId" = playlist."TrackId"
		INNER JOIN public."Album" AS album
			ON album."AlbumId" = track."AlbumId"
		 ) sub
	GROUP BY "ArtistId"
	ORDER BY count DESC