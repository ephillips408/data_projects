SELECT 
	address.city,
	orderheader.subtotal,
	EXTRACT (YEAR FROM orderheader.orderdate) AS year,
	EXTRACT (MONTH FROM orderheader.orderdate)AS month,
	EXTRACT (DAY FROM orderheader.orderdate) AS day
		FROM sales.salesorderheader AS orderheader
		JOIN person.address AS address
			ON orderheader.billtoaddressid = address.addressid