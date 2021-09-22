-- task 10.1
SELECT
	a.brand_name,
	a.brand_id,
	b.color_name,
	b.color_id,
	a.reg_country
FROM brands a
	CROSS JOIN colors b
WHERE a.reg_country LIKE 'Япония'


-- task 10.2
SELECT
	a.*,
	b.brand_id
FROM phone_price a
LEFT JOIN phones b
	ON a.phone_id = b.phone_id


-- task 10.3
SELECT
	*
FROM
(SELECT
	a.brand_name,
	a.brand_id,
	b.color_name,
	b.color_id,
	a.reg_country
FROM brands a
	CROSS JOIN colors b
WHERE a.reg_country LIKE 'Япония') c
	FULL JOIN (SELECT
					a.*,
					b.brand_id
				FROM phone_price a
				LEFT JOIN phones b
					ON a.phone_id = b.phone_id) d
ON c.brand_id = d.brand_id
	AND c.color_id = d.color_id


-- task 10.5
SELECT
	a.price,
	b.merchant_name,
	d.Brand_name,
	c.phone_name
FROM phone_price a
LEFT JOIN merchants b
	ON a.merchant_id = b.merchant_id
LEFT JOIN phones c
	ON a.phone_id = c.phone_id
LEFT JOIN brands d
	ON c.brand_id = d.brand_id
ORDER BY
	merchant_name,
	Brand_name,
	phone_name


-- task 10.6
SELECT
	a.price,
	b.merchant_name,
	d.Brand_name,
	c.phone_name,
	ROW_NUMBER() OVER(ORDER BY
							b.merchant_name,
							d.Brand_name,
							c.phone_name) AS row_number
FROM phone_price a
LEFT JOIN merchants b
	ON a.merchant_id = b.merchant_id
LEFT JOIN phones c
	ON a.phone_id = c.phone_id
LEFT JOIN brands d
	ON c.brand_id = d.brand_id
ORDER BY
	merchant_name,
	Brand_name,
	phone_name


-- task 10.7
SELECT
	a.price,
	b.merchant_name,
	d.Brand_name,
	c.phone_name,
	ROW_NUMBER() OVER(PARTITION BY b.merchant_name ORDER BY
							b.merchant_name,
							d.Brand_name,
							c.phone_name) AS row_number
FROM phone_price a
LEFT JOIN merchants b
	ON a.merchant_id = b.merchant_id
LEFT JOIN phones c
	ON a.phone_id = c.phone_id
LEFT JOIN brands d
	ON c.brand_id = d.brand_id
ORDER BY
	merchant_name,
	Brand_name,
	phone_name


-- task 10.8
SELECT
	a.price,
	b.merchant_name,
	d.Brand_name,
	c.phone_name,
	ROW_NUMBER() OVER(PARTITION BY b.merchant_name, d.Brand_name ORDER BY
							b.merchant_name,
							d.Brand_name,
							c.phone_name) AS row_number
FROM phone_price a
LEFT JOIN merchants b
	ON a.merchant_id = b.merchant_id
LEFT JOIN phones c
	ON a.phone_id = c.phone_id
LEFT JOIN brands d
	ON c.brand_id = d.brand_id
ORDER BY
	merchant_name,
	Brand_name,
	phone_name