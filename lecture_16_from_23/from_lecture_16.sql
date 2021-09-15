SELECT
	*
FROM new_phone_price
WHERE phone_id = 100001


INSERT INTO new_phone_price (phone_id, color_id, merchant_id, price)
VALUES(100001, 44, 9, 1111)


INSERT INTO new_phone_price (phone_id, color_id, merchant_id, price)
SELECT
	p.phone_id,
	23,
	77,
	CASE
		WHEN p.phone_id = 157759 THEN 8877
		WHEN p.phone_id = 157763 THEN 6655
		ELSE 0
		END AS pr
FROM phones p
WHERE NOT EXISTS (SELECT *				
				FROM phone_price r
				WHERE p.phone_id = r.phone_id)
				AND p.brand_id = 5


SELECT *
FROM new_phone_price
WHERE phone_id IN (157759, 157763)


UPDATE new_phone_price
SET price = price - 10
WHERE phone_id IN (157759, 157763)


SELECT *
FROM new_phone_price
WHERE phone_id IN (157759, 157763)


SELECT
	p.*,
	s.*
FROM new_phone_price p
JOIN stock s
	ON p.phone_id = s.phone_id
	AND p.merchant_id = s.merchant_id
	AND p.color_id = s.color_id
WHERE s.amount = 199


UPDATE p
SET p.price = p.price - 0.5
FROM new_phone_price p
JOIN stock s
	ON p.phone_id = s.phone_id
	AND p.merchant_id = s.merchant_id
	AND p.color_id = s.color_id
WHERE s.amount = 199


SELECT
	p.*,
	(SELECT MIN(r.price) 
	FROM new_phone_price r
	WHERE p.phone_id = r.phone_id)
FROM new_phone_price p
WHERE p.price - FLOOR(p.price) = 0.5


UPDATE new_phone_price
SET new_phone_price.price = (SELECT MIN(r.price) 
							FROM new_phone_price r
							WHERE new_phone_price.phone_id = r.phone_id)
WHERE new_phone_price.price - FLOOR(new_phone_price.price) = 0.5


SELECT
	*
FROM new_phone_price
WHERE merchant_id = 1
	AND color_id = 20
ORDER BY price DESC


DELETE FROM new_phone_price
WHERE merchant_id = 1
	AND color_id = 20
	AND phone_id = 1500327


SELECT *
FROM new_phone_price n
WHERE EXISTS (SELECT *
				FROM
					(SELECT 
						*
					FROM phone_price
					WHERE merchant_id = 1
						AND color_id = 20) a
				WHERE n.phone_id = a.phone_id
					AND n.merchant_id = a.merchant_id
					AND n.color_id = a.color_id)


DELETE FROM p
FROM new_phone_price p
JOIN (SELECT TOP 2 *
		FROM phone_price
		WHERE merchant_id = 1
			AND color_id = 20
		ORDER BY price DESC) a
	ON p.phone_id = a.phone_id
		AND p.merchant_id = a.merchant_id
		AND p.color_id = a.color_id


SELECT
	n.*,
	p.phone_name
FROM new_phone_price n
JOIN phones p
	ON n.phone_id = p.phone_id
WHERE p.brand_id = 5
	AND n.color_id = 18
	AND n.merchant_id = 7


BEGIN TRANSACTION
DELETE FROM n
FROM new_phone_price n
JOIN phones p
	ON n.phone_id = p.phone_id
WHERE p.brand_id = 5
	AND n.color_id = 18
	AND n.merchant_id = 7

-- COMMIT TRANSACTION

-- ROLLBACK TRANSACTION 