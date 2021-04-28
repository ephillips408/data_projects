-- Gives the count and sale amount for each supplier's product.

SELECT
	sups.company_name,
	prods.product_name,
	COUNT (prods.product_name),
	ROUND ( CAST (SUM (ord_dets.unit_price * ord_dets.quantity) AS NUMERIC), 2) AS sale_total
	FROM order_details AS ord_dets
		JOIN products AS prods
			ON ord_dets.product_id = prods.product_id
		JOIN suppliers AS sups
			ON prods.supplier_id = sups.supplier_id
	GROUP BY (sups.company_name, prods.product_name)
	ORDER BY company_name
			