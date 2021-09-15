SELECT
	b.Brand_name,
	COUNT(*) as q_sell,
	SUM(s.price) as tot_grn
FROM purchases s
LEFT JOIN phones p
	ON s.phone_id = p.phone_id
LEFT JOIN brands b
	ON b.brand_id = p.brand_id
WHERE YEAR(s.date_purch) = 2019
GROUP BY b.Brand_name


SELECT
	b.Brand_name,
	COUNT(*) as q_sell,
	SUM(s.price) as tot_grn,
	SUM(CASE
			WHEN MONTH(s.date_purch) BETWEEN 1 AND 6 THEN s.price
			ELSE 0
			END) AS hy_1,
	SUM(CASE
			WHEN MONTH(s.date_purch) BETWEEN 7 AND 12 THEN s.price
			ELSE 0
			END) AS hy_2,
	ROUND(100 * (SUM(CASE
			WHEN MONTH(s.date_purch) BETWEEN 7 AND 12 THEN s.price
			ELSE 0
			END) / SUM(CASE
							WHEN MONTH(s.date_purch) BETWEEN 1 AND 6 THEN s.price
							ELSE 0
							END)) - 100, 2) AS dnm
FROM purchases s
LEFT JOIN phones p
	ON s.phone_id = p.phone_id
LEFT JOIN brands b
	ON b.brand_id = p.brand_id
WHERE YEAR(s.date_purch) = 2019
GROUP BY b.Brand_name


SELECT
	a.Brand_name,
	a.tot_brand,
	a.total,
	a.part_sell,
	a.part_ni,
	CASE
		WHEN a.part_ni <= 0.8 then 'A'
		WHEN a.part_ni >= 0.8 
			AND a.part_ni <= 0.95 then 'B'
		ELSE 'C'
		END AS category
FROM
(SELECT
	a.Brand_name,
	a.tot_brand,
	b.total,
	a.tot_brand / b.total AS part_sell,
	SUM(a.tot_brand / b.total) OVER(ORDER BY a.tot_brand / b.total DESC) AS part_ni
FROM 
(SELECT
	b.Brand_name,
	SUM(s.price) AS tot_brand
FROM purchases s
LEFT JOIN phones p
	ON s.phone_id = p.phone_id
LEFT JOIN brands b
	ON p.brand_id = b.brand_id
WHERE YEAR(s.date_purch) = 2019
	AND MONTH(s.date_purch) BETWEEN 1 AND 3
GROUP BY b.Brand_name) a,
(SELECT 
	SUM(price) AS total
FROM purchases
WHERE YEAR(date_purch) = 2019
	AND MONTH(date_purch) BETWEEN 1 AND 3) b
-- ORDER BY part_sell DESC
) a


SELECT
	a.Brand_name,
	a.m01,
	a.m02,
	a.m03,
	a.m04,
	a.m05,
	a.m06,
	a.tot_avg,
	SQRT((SQUARE(a.m01 - a.tot_avg) + SQUARE(a.m02 - a.tot_avg) + SQUARE(a.m03 - a.tot_avg) +
		SQUARE(a.m04 - a.tot_avg) + SQUARE(a.m05 - a.tot_avg) +SQUARE(a.m06 - a.tot_avg)) / 6) / a.tot_avg AS k_xyz,
	CASE
		WHEN SQRT((SQUARE(a.m01 - a.tot_avg) + SQUARE(a.m02 - a.tot_avg) + SQUARE(a.m03 - a.tot_avg) +
		SQUARE(a.m04 - a.tot_avg) + SQUARE(a.m05 - a.tot_avg) +SQUARE(a.m06 - a.tot_avg)) / 6) / a.tot_avg <= 0.1 
		THEN 'X'
		WHEN SQRT((SQUARE(a.m01 - a.tot_avg) + SQUARE(a.m02 - a.tot_avg) + SQUARE(a.m03 - a.tot_avg) +
		SQUARE(a.m04 - a.tot_avg) + SQUARE(a.m05 - a.tot_avg) +SQUARE(a.m06 - a.tot_avg)) / 6) / a.tot_avg <= 0.25
		THEN 'Y'
		ELSE 'Z'
		END AS category
