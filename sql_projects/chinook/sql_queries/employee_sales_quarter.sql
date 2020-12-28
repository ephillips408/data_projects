SELECT 
	customer."SupportRepId",
	EXTRACT (YEAR FROM invoice."InvoiceDate") AS sale_year,
	EXTRACT (QUARTER FROM invoice."InvoiceDate") AS sale_quarter,
	SUM (invoice."Total")
		FROM public."Invoice" AS invoice
			JOIN public."Customer" AS customer
				ON invoice."CustomerId" = customer."CustomerId"
			GROUP BY(customer."SupportRepId", sale_year, sale_quarter)
			ORDER BY (customer."SupportRepId")