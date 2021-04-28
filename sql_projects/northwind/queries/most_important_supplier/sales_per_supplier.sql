-- Gives the total sales per supplier.

WITH t1 AS (
	SELECT
	sups.company_name,
	prods.product_name,
	COUNT (prods.product_name),
	ROUND ( CAST (SUM (ords.unit_price * ords.quantity) AS NUMERIC), 2) AS sale_total
	FROM order_details AS ords
		JOIN products AS prods
			ON ords.product_id = prods.product_id
		JOIN suppliers AS sups
			ON prods.supplier_id = sups.supplier_id
	GROUP BY (sups.company_name, prods.product_name)
	ORDER BY company_name
	)
	
	SELECT
		company_name,
		SUM (sale_total)
		FROM t1
		GROUP BY (company_name)