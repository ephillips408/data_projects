-- Change 'Beverages' to any category_name as desired.
-- Remove WHERE statement to see sales count of all products.
-- Can also order by supplier_id.

SELECT
	prods.product_name,
	sups.supplier_id,
	COUNT (prods.product_name)
	FROM order_details AS ords
        JOIN products AS prods
            ON ords.product_id = prods.product_id
        JOIN categories AS cats
            ON prods.category_id = cats.category_id
        JOIN suppliers AS sups
            ON sups.supplier_id = prods.supplier_id
	WHERE category_name LIKE 'Beverages'
	GROUP BY (prods.product_name, sups.supplier_id)
	ORDER BY count DESC