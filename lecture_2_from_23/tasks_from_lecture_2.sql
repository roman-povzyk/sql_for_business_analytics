-- task 2.1
SELECT
	brand_name,
	phone_name,
	sim,
	ram
FROM m_phones


-- task 2.2
SELECT
	DISTINCT sim
FROM m_phones


-- task 2.3
SELECT
	DISTINCT sim, ram
FROM m_phones
ORDER BY sim, ram


-- task 2.4
SELECT
	*
FROM clients

-- task 2.5
SELECT
	MIN(birth_date) AS min_birth_date,
	MAX(birth_date) AS max_birth_date	
FROM clients


-- task 2.6
SELECT
	COUNT(DISTINCT sim) AS distinct_sim,
	COUNT(DISTINCT ram) AS distinct_ram,
FROM m_phones

-- task 2.7
SELECT
	COUNT(sim) AS count_sim
FROM m_phones
WHERE sim IS NOT NULL

-- task 2.8
SELECT
	COUNT(ram)
FROM m_phones AS count_ram
WHERE ram IS NOT NULL
