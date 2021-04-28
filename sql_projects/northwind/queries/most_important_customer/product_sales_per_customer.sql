-- Gives sale count and sale amount of each product per customer.

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