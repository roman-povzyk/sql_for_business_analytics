SELECT COUNT(*) 
FROM phones




SELECT COUNT(*)
FROM brands




SELECT phones.phone_id,
	phones.phone_name,
	phones.brand_id,
	brands.Brand_name,
	brands.brand_id
FROM phones
JOIN brands
	ON phones.brand_id = brands.brand_id




SELECT phones.phone_id,
	phones.phone_name,
	phones.brand_id,
	brands.Brand_name,
	brands.brand_id
FROM phones
LEFT JOIN brands
	ON phones.brand_id = brands.brand_id
WHERE brands.brand_id IS NULL




SELECT phones.phone_id,
	phones.phone_name,
	phones.brand_id,
	brands.Brand_name,
	brands.brand_id
FROM phones
RIGHT JOIN brands
	ON phones.brand_id = brands.brand_id
WHERE phones.phone_id IS NULL




SELECT phones.phone_id,
	phones.phone_name,
	phones.brand_id,
	brands.Brand_name,
	brands.brand_id
FROM phones
FULL JOIN brands
	ON phones.brand_id = brands.brand_id
WHERE phones.phone_id IS NULL 
		OR brands.brand_id IS NULL




SELECT brand_name, 
	(SELECT COUNT(*)
	FROM phones b
	WHERE b.brand_id = a.brand_id) AS gu_t
FROM brands a




SELECT a.Brand_name,
		a.qu_t,
		a.qu_total,
		ROUND(100 * CAST(a.qu_t AS FLOAT)/a.qu_total, 1) AS per
FROM (
SELECT brand_name, 
	(SELECT COUNT(*)
	FROM phones b
	WHERE b.brand_id = a.brand_id) AS qu_t,
	(SELECT COUNT(*)
	FROM phones) AS qu_total
FROM brands a) a
ORDER BY per DESC




SELECT m.merchant_name,
		f.phone_name,
		c.color_name,
		p.price
FROM phone_price p
LEFT JOIN merchants m
	ON p.merchant_id = m.merchant_id
LEFT JOIN colors c
	ON p.color_id = c.color_id
LEFT JOIN phones f
	ON f.phone_id = p.phone_id
LEFT JOIN brands b
	ON f.brand_id = b.brand_id
WHERE p.price >= (SELECT AVG(price)
					FROM phone_price) - 100
AND p.price <= (SELECT AVG(price)
					FROM phone_price) + 100




SELECT m.merchant_name,
		f.phone_name,
		c.color_name,
		p.price,
		f.memory
FROM phone_price p
LEFT JOIN merchants m
	ON p.merchant_id = m.merchant_id
LEFT JOIN colors c
	ON p.color_id = c.color_id
LEFT JOIN phones f
	ON f.phone_id = p.phone_id
LEFT JOIN brands b
	ON f.brand_id = b.brand_id
WHERE f.memory > ALL(SELECT DISTINCT memory
						FROM phones
						WHERE brand_id = 5
							AND memory IS NOT NULL)




SELECT m.merchant_name,
		f.phone_name,
		c.color_name,
		p.price,
		f.memory
FROM phone_price p
LEFT JOIN merchants m
	ON p.merchant_id = m.merchant_id
LEFT JOIN colors c
	ON p.color_id = c.color_id
LEFT JOIN phones f
	ON f.phone_id = p.phone_id
LEFT JOIN brands b
	ON f.brand_id = b.brand_id
WHERE f.memory = ANY(SELECT DISTINCT memory
						FROM phones
						WHERE brand_id = 5
							AND memory IS NOT NULL)
ORDER BY f.memory