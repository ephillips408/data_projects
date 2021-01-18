-- In the ORDER BY statement at the end, sum_total can be changed to orders_total, or avg_sale_amount.

SELECT
	address.city,
	COUNT (sales_header.salesorderid) AS orders_total,
	ROUND (SUM (sales_header.totaldue), 2) AS sum_total,
	ROUND (SUM (sales_header.totaldue) / COUNT (sales_header.salesorderid), 2) AS avg_sale_amount
		FROM sales.salesorderheader AS sales_header
			JOIN person.address AS address
				ON sales_header.billtoaddressid = address.addressid
		GROUP BY address.city
		ORDER BY sum_total DESC
