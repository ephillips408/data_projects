-- Added a column "sales amount" in Tableau with the following calculation.
-- [Order Quantity] * [Unit Price] * (1 - [Discount])

SELECT
	ords.customer_id,
	custs.city,
	custs.country,
	ords.order_date,
	prods.product_name,
	ord_dets.quantity,
	prods.unit_price,
	ord_dets.discount
		FROM orders AS ords
			JOIN order_details AS ord_dets
				ON ords.order_id = ord_dets.order_id
			JOIN products AS prods
				ON prods.product_id = ord_dets.product_id
			JOIN customers AS custs
				ON ords.customer_id = custs.customer_id	
			ORDER BY customer_id