SELECT
	ISNUMERIC('2ee')


SELECT
	phone_name,
	review,
	PATINDEX('%20__ �%', review) AS c_p,
	PATINDEX('%2_____%', review) AS c_p1,
	-- SUBSTRING(review, PATINDEX('%20__ �%', review), 4) AS str1
	SUBSTRING(review, PATINDEX('%2_____%', review), 4) AS str1
FROM phones
WHERE review IS NOT NULL
	AND PATINDEX('%20__ �%', review) = 0
	AND PATINDEX('%2_____%', review) <> 0
	AND ISNUMERIC(SUBSTRING(review, PATINDEX('%2_____%', review), 4)) = 1


SELECT 
	phone_id,
	price,
	ABS(price - 3000) AS abs_diff,
	price / 25 AS monthly_pay
FROM phone_price
WHERE price <= 3100 
	AND price >= 2900


SELECT
	phone_id,
	price,
	ABS(price - 3000) AS abs_diff,
	RAND() AS random,
	(price - 2900) / 200 AS null_price,
	price / 25 AS monthly_pay,
	CEILING(price / 25) AS ce,
	FLOOR(price / 25) AS fl
FROM phone_price
WHERE price <= 3100
	AND price >= 2900
	AND CEILING(price / 25) = FLOOR(price / 25)
ORDER BY price


SELECT
	DATEADD(mm, 2, '01.02.2018'),
	CONCAT(DATEADD(mm, 2, '01.02.2018'), ' text') AS date_txt,
	CONCAT(DATEADD(mm, 2, '01.02.2018'), 2) AS date_n,
	2 + 2 as four_1,
	'2' + 2 as four_2,
	CONCAT('2', 2) AS four_3,
	'22' / 4 as res_1,
	22.0 / 4 as res_2,
	--'22.0' / 4 as res_3


SELECT
	CAST('123' AS numeric(7, 4)) AS cs1,
	CAST('123.4588' AS numeric(7, 4)) AS cs2,
	CAST('123.4588' AS numeric(7, 2)) AS cs3,
	-- CAST('123.4588' AS numeric(6, 4)) AS cs4
	-- CAST('123.4588' AS int) AS cs5
	CAST('123' AS int) AS cs6,
	CAST(123.4588 AS int) AS cs7,
	CAST('123.4588' AS float(1)) AS cs8,
	CAST('5123.4588' AS float(1)) AS cs9,
	CAST('65123.4588' AS float(1)) AS cs10,
	CONVERT(numeric(7, 4), '123.4567') AS con_1


SELECT
	'*' + STR(123.4567) + '*' AS str1,
	STR(123.4567, 7, 4) AS str2,
	STR(123.4567, 2) AS str3,
	CAST(123.4588 AS NVARCHAR) AS cs1,
	CONVERT(NVARCHAR, 123.4588) AS con1


SELECT
	GETDATE(),
	CAST(GETDATE() AS NVARCHAR) AS cs1,
	CONVERT(NVARCHAR, GETDATE()) AS con1,
	CONVERT(NVARCHAR, GETDATE(), 1) AS con2,
	CONVERT(NVARCHAR, GETDATE(), 101) AS con3,
	CONVERT(NVARCHAR, GETDATE(), 2) AS con4,
	CONVERT(NVARCHAR, GETDATE(), 102) AS con5,
	CONVERT(NVARCHAR, GETDATE(), 3) AS con4,
	CONVERT(NVARCHAR, GETDATE(), 103) AS con5,
	CONVERT(NVARCHAR, GETDATE(), 3) AS con6,
	CONVERT(NVARCHAR, GETDATE(), 103) AS con7


SELECT
	CAST('01.02.2020' AS DATE) AS cs1,
	CAST('01.02.2020' AS DATETIME) AS cs2,
	CONVERT(DATE, '01.02.20', 1) AS con1,
	CONVERT(DATE, '01.02.2020', 101) AS con2,
	CONVERT(DATE, '01.02.2020', 104) AS con3


SELECT
	FORMAT(GETDATE(), 'd', 'en-US') AS 'US_date',
	FORMAT(GETDATE(), 'd', 'de-de') AS 'GER_date',
	FORMAT(GETDATE(), 'D', 'en-US') AS 'US_date',
	FORMAT(GETDATE(), 'D', 'de-de') AS 'GER_date',
	FORMAT(GETDATE(), 'D', 'ru-ru') AS 'RU_date',
	FORMAT(112263.225, 'N', 'en-US') AS N_EN,
	FORMAT(112263.225, 'C', 'en-US') AS C_EN,
	FORMAT(112263.225, 'C', 'ua-ua') AS C_UA
