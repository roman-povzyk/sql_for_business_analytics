-- task 8.1
SELECT
	brands.*,
	colors.*
FROM brands,
	colors
WHERE brands.brand_id = 1


-- task 8.2
SELECT
	brands.*,
	colors.*
FROM brands,
	colors
WHERE colors.color_id = 1


-- task 8.3
SELECT
	*
FROM phones
WHERE phone_id IN (SELECT
						phone_id
					FROM phone_comment
					WHERE enthusiastic > 100)


-- task 8.4
SELECT
	*
FROM phones
WHERE EXISTS(SELECT
				phone_id
			FROM phone_comment
			WHERE enthusiastic > 100)


-- task 8.5
SELECT
	brand_name
FROM brands
WHERE brand_id = 1
UNION
SELECT
	merchant_name
FROM merchants
WHERE merchant_id = 1
UNION
SELECT
	color_name
FROM colors
WHERE color_id = 1


-- task 8.6
SELECT
	phone_id,
	color_id
FROM phone_price
WHERE merchant_id = 1
INTERSECT
SELECT
	phone_id,
	color_id
FROM phone_price
WHERE merchant_id = 8


-- task 8.7
SELECT
	phone_id,
	color_id
FROM phone_price
WHERE merchant_id = 1
EXCEPT
SELECT
	phone_id,
	color_id
FROM phone_price
WHERE merchant_id = 8