WITH t1 AS (
	SELECT 
        entity_address.businessentityid,
        address_type.name,
        address.city,
        address.addressline1 AS billing_address
            FROM person.addresstype AS address_type
            JOIN person.businessentityaddress AS entity_address
                ON address_type.addresstypeid = entity_address.addresstypeid
            JOIN person.address AS address
                ON entity_address.addressid = address.addressid
            JOIN sales.salesorderheader AS order_header
                ON address.addressid = order_header.billtoaddressid	
        WHERE name LIKE '%Main Office%'
            AND city LIKE '%Dallas%'
	),
	
	t2 AS (
	SELECT 
        entity_address.businessentityid,
        address_type.name,
        address.city,
        address.addressline1 AS shipping_address
            FROM person.addresstype AS address_type
            JOIN person.businessentityaddress AS entity_address
                ON address_type.addresstypeid = entity_address.addresstypeid
            JOIN person.address AS address
                ON entity_address.addressid = address.addressid
            JOIN sales.salesorderheader AS order_header
                ON address.addressid = order_header.shiptoaddressid	
        WHERE name LIKE '%Shipping%'
            AND city LIKE '%Dallas%'
	)    
	
	SELECT * FROM t1
		LEFT JOIN t2 ON t1.businessentityid = t2.businessentityid