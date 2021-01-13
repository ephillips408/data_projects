-- To see which cranksets have sold in London, replace COUNT(*) with
-- product.productid,
-- product.name,
-- address.city

SELECT
	COUNT(*)
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
			ON order_header.shiptoaddressid = address.addressid
			WHERE name LIKE '%Crankset%'
				AND address.city LIKE '%London%'