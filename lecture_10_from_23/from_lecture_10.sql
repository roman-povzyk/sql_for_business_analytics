SELECT
	a.merchant_name,
	a.Brand_name,
	a.phone_name,
	b.qu_sell
FROM
(SELECT 
	b.merchant_name,
	a.Brand_name,
	a.phone_name,
	b.merchant_id,
	a.phone_id		
FROM
(SELECT
	b.Brand_name,
	f.phone_name,
	f.phone_id
FROM phones f
LEFT JOIN brands b
	ON f.brand_id = b.brand_id
WHERE f.brand_id = 5) a,
(SELECT 
	merchant_name,
	merchant_id
FROM merchants
WHERE merchant_id IN (44, 88)) b) a
LEFT JOIN
(SELECT
	p.merchant_id,
	p.phone_id,
	COUNT(price) AS qu_sell
FROM purchases p
LEFT JOIN phones f
	ON p.phone_id = f.phone_id
WHERE p.merchant_id IN (44, 88)
	AND f.brand_id = 5
GROUP BY 
	p.merchant_id,
	p.phone_id) b
ON a.merchant_id = b.merchant_id
	AND a.phone_id = b.phone_id*/


SELECT 
	merchant_name,
	Brand_name,
	color_name,
	qu_sell,
	FIRST_VALUE(qu_sell) OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS first_fn,
	LAST_VALUE(qu_sell) OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS last_fn,
	LEAD(qu_sell, 1, 0) OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS lead_fn,
	LAG(qu_sell, 1, 0) OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS lag_fn,
	NTILE(2) OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS ntl_qu,
	ROW_NUMBER() OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS rw_nb,
	DENSE_RANK() OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS rank_dense,
	RANK() OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS rank,
	COUNT(qu_sell) OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS qu_count,
	SUM(qu_sell) OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell
	ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING
	) AS total_qu2,
	SUM(qu_sell) OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell
	ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
	) AS total_qu1,
	AVG(qu_sell * 1.0) OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS avg_qu,
	SUM(qu_sell) OVER(PARTITION BY merchant_name, Brand_name ORDER BY Brand_name, qu_sell) AS total_qu,
	SUM(qu_sell) OVER(PARTITION BY merchant_name, Brand_name) AS total_merch_brand,
	SUM(qu_sell) OVER(PARTITION BY merchant_name) AS total_merch,
	SUM(qu_sell) OVER() AS total
FROM
(SELECT
	m.merchant_name,
	b.Brand_name,
	c.color_name,
	COUNT(*) AS qu_sell
FROM purchases p
LEFT JOIN phones f
	ON p.phone_id = f.phone_id
LEFT JOIN brands b
	ON f.brand_id = b.brand_id
LEFT JOIN merchants m
	ON p.merchant_id = m.merchant_id
LEFT JOIN colors c
	ON p.color_id = c.color_id
GROUP BY
	m.merchant_name,
	b.Brand_name,
	c.color_name) a
ORDER BY
	merchant_name,
	Brand_name,
	qu_sell*/


SELECT
	'Without shopping' AS col1,
	c.client_name,
	c.client_tlf,
	c.birth_date
FROM clients c
LEFT JOIN purchases p
	ON c.client_id = p.client_id
WHERE p.client_id IS NULL
UNION
SELECT
	'Shopping > 50 000' AS col1,
	c.client_name,
	c.client_tlf,
	c.birth_date
FROM clients c
WHERE EXISTS (SELECT
					*
			  FROM purchases p
			  WHERE c.client_id = p.client_id
				AND p.price >= 50000)
