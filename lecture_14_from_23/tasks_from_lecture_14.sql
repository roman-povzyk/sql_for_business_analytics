-- task 14.1
SELECT
	phone_name
FROM phones
WHERE ISNUMERIC(SUBSTRING(phone_name, 1, 1)) = 1


-- task 14.2
SELECT
	CEILING(-12.35) AS ceiling_neg,
	CEILING(12.35) AS ceiling_pos,
	FLOOR(-12.35) AS floor_neg,
	FLOOR(12.35) AS floor_pos


-- task 14.3
SELECT
	*
FROM phone_price
WHERE ABS(price - 6000) <= 500


-- task 14.4
SELECT
	CASE
		WHEN a.random < 0.333 THEN 0
		WHEN a.random < 0.666 AND a.random >= 0.333 THEN 100
		ELSE 200
		END AS probability
FROM
(SELECT
	RAND() AS random) a


-- task 14.5
SELECT
	price,
	FORMAT(price, 'C', 'ua-ua') AS ua_c,
	FORMAT(price / 25, 'C', 'us-us') AS us_c,
	STR(price, 4, 1) AS string
FROM phone_price


-- task 14.6
SELECT
	CONVERT(NVARCHAR, 11111) AS conv,
	CONVERT(NVARCHAR, GETDATE(), 104)


-- task 14.7
SELECT
	GETDATE() AS date_1,
	CAST(GETDATE() AS smalldatetime) AS date_2,
	CAST(GETDATE() AS date) AS date_3,
	CAST(GETDATE() AS time) AS date_4,
	CAST(GETDATE() AS datetime2) AS date_5,
	CAST(GETDATE() AS datetimeoffset) AS date_6