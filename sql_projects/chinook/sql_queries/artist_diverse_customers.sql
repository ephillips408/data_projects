WITH t1 AS (
		SELECT
			artist."Name" AS artist_name,
			customer."Country" AS customer_country
				FROM public."Customer" AS customer
					INNER JOIN public."Invoice" AS invoice
						ON customer."CustomerId" = invoice."CustomerId"
					INNER JOIN public."InvoiceLine" AS invoice_line
						ON invoice."InvoiceId" = invoice_line."InvoiceId"
					INNER JOIN public."Track" AS track
						ON invoice_line."TrackId" = track."TrackId"
					INNER JOIN public."Album" AS album
						ON track."AlbumId" = album."AlbumId"
					INNER JOIN public."Artist" AS artist
						ON artist."ArtistId" = album."ArtistId"
	)
	SELECT DISTINCT * FROM t1
	ORDER BY artist_name