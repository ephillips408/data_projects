WITH t1 AS (
	SELECT
	orders.order_id,
	ord_det.product_id,
 	cats.category_name,
	ord_det.unit_price,
	ord_det.quantity
	FROM order_details AS ord_det
		JOIN orders
			ON orders.order_id = ord_det.order_id
		JOIN products AS prods
			ON ord_det.product_id = prods.product_id
		JOIN categories AS cats
			ON prods.category_id = cats.category_id
	)
	
	SELECT
		category_name,
		COUNT (category_name)
		FROM t1
		GROUP BY (category_name)
		ORDER BY count DESC