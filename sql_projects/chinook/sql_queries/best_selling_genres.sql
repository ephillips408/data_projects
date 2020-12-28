SELECT
	genre."Name",
	COUNT (genre."Name")
		FROM public."Invoice" AS invoice
			JOIN public."InvoiceLine" AS invoice_line
				ON invoice."InvoiceId" = invoice_line."InvoiceId"
			JOIN public."Track" AS track
				ON invoice_line."TrackId" = track."TrackId"
			JOIN public."Genre" AS genre
				ON track."GenreId" = genre."GenreId"
			GROUP BY (genre."Name")
			ORDER BY count DESC