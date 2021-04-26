-- Change 'Beverages' to any category_name as desired.
-- Remove WHERE statement to see sales sum of all products.
-- Can order by supplier_id.

SELECT
	prods.product_name,
	sups.supplier_id,
	COUNT (prods.product_name),
	ROUND ( CAST (SUM (ords.unit_price * ords.quantity) AS NUMERIC), 2) AS sale_total
	FROM order_details AS ords
        JOIN products AS prods
            ON ords.product_id = prods.product_id
        JOIN categories AS cats
            ON prods.category_id = cats.category_id
        JOIN suppliers AS sups
            ON sups.supplier_id = prods.supplier_id
	WHERE category_name LIKE 'Beverages'
	GROUP BY (prods.product_name, sups.supplier_id)
	ORDER BY sale_total DESC