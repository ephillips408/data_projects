-- Gives total sales per day.

SELECT 
	EXTRACT (YEAR FROM order_date) AS order_year,
	EXTRACT (MONTH FROM order_date) AS order_month,
	EXTRACT (DAY FROM order_date) AS order_day,
	ROUND ( CAST (SUM (ord_dets.unit_price * ord_dets.quantity) AS NUMERIC), 2) AS sale_total
	FROM orders AS ords
		JOIN order_details AS ord_dets
			ON ords.order_id = ord_dets.order_id
	GROUP BY (order_year, order_month, order_day)
	ORDER BY 
		order_year,
		order_month,
		order_day
	