WITH t1 AS (
		SELECT 
			customer."CustomerId",
			customer."FirstName",
			customer."LastName",
			track."Name",
			genre."GenreId"
				FROM public."Customer" customer
					INNER JOIN public."Invoice" invoice
						ON customer."CustomerId" = invoice."CustomerId"
					INNER JOIN public."InvoiceLine" invoice_line
						ON invoice."InvoiceId" = invoice_line."InvoiceId"
					INNER JOIN public."Track" track
						ON invoice_line."TrackId" = track."TrackId"
					INNER JOIN public."Genre" genre
						ON genre."GenreId" = track."GenreId"
		)
		SELECT
			"CustomerId",
			COUNT (DISTINCT "GenreId") AS genres
				FROM t1
			GROUP BY "CustomerId"
			ORDER BY genres DESC