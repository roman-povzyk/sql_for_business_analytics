SELECT
	p.phone_id,
	b.brand_name AS Brand,
	b.reg_country AS Reg_country,
	b.manuf_country AS Manuf_country,
	p.phone_name AS Product,
	p.os AS OS,
	p.ram AS RAM
FROM phones p
LEFT JOIN brands b
	ON p.brand_id = b.brand_id
WHERE b.brand_id IS NOT NULL
ORDER BY
	b.Brand_name,
	p.phone_id,
	p.os,
	p.ram


SELECT
	client_id,
	client_name
FROM clients
ORDER BY client_name


SELECT 
	phone_id,
	client_id,
	date_purch,
	price
FROM purchases