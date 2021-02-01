queries_dict = {
	'city_unique_items': """SELECT
		address.city,
		COUNT (DISTINCT product.productid)
			FROM production.product AS product
			JOIN production.productproductphoto AS photo
				ON product.productid = photo.productid
			JOIN sales.specialofferproduct AS offer
				ON photo.productid = offer.productid
			JOIN sales.salesorderdetail AS order_detail
				ON offer.productid = order_detail.productid
			JOIN sales.salesorderheader AS order_header
				ON order_detail.salesorderid = order_header.salesorderid
			JOIN person.address AS address
				ON order_header.billtoaddressid = address.addressid
			GROUP BY (address.city)
			ORDER BY count DESC""",
			
	'city_subcategory_sale_counts': """SELECT
		address.city,
		product.productid,
		product.productsubcategoryid,
		COUNT (product.productsubcategoryid),
		product.standardcost,
		product.listprice
			FROM production.product AS product
			JOIN production.productproductphoto AS photo
				ON product.productid = photo.productid
			JOIN sales.specialofferproduct AS offer
				ON photo.productid = offer.productid
			JOIN sales.salesorderdetail AS order_detail
				ON offer.productid = order_detail.productid
			JOIN sales.salesorderheader AS order_header
				ON order_detail.salesorderid = order_header.salesorderid
			JOIN person.address AS address
				ON order_header.billtoaddressid = address.addressid
			GROUP BY (address.city, product.productid, product.productsubcategoryid, product.standardcost, product.listprice)
		ORDER BY city""",

	'city_unique_product_subcategories': """SELECT
		address.city,
		COUNT (DISTINCT product.productsubcategoryid)
			FROM production.product AS product
			JOIN production.productproductphoto AS photo
				ON product.productid = photo.productid
			JOIN sales.specialofferproduct AS offer
				ON photo.productid = offer.productid
			JOIN sales.salesorderdetail AS order_detail
				ON offer.productid = order_detail.productid
			JOIN sales.salesorderheader AS order_header
				ON order_detail.salesorderid = order_header.salesorderid
			JOIN person.address AS address
				ON order_header.billtoaddressid = address.addressid
			GROUP BY (address.city)
			ORDER BY count DESC""",		

	'sales_info_city': """SELECT
		address.city,
		COUNT (sales_header.salesorderid) AS orders_total,
		ROUND (SUM (sales_header.totaldue), 2) AS sum_total,
		ROUND (SUM (sales_header.totaldue) / COUNT (sales_header.salesorderid), 2) AS avg_sale_amount
			FROM sales.salesorderheader AS sales_header
				JOIN person.address AS address
					ON sales_header.billtoaddressid = address.addressid
			GROUP BY address.city
			ORDER BY sum_total DESC"""
}