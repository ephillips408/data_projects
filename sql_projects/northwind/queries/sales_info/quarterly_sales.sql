-- Gives total sales per quarter.

SELECT 
	EXTRACT (YEAR FROM order_date) AS order_year,
	EXTRACT (QUARTER FROM order_date) AS order_quarter,
	ROUND ( CAST (SUM (ord_dets.unit_price * ord_dets.quantity) AS NUMERIC), 2) AS sale_total
	FROM orders AS ords
		JOIN order_details AS ord_dets
			ON ords.order_id = ord_dets.order_id
	GROUP BY (order_year, order_quarter)
	ORDER BY 
		order_year,
		order_quarter