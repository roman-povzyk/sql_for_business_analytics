--select * from m_phones
--select distinct battery_type from m_phones
--select distinct body_type from m_phones
--select distinct battery_type, body_type from m_phones
--select brand_name, phone_name, memory, os from m_phones
--select * from clients

--select count(*) from m_phones

SELECT COUNT(brand_name),
		COUNT(DISTINCT body_type) 
FROM m_phones

SELECT MIN(price),
		MAX(price),
		AVG(price)
FROM m_phones