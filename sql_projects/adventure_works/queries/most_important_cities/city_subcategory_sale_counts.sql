SELECT
	address.city,
	product.productsubcategoryid,
	COUNT (product.productsubcategoryid)
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
		GROUP BY (address.city, product.productsubcategoryid)
		ORDER BY city
        