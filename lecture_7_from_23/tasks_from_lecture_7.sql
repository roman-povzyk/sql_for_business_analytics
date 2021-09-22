-- task 7.1
SELECT
	*
FROM phones
JOIN phone_comment
	ON phones.phone_id = phone_comment.phone_id


-- task 7.2
SELECT
	*
FROM phones
LEFT JOIN phone_comment
	ON phones.phone_id = phone_comment.phone_id


-- task 7.3
SELECT
	*
FROM phones
RIGHT JOIN phone_comment
	ON phones.phone_id = phone_comment.phone_id


-- task 7.4
SELECT
	*
FROM phones
FULL JOIN phone_comment
	ON phones.phone_id = phone_comment.phone_id


-- task 7.5
SELECT
	colors.color_name,
	MAX(phone_price.price) AS max_color_price
FROM colors
JOIN phone_price
	ON colors.color_id = phone_price.color_id
GROUP BY
	colors.color_name
ORDER BY
	MAX(phone_price.price)


-- task 7.6
SELECT
	AVG(a.max_color_price) AS avg_max_color_price
FROM
(SELECT
	colors.color_name,
	MAX(phone_price.price) AS max_color_price
FROM colors
JOIN phone_price
	ON colors.color_id = phone_price.color_id
GROUP BY
	colors.color_name) a


-- task 7.7
SELECT
	*
FROM phone_price
WHERE phone_price.price > (SELECT
								MAX(price) AS max_price
							FROM phone_price
							WHERE merchant_id = 1)


-- task 7.8
SELECT
	*
FROM phone_price
WHERE price > ANY(SELECT
						price
					FROM phone_price
					WHERE merchant_id = 1)


-- task 7.9
SELECT
	*
FROM phone_price
WHERE price > ALL(SELECT
						price
					FROM phone_price
					WHERE merchant_id = 1)

