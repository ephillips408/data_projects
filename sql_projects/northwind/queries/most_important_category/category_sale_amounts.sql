WITH t1 AS (
	SELECT
 	cats.category_name,
	ord_det.unit_price,
	ord_det.quantity
	FROM order_details AS ord_det
		JOIN products AS prods
			ON ord_det.product_id = prods.product_id
		JOIN categories AS cats
			ON prods.category_id = cats.category_id
	)
	
	SELECT
		category_name,
		ROUND ( CAST ( SUM (unit_price * quantity) AS NUMERIC), 2) AS sale_total
		FROM t1
		GROUP BY category_name
		ORDER BY sale_total DESC