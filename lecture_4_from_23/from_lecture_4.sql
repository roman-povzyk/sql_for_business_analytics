SELECT MIN(price),
		MAX(price),
		AVG(price),
		SUM(price),
		COUNT(price)
FROM m_phones


SELECT COUNT(phone_name) AS Кількість_товарів,
		SUM(price) AS Сума_цін,
		AVG(price) AS Середня_ціна,
		COUNT(price) AS Кількість_телефонів_з_ціною,
		SUM(price)/COUNT(phone_name),
		SUM(price)/COUNT(price)
FROM m_phones


SELECT brand_name,
		phone_name,
		heigh * width * thickness AS volume
FROM m_phones


SELECT *
FROM m_phones
ORDER BY brand_name DESC,
		memory DESC


SELECT brand_name,
		phone_name,
		weight,
		price,
		ROUND(price/weight, 2) AS price_gr
FROM m_phones
ORDER BY price_gr DESC


SELECT *
FROM m_phones
WHERE brand_name LIKE 's%'
ORDER BY memory


SELECT *
FROM m_phones
WHERE phone_name LIKE '%pro%'
ORDER BY memory


SELECT *
FROM m_phones
WHERE os LIKE 'android v [78]%'
ORDER BY memory


SELECT *
FROM m_phones
WHERE os LIKE 'android v [^8]%'
ORDER BY os


SELECT *
FROM m_phones
WHERE NOT brand_name IN ('apple', 'samsung')
ORDER BY brand_name


SELECT *
FROM m_phones
WHERE NOT (memory BETWEEN 128 AND 512)
ORDER BY memory


SELECT *
FROM m_phones
WHERE price IS NOT NULL
ORDER BY price


SELECT *
FROM m_phones
WHERE main_camera IS NULL
ORDER BY price


SELECT *
FROM m_phones
WHERE brand_name = 'samsung' 
		AND memory BETWEEN 128 AND 512
		AND ram = 8
ORDER BY memory


SELECT *
FROM m_phones
WHERE (brand_name = 'Nokia' 
		OR memory > 256)
		AND memory IS NOT NULL
ORDER BY memory


SELECT TOP 10 PERCENT brand_name, 
			phone_name, 
			price
FROM m_phones
WHERE brand_name = 'samsung'
		AND price IS NOT NULL
ORDER BY price
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY