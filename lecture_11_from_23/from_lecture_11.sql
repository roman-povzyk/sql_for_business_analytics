SELECT
	phone_name,
	memory,
	CHARINDEX('GB', phone_name) AS p_gb,
	SUBSTRING(phone_name, 1, CHARINDEX('GB', phone_name) - 1) AS t_ss,
	REVERSE(SUBSTRING(phone_name, 1, CHARINDEX('GB', phone_name) - 1)) as r_ss,
	CHARINDEX(' ', REVERSE(SUBSTRING(phone_name, 1, CHARINDEX('GB', phone_name) - 1))) as p_bl,
	LEFT(REVERSE(SUBSTRING(phone_name, 1, CHARINDEX('GB', phone_name) - 1)), CHARINDEX(' ', REVERSE(SUBSTRING(phone_name, 1, CHARINDEX('GB', phone_name) - 1)))-1) AS t_rgb,
	REVERSE(LEFT(REVERSE(SUBSTRING(phone_name, 1, CHARINDEX('GB', phone_name) - 1)), CHARINDEX(' ', REVERSE(SUBSTRING(phone_name, 1, CHARINDEX('GB', phone_name) - 1)))-1)) as gb,
	RIGHT(RTRIM(phone_name), 10) AS r_ight
FROM phones
WHERE memory IS NULL
	AND CHARINDEX('GB', phone_name) <> 0


SELECT
	phone_name,
	review,
	PATINDEX('%20__ �%', review) AS c_p,
	SUBSTRING(review, PATINDEX('%20__ �%', review), 4) AS rev_year
FROM phones
WHERE review IS NOT NULL
	AND PATINDEX('%20__ �%', review) <> 0


SELECT
	b.Brand_name,
	f.phone_name,
	CONCAT(UPPER(TRIM(b.Brand_name)), SPACE(1), f.phone_name) AS c_s,
	LOWER(b.brand_name) as l_s
FROM phones f
LEFT JOIN brands b
	ON f.brand_id = b.brand_id


SELECT
	color_name,
	SUBSTRING(color_name, 2, len(color_name)-1) AS s2,
	UPPER(LEFT(color_name, 1)),
	CONCAT(UPPER(LEFT(color_name, 1)), SUBSTRING(color_name, 2, len(color_name)-1)) AS upp_s
FROM colors


SELECT
	resolution,
	REPLACE(resolution, '�', ' �� ') as new_r
FROM phones
WHERE resolution IS NOT NULL


SELECT
	phone_name,
	battery_type,
	LEN(battery_type) AS l1,
	LEN(LTRIM(battery_type)) AS l2,
	CONCAT(battery_type, '***') AS b_a,
	LEN(CONCAT(LTRIM(battery_type), '***')) AS l3,
	LEN(review) as l_rvw
FROM phones
WHERE review IS NOT NULL
ORDER BY l_rvw DESC