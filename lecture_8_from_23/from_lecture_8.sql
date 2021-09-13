SELECT m.merchant_name,
	b.Brand_name,
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
WHERE p.phone_id IN (SELECT phone_id
					FROM stock
					GROUP BY phone_id
					HAVING SUM(amount) <= 10)




SELECT m.merchant_name,
	b.Brand_name,
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
WHERE EXISTS(SELECT *
			FROM stock s
			WHERE s.merchant_id = p.merchant_id
			AND s.phone_id = p.phone_id
			AND s.color_id = p.color_id
			AND s.amount <= 5)




SELECT COUNT(*)
FROM phones




SELECT COUNT(*)
FROM brands




SELECT 1581 * 92




SELECT *
FROM phones p, 
		brands b
WHERE p.brand_id = b.brand_id




SELECT b.brand_id,
		p.phone_name
FROM phones p
LEFT JOIN brands b
	ON p.brand_id = b.brand_id
WHERE p.memory = 512
UNION
SELECT b.brand_id,
		p.phone_name
FROM phones p
LEFT JOIN brands b
	ON p.brand_id = b.brand_id
WHERE p.ram = 8




SELECT merchant_name, 
		'�' as col1,
		'� ��������' as col2
FROM merchants
WHERE merchant_id = 83
UNION
SELECT b.Brand_name,
		p.phone_name,
		c.color_name
FROM phone_color pc
LEFT JOIN phones p
	ON pc.phone_id = p.phone_id
LEFT JOIN brands b
	ON p.brand_id = b.brand_id
LEFT JOIN colors c
	ON pc.color_id = c.color_id
WHERE pc.phone_id = 1059800
-- ORDER BY pc.phone_id, 
--		pc.color_id
INTERSECT
SELECT b.Brand_name,
		p.phone_name,
		c.color_name
		-- s.merchant_id,
		-- s.amount
FROM stock s
LEFT JOIN phones p
	ON s.phone_id = p.phone_id
LEFT JOIN brands b
	ON p.brand_id = b.brand_id
LEFT JOIN colors c
	ON s.color_id = c.color_id
WHERE s.phone_id = 1059800
	AND s.merchant_id = 83
	AND s.amount <> 0
ORDER BY 1 DESC




SELECT merchant_name, 
		'�' as col1,
		'� ��������' as col2
FROM merchants
WHERE merchant_id = 83
UNION
SELECT b.Brand_name,
		p.phone_name,
		c.color_name
FROM phone_color pc
LEFT JOIN phones p
	ON pc.phone_id = p.phone_id
LEFT JOIN brands b
	ON p.brand_id = b.brand_id
LEFT JOIN colors c
	ON pc.color_id = c.color_id
WHERE pc.phone_id = 1059800
-- ORDER BY pc.phone_id, 
--		pc.color_id
EXCEPT
SELECT b.Brand_name,
		p.phone_name,
		c.color_name
		-- s.merchant_id,
		-- s.amount
FROM stock s
LEFT JOIN phones p
	ON s.phone_id = p.phone_id
LEFT JOIN brands b
	ON p.brand_id = b.brand_id
LEFT JOIN colors c
	ON s.color_id = c.color_id
WHERE s.phone_id = 1059800
	AND s.merchant_id = 83
	AND s.amount <> 0
ORDER BY 1 DESC

