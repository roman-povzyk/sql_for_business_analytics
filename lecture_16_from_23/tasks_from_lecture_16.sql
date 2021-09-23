-- task 16.1
SELECT
	*
FROM new_phone_price
WHERE price = 2222

INSERT INTO new_phone_price (price, merchant_id, color_id, phone_id)
VALUES (2222, 55, 19, 10002)

-- task 16.2
INSERT INTO new_phone_price (phone_id, color_id, merchant_id, price)
SELECT
	1,
	19,
	55,
	1000
FROM phones
FULL JOIN phone_price
	ON phones.phone_id = phone_price.phone_id
WHERE phone_price.phone_id IS NULL
	AND brand_id = 6*/

/*SELECT
	*
FROM new_phone_price
WHERE phone_id = 1*/

-- task 16.3
/*UPDATE new_phone_price
SET price = price - 100
WHERE phone_id = 1*/


-- task 16.4
/*UPDATE new_phone_price
SET price = price - 10
SELECT
	*
FROM new_phone_price
JOIN stock
	ON new_phone_price.phone_id = stock.phone_id
WHERE stock.amount = 1*/

/*SELECT
	*
FROM new_phone_price
JOIN stock
	ON new_phone_price.phone_id = stock.phone_id
WHERE stock.amount = 1


-- task 16.6
DELETE FROM new_phone_price
WHERE merchant_id = 2
	AND color_id = 20

SELECT
	*
FROM new_phone_price
WHERE merchant_id = 2
	AND color_id = 20