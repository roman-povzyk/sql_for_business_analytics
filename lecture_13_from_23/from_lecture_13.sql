SELECT 
	b.Brand_name,
	COUNT(*) AS qu_sell,
	SUM(s.price) as tot_grn
FROM purchases s
LEFT JOIN phones p
	ON s.phone_id = p.phone_id
LEFT JOIN brands b
	ON p.brand_id = b.brand_id
WHERE s.phone_id = 916472 
	AND s.color_id = 17
	AND YEAR(s.date_purch) = 2019
	AND MONTH(s.date_purch) BETWEEN 10 AND 12
	AND DATEPART(qq, s.date_purch) = 4
GROUP BY
	b.Brand_name


SELECT
	c.client_name,
	m.merchant_name,
	p.date_purch
FROM purchases p
LEFT JOIN merchants m
	ON p.merchant_id = m.merchant_id
LEFT JOIN clients c
	ON p.client_id = c.client_id
WHERE p.phone_id = 916472
	AND p.color_id = 17
	-- AND p.date_purch >= DATEFROMPARTS(2019, 2, 2)
	-- AND p.date_purch < DATEFROMPARTS(2019, 2, 28)
	AND p.date_purch <= DATETIMEFROMPARTS(2019, 2, 28, 23, 59, 59, 999)
ORDER BY date_purch


SELECT GETDATE() AS c_d,
	EOMONTH(GETDATE()) AS last_d,
	DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1) AS first_date,
	DATENAME(mm, GETDATE()) AS name_month


SELECT 
	client_name,
	birth_date,
	client_tlf
	--DATEADD(DAY, 5, GETDATE())
FROM clients
WHERE DAY(birth_date) = DAY(DATEADD(DAY, 5, GETDATE()))
	AND MONTH(birth_date) = DAY(DATEADD(DAY, 5, GETDATE()))


SELECT
	client_id,
	COUNT(price) as qu_sell,
	MIN(date_purch) as min_date,
	MAX(date_purch) as last_date,
	DATEDIFF(dd, MIN(date_purch), MAX(date_purch)) as days_diff
FROM purchases
WHERE YEAR(date_purch) = 2019
GROUP BY client_id
HAVING COUNT(price) = 2


SELECT 
	GETDATE() AS curr_date,
	DATEADD(dd, datediff(dd, 0, GETDATE()), 0) AS trunc_d,
	DATEDIFF(dd, 0, GETDATE()) AS dd,
	DATEADD(dd, (-1)*datediff(dd, 0, GETDATE()), GETDATE()),
	DATEADD(mm, datediff(mm, 0, GETDATE()), 0) AS trunc_m,
	DATEADD(yy, datediff(yy, 0, GETDATE()), 0) AS trunc_y
