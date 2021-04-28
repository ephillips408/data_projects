-- Gives the count of products ordered and total sale amount.
-- Two companies may be missing in this query.

WITH t1 AS (
	SELECT
	custs.company_name,
	prods.product_name,
	COUNT (prods.product_name),
	ROUND ( CAST (SUM (ord_dets.unit_price * ord_dets.quantity) AS NUMERIC), 2) AS sale_total
	FROM customers AS custs
		JOIN orders AS ords
			ON custs.customer_id = ords.customer_id
		JOIN order_details AS ord_dets
			ON ords.order_id = ord_dets.order_id
		JOIN products AS prods
			ON prods.product_id = ord_dets.product_id
	GROUP BY (company_name, prods.product_name)
	ORDER BY company_name
	)
	
	SELECT
		company_name,
		COUNT (product_name) AS products_ordered,
		SUM (sale_total) AS sale_total
		FROM t1
		GROUP BY (company_name)
		ORDER BY sale_total DESC