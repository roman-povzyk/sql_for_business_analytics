-- task 12.1
SELECT
	ISNULL(battery_capacity, 0)
FROM phones


-- task 12.2
SELECT
	battery_capacity,
	CASE
		WHEN battery_capacity = 0 THEN 'no data'
		WHEN battery_capacity < 1000 THEN '0-1000'
		WHEN battery_capacity < 5000 THEN '1000-5000'
		WHEN battery_capacity < 10000 THEN '5000-10000'
		WHEN battery_capacity >= 10000 THEN '>10000'
		ELSE 'unknown'
		END AS data_bc
FROM phones


-- task 12.4
SELECT
	conn_type0,
	conn_type01,
	conn_type2,
	conn_type3,
	COALESCE(conn_type0,
			conn_type01,
			conn_type2,
			conn_type3) AS avg_coalesce
FROM phones


-- task 12.5
SELECT
	phone_name,
	main_camera
FROM phones
WHERE main_camera IS NOT NULL
	AND main_camera <> 0
