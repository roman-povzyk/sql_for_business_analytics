SELECT *
FROM purchases




SELECT
		cl.client_name AS Customer,
		p.date_purch AS Date,
		b.Brand_name AS Brand,
		ph.phone_name AS Product,
		c.color_name AS Color,
		ph.os AS OSystem,
		ph.ram AS RAM,
		p.price AS Price
FROM purchases p
LEFT JOIN phones ph
	ON p.phone_id = ph.phone_id
LEFT JOIN brands b
	ON ph.brand_id = b.brand_id
LEFT JOIN colors c 
	ON p.color_id = c.color_id
LEFT JOIN clients cl
	ON p.client_id = cl.client_id
WHERE ph.ram IS NOT NULL
	OR ph.os IS NOT NULL
	AND p.date_purch >= '01.01.2019'
ORDER BY 
		p.date_purch,
		b.Brand_name,
		ph.phone_name,
		c.color_name

