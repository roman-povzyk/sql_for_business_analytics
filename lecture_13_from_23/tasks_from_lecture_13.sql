-- task 13.1
SELECT
	*
FROM clients
WHERE YEAR(birth_date) = 2000
	OR YEAR(birth_date) = 2001
ORDER BY
	MONTH(birth_date),
	DAY(birth_date)


-- task 13.2
SELECT
	DATEPART(quarter, birth_date) AS bd_quarter,
	COUNT(*) AS num_clients
FROM clients
WHERE YEAR(birth_date) BETWEEN 1990 AND 1995
GROUP BY
	DATEPART(quarter, birth_date)
ORDER BY
	DATEPART(quarter, birth_date)


-- task 13.3
SELECT
	*
FROM purchases
WHERE date_purch BETWEEN '2019-08-20 15:00' AND '2019-08-21 09:00'
ORDER BY
	date_purch


-- task 13.4
SELECT
	*
FROM purchases p
LEFT JOIN clients c
	ON p.client_id = c.client_id
WHERE MONTH(p.date_purch) = MONTH(c.birth_date)
	AND DAY(p.date_purch) = DAY(c.birth_date)


-- task 13.5
SELECT
	p.*,
	c.*,
	YEAR(p.date_purch) - YEAR(c.birth_date) AS year_diff
FROM purchases p
LEFT JOIN clients c
	ON p.client_id = c.client_id
WHERE MONTH(p.date_purch) = MONTH(c.birth_date)
	AND DAY(p.date_purch) = DAY(c.birth_date)


-- task 13.6
SELECT
	DATETIMEFROMPARTS(2019, 8, 31, 23, 59, 59, 999),
	DATETIMEFROMPARTS(2019, 8, 31, 23, 59, 59, 998),
	DATEDIFF(millisecond, DATETIMEFROMPARTS(2019, 8, 31, 23, 59, 59, 999), DATETIMEFROMPARTS(2019, 8, 31, 23, 59, 59, 998))


-- task 13.7
SELECT
	GETDATE() AS today_date,
	DATEADD(DAY, -21, GETDATE()) AS first_date_this_month,
	DATEADD(DAY, 9, GETDATE()) AS firts_date_next_month