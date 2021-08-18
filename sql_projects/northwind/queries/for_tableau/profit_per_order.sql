-- Gives the sum of each order for each customer
-- Freight is assumed to be paid by the company

SELECT
	ords.customer_id,
	ords.order_id,
	ords.order_date,
	ROUND (SUM (ord_dets.unit_price * ord_dets.quantity * (1 - ord_dets.discount))::NUMERIC, 2) AS sales_total,
	ords.freight,
	ROUND (SUM (ord_dets.unit_price * ord_dets.quantity * (1 - ord_dets.discount) - ords.freight)::NUMERIC, 2) AS profit
		FROM orders AS ords
			JOIN order_details AS ord_dets
				ON ords.order_id = ord_dets.order_id
			GROUP BY (ords.order_id, customer_id, order_date, ords.freight)
			ORDER BY customer_id