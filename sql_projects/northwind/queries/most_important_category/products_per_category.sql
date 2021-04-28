-- Gives the number of products per category.

SELECT
	cats.category_name,
	COUNT (prods.product_name)
	FROM products AS prods
		JOIN categories AS cats
			ON cats.category_id = prods.category_id
		GROUP BY (cats.category_name)
		ORDER BY count DESC