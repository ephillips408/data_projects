WITH t1 AS (
	SELECT 
	orderhead.salesorderid,
	orderhead.customerid,
	orderdetail.orderqty,
	orderdetail.productid
		FROM sales.salesorderheader AS orderhead
			JOIN sales.salesorderdetail AS orderdetail
			ON orderhead.salesorderid = orderdetail.salesorderid
	)
	SELECT
		salesorderid,
		COUNT(*)
			FROM t1
			GROUP BY (salesorderid)
			HAVING COUNT(*) = 1
			ORDER BY salesorderid