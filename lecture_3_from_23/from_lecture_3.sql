SELECT MIN(price),
		MAX(price),
		AVG(price),
		SUM(price),
		COUNT(price)
FROM m_phones




SELECT COUNT(phone_name) AS ʳ������_������,
		SUM(price) AS ����_���,
		AVG(price) AS �������_����,
		COUNT(price) AS ʳ������_��������_�_�����,
		SUM(price)/COUNT(phone_name),
		SUM(price)/COUNT(price)
FROM m_phones




SELECT brand_name,
		phone_name,
		heigh * width * thickness AS volume
FROM m_phones




SELECT *
FROM m_phones
ORDER BY brand_name DESC,
		memory DESC




SELECT brand_name,
		phone_name,
		weight,
		price,
		ROUND(price/weight, 2) AS price_gr
FROM m_phones
ORDER BY price_gr DESC