FROM 
(SELECT
	b.Brand_name,
	SUM(IIF(MONTH(s.date_purch) = 1, 1, 0)) AS m01,
	SUM(IIF(MONTH(s.date_purch) = 2, 1, 0)) AS m02,
	SUM(IIF(MONTH(s.date_purch) = 3, 1, 0)) AS m03,
	SUM(IIF(MONTH(s.date_purch) = 4, 1, 0)) AS m04,
	SUM(IIF(MONTH(s.date_purch) = 5, 1, 0)) AS m05,
	SUM(IIF(MONTH(s.date_purch) = 6, 1, 0)) AS m06,
	COUNT(*) AS tot,
	COUNT(*) / 6 as tot_avg
FROM purchases s
LEFT JOIN phones p
	ON p.phone_id = s.phone_id
LEFT JOIN brands b
	ON b.brand_id = p.brand_id
WHERE YEAR(s.date_purch) = 2019
	AND MONTH(s.date_purch) BETWEEN 1 AND 6
GROUP BY b.Brand_name
HAVING COUNT(*) / 6 <> 0) a
ORDER BY k_xyz


SELECT
	a.merchant_name,
	COUNT(a.phone_id) AS qu_t,
	SUM(a.tot_pr) AS tot_pr,
	SUM(q_s) AS q_s,
	SUM(a.tot_pr) / SUM(q_s) AS avg_check
FROM (
SELECT 
	m.merchant_name,
	s.phone_id,
	SUM(s.price) AS tot_pr,
	COUNT(*) AS q_s	
FROM purchases s
LEFT JOIN merchants m
	ON s.merchant_id = m.merchant_id
WHERE YEAR(s.date_purch) = 2019
	AND MONTH(s.date_purch) BETWEEN 1 AND 6
GROUP BY 
	m.merchant_name,
	s.phone_id) a
GROUP BY a.merchant_name
ORDER BY qu_t DESC


SELECT
	m.merchant_name,
	SUM(s.price) AS tot,
	SUM(IIF(MONTH(s.date_purch) = 1, s.price, 0)) AS m01,
	SUM(IIF(MONTH(s.date_purch) = 2, s.price, 0)) AS m02,
	SUM(IIF(MONTH(s.date_purch) = 3, s.price, 0)) AS m03,
	SUM(IIF(MONTH(s.date_purch) = 4, s.price, 0)) AS m04,
	SUM(IIF(MONTH(s.date_purch) = 5, s.price, 0)) AS m05,
	SUM(IIF(MONTH(s.date_purch) = 6, s.price, 0)) AS m06,
	SUM(IIF(MONTH(s.date_purch) = 7, s.price, 0)) AS m07,
	SUM(IIF(MONTH(s.date_purch) = 8, s.price, 0)) AS m08,
	SUM(IIF(MONTH(s.date_purch) = 9, s.price, 0)) AS m09,
	SUM(IIF(MONTH(s.date_purch) = 10, s.price, 0)) AS m10,
	SUM(IIF(MONTH(s.date_purch) = 11, s.price, 0)) AS m11,
	SUM(IIF(MONTH(s.date_purch) = 12, s.price, 0)) AS m12
FROM purchases s
LEFT JOIN merchants m
	ON s.merchant_id = m.merchant_id
WHERE YEAR(s.date_purch) = 2019
GROUP BY m.merchant_name


SELECT
	b.Brand_name,
	COUNT(*) AS q_sell,
	SUM(s.price) AS tot_grn
FROM purchases s
LEFT JOIN phones p
	ON s.phone_id = p.phone_id
LEFT JOIN brands b
	ON p.brand_id = b.brand_id
WHERE YEAR(s.date_purch) = 2019
	AND MONTH(s.date_purch) BETWEEN 10 AND 12
GROUP BY b.Brand_name
-- ORDER BY COUNT(*) DESC
ORDER BY SUM(s.price) DESC