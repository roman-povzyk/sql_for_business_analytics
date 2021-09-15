SELECT 
	m.merchant_name,
	b.Brand_name,
	f.phone_name,
	c.color_name,
	p.price,
	IIF(p.color_id = 11, 'Sell*', '') as sell,
	IIF(s.amount <= 10, IIF(s.amount = 0, 'Waiting', 'Ending'), '') as st
FROM phone_price p
LEFT JOIN merchants m
	ON p.merchant_id = m.merchant_id
LEFT JOIN phones f
	ON p.phone_id = f.phone_id
LEFT JOIN brands b
	ON f.brand_id = b.brand_id
LEFT JOIN colors c
	ON p.color_id = c.color_id
LEFT JOIN stock s
	ON p.merchant_id = s.merchant_id
	AND p.phone_id = s.phone_id
	AND p.color_id = s.color_id
-- WHERE p.color_id = 11
ORDER BY
	m.merchant_name,
	b.Brand_name,
	f.phone_name,
	c.color_name,
	p.price*/


SELECT 
	phone_name,
	battery_type,
	CASE TRIM(battery_type)
	WHEN 'Li-Ion' THEN 'Litiy ion'
	WHEN 'Li-Pol' THEN 'Litiy polimer'
	ELSE ''
	END AS b_t
FROM phones


SELECT
	a.Brand_name,
	a.phone_name,
	a.avg_price,
	CASE
		WHEN avg_price >= 20000 THEN 'Premium'
		WHEN avg_price >= 10000 AND avg_price < 20000 THEN 'Lux'
		WHEN avg_price >= 6000 AND avg_price < 10000 THEN 'Top'
		WHEN avg_price >= 2000 AND avg_price < 6000 THEN 'Budget'
		WHEN avg_price < 2000 THEN 'Free'
		ELSE '***'
	END AS class_1,
	CASE
		WHEN avg_price < 2000 THEN 'Free'
		WHEN avg_price < 6000 THEN 'Budget'
		WHEN avg_price < 10000 THEN 'Top'
		WHEN avg_price < 20000 THEN 'Lux'
		ELSE 'Premium'
	END AS class_2	
FROM (
SELECT
	b.Brand_name,
	f.phone_name,
	ROUND(AVG(price), 0) AS avg_price
FROM phone_price p
LEFT JOIN phones f
	ON p.phone_id = f.phone_id
LEFT JOIN brands b
	ON f.brand_id = b.brand_id
GROUP by
	b.Brand_name,
	f.phone_name) a
ORDER BY class_1


SELECT
	phone_id,
	negative,
	neutral,
	positive,
	enthusiastic,
	ISNULL(negative * (-1), 0) + ISNULL(neutral * (-1), 0) 
		+ ISNULL(positive, 0) + ISNULL(enthusiastic * (0.5), 0) AS ball_p,
	COALESCE(enthusiastic, positive, 0)/COALESCE(negative, neutral, 1) as rating
FROM phone_comment
ORDER BY rating DESC*/


SELECT 
	COUNT(*),
	COUNT(brand_id),
	COUNT(IIF(brand_id = 5, NULL, brand_id)) AS without_5,
	COUNT(NULLIF(brand_id, 5)) AS without_5_nullif
FROM phones