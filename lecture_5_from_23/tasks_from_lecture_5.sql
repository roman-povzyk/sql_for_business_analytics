-- task 5.1
SELECT
	os, 
	COUNT(os) AS phone_numbers
FROM m_phones
GROUP BY os
ORDER BY COUNT(os) DESC


-- task 5.2
SELECT
	os,
	brand_name,
	MIN(price) AS min_price,
	MAX(price) AS max_price
FROM m_phones
GROUP BY os, brand_name
HAVING MIN(price) IS NOT NULL
	AND MAX(price) IS NOT NULL


-- task 5.3
SELECT
	battery_type,
	brand_name,
	AVG(price) AS avg_price,
	COUNT(*) AS amount
FROM m_phones
WHERE battery_capacity > 3000
GROUP BY 
	battery_type,
	brand_name
HAVING COUNT(*) >= 2
	AND AVG(price) IS NOT NULL


-- task 5.4
SELECT
	brand_name,
	battery_type,
	ram,
	COUNT(*) AS phone_numbers
FROM m_phones
WHERE (brand_name = 'huawei'
	OR brand_name = 'xiaomi')
	AND ram IN (4, 8)
GROUP BY
	brand_name,
	battery_type,
	ram
ORDER BY
	brand_name,
	battery_type,
	ram


-- task 5.5
SELECT
	brand_name,
	battery_type,
	ram,
	COUNT(*) AS phone_numbers
FROM m_phones
WHERE (brand_name = 'huawei'
	OR brand_name = 'xiaomi')
	AND ram IN (4, 8)
GROUP BY
	brand_name,
	battery_type,
	ram WITH CUBE
ORDER BY
	brand_name,
	battery_type,
	ram

-- task 5.6
SELECT
	brand_name,
	battery_type,
	ram,
	COUNT(*) AS phone_numbers
FROM m_phones
WHERE (brand_name = 'huawei'
	OR brand_name = 'xiaomi')
	AND ram IN (4, 8)
GROUP BY
	GROUPING SETS (brand_name,
	battery_type,
	ram)
ORDER BY
	brand_name,
	battery_type,
	ram

-- task 5.7
SELECT
	brand_name,
	phone_name,
	memory,
	price,
	COUNT(*) OVER(PARTITION BY memory) as count_by_memory,
	AVG(price) OVER(PARTITION BY memory) as avg_price_by_memory
FROM m_phones
WHERE brand_name = 'apple'
ORDER BY
	memory,
	price*/

-- task 5.8
SELECT
	brand_name,
	phone_name,
	memory,
	price,
	ROW_NUMBER() OVER(ORDER BY memory, price) AS row_number_1,
	ROW_NUMBER() OVER(ORDER BY price DESC) AS row_number_2
FROM m_phones
WHERE brand_name = 'samsung'
	AND price IS NOT NULL
ORDER BY
	memory,
	price