-- Gives the date on which a product was sold, as well as the product's category.
-- Also gives the sale total for the product.

SELECT 
	prods.product_name,
	cats.category_name,
	EXTRACT (YEAR FROM ords.order_date) AS order_year,
	EXTRACT (MONTH FROM ords.order_date) AS order_month,
	EXTRACT (DAY FROM ords.order_date) AS order_day,
	ROUND ( CAST (SUM (ord_dets.unit_price * ord_dets.quantity) AS NUMERIC), 2) AS sale_total
	FROM orders AS ords
		JOIN order_details AS ord_dets
			ON ords.order_id = ord_dets.order_id
		JOIN products AS prods
			ON prods.product_id = ord_dets.product_id
		JOIN categories AS cats
			ON prods.category_id = cats.category_id
	GROUP BY (product_name, category_name, order_year, order_month, order_day)
 	ORDER BY
		order_year, 
		order_month,
		order_day