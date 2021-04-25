SELECT 
	prod.product_name,
	prod.supplier_id,
	prod.category_id,
	cats.category_name,
	sup.company_name,
	sup.country,
	prod.discontinued
	FROM products AS prod
		JOIN suppliers AS sup
			ON prod.supplier_id = sup.supplier_id
		JOIN categories as cats
			ON prod.category_id = cats.category_id
		ORDER BY supplier_id