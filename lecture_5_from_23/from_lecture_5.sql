SELECT COUNT(phone_name)
FROM m_phones


SELECT DISTINCT brand_name
FROM m_phones


SELECT brand_name,
		memory,
		COUNT(phone_name)
FROM m_phones
WHERE brand_name NOT IN ('apple', 'samsung')
		AND memory IS NOT NULL
GROUP BY brand_name, 
		memory WITH ROLLUP
HAVING COUNT(phone_name) > 10
ORDER BY brand_name,
		memory


SELECT brand_name,
		memory,
		COUNT(phone_name)
FROM m_phones
WHERE brand_name NOT IN ('apple', 'samsung')
		AND memory IS NOT NULL
GROUP BY brand_name, 
		memory WITH CUBE
HAVING COUNT(phone_name) > 10
ORDER BY brand_name,
		memory


SELECT brand_name,
		memory,
		COUNT(phone_name) AS q_t
FROM m_phones
WHERE brand_name NOT IN ('apple', 'samsung')
		AND memory IS NOT NULL
GROUP BY grouping sets (brand_name, 
		memory)
HAVING COUNT(phone_name) > 10
ORDER BY brand_name,
		memory


SELECT brand_name,
		phone_name,
		price,
		COUNT(phone_name) OVER() AS all_num,
		COUNT(phone_name) OVER(PARTITION BY brand_name),
		MAX(price) OVER(PARTITION BY brand_name),
		AVG(price) OVER(PARTITION BY brand_name)
FROM m_phones
WHERE memory = 256
		AND price IS NOT NULL
ORDER BY brand_name,
		price