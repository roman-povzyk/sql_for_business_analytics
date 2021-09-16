-- task 4.1
SELECT
	*
FROM m_phones
WHERE body_type = 'раскладной'


-- task 4.2
SELECT
	*
FROM m_phones
WHERE body_type = 'раскладной'
	OR body_type = 'слайдер'


-- task 4.3
SELECT
	*
FROM m_phones
WHERE body_type = 'раскладной'
	AND battery_capacity > 1000


-- task 4.4
SELECT
	*
FROM m_phones
WHERE body_type = 'раскладной'
	AND battery_capacity <= 750


-- task 4.5
SELECT
	*
FROM m_phones
WHERE body_type = 'раскладной'
	AND battery_capacity BETWEEN 800 AND 1000


-- task 4.6
SELECT
	*
FROM m_phones
WHERE body_type = 'раскладной'
	AND battery_capacity IN (600, 1500)


-- task 4.7
SELECT
	*
FROM m_phones
WHERE body_type = 'раскладной'
	AND brand_name LIKE 'n%'


-- task 4.8
SELECT
	 *
FROM m_phones
WHERE body_type = 'раскладной'
	AND price IS NOT NULL


-- task 4.9
SELECT
	*
FROM m_phones
WHERE (body_type = 'раскладной'
	OR body_type = 'слайдер')
	AND battery_capacity = 1000


-- task 4.10
SELECT
	*
FROM m_phones
WHERE (body_type = 'раскладной'
	AND battery_capacity = 1000)
	OR memory = 4


-- task 4.11
SELECT
	*
FROM m_phones
WHERE body_type = 'раскладной'
	AND (battery_capacity = 1000
	OR memory = 4)


-- task 4.12
SELECT
	TOP 4 *
FROM m_phones
WHERE body_type = 'раскладной'
ORDER BY battery_capacity DESC


-- task 4.13
SELECT
	TOP 15 PERCENT *
FROM m_phones
WHERE body_type = 'раскладной'
ORDER BY battery_capacity DESC


-- task 4.14
SELECT
	*
FROM m_phones
WHERE body_type = 'раскладной'
ORDER BY battery_capacity DESC
OFFSET 2 ROWS 
FETCH NEXT 4 ROWS ONLY