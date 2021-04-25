SELECT
	COUNT (prods.product_name),
	cats.category_name
	FROM products AS prods
		JOIN categories AS cats
			ON cats.category_id = prods.category_id
		GROUP BY (cats.category_name)
		ORDER BY count DESC