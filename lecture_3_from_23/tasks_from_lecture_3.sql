-- task 3.1
SELECT
	brand_name,
	phone_name,
	ram,
	price
FROM m_phones
ORDER BY price


-- task 3.2
SELECT
	brand_name,
	phone_name,
	ram,
	price
FROM m_phones
ORDER BY ram DESC


-- task 3.3
SELECT
	brand_name,
	phone_name,
	ram,
	price
FROM m_phones
ORDER BY 
	ram DESC,
	price


-- task 3.4
SELECT
	brand_name,
	phone_name,
	ram,
	price
FROM m_phones
ORDER BY 
	price,
	ram DESC


-- task 3.5
SELECT
	brand_name,
	phone_name,
	battery_capacity,
	weight,
	battery_capacity / weight AS battery_weight_capacity
FROM m_phones
ORDER BY battery_capacity / weight DESC


-- task 3.6
SELECT
	brand_name,
	phone_name,
	battery_capacity,
	weight,
	battery_capacity / weight AS battery_weight_capacity
FROM m_phones
ORDER BY battery_weight_capacity DESC


-- task 3.7
SELECT
	brand_name,
	phone_name,
	battery_capacity,
	weight,
	ROUND(battery_capacity / weight, 0) AS battery_weight_capacity
FROM m_phones
ORDER BY battery_weight_capacity DESC


-- task 3.8
SELECT
	MIN(weight) AS min_weight,
	MAX(weight) AS max_weight,
	AVG(weight) AS avg_weight,
	SUM(weight) / COUNT(weight) AS sum_count_weight,
	SUM(weight) / COUNT(*) AS sum_count_result
FROM m_phones


-- task 3.9
SELECT
	brand_name,
	phone_name,
	ROUND(battery_capacity / weight, 2) AS battery_weight_capacity
FROM m_phones
ORDER BY battery_weight_capacity