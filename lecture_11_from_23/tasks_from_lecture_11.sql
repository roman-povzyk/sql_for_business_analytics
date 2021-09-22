-- task 11.1
SELECT
	os
FROM phones
WHERE os LIKE 'android v%'


-- task 11.2
SELECT
	os,
	CHARINDEX('.', os) AS place_1
FROM phones
WHERE os LIKE 'android v%'


-- task 11.3
SELECT
	os,
	CHARINDEX('.', os) AS place_1,
	CHARINDEX('v', os) AS place_2
FROM phones
WHERE os LIKE 'android v%'


-- task 11.4
SELECT
	os,
	CHARINDEX('.', os) AS place_1,
	CHARINDEX('v', os) AS place_2,
	SUBSTRING(os, CHARINDEX('v', os) + 1, CHARINDEX('.', os) - 1) AS place_3
FROM phones
WHERE os LIKE 'android v%'


-- task 11.5
SELECT
	os,
	CHARINDEX('.', os) AS place_1,
	CHARINDEX('v', os) AS place_2,
	SUBSTRING(os, CHARINDEX('v', os) + 1, CHARINDEX('.', os) - 1) AS place_3,
	SUBSTRING(os, CHARINDEX('.', os) + 1, 1) AS place_4
FROM phones
WHERE os LIKE 'android v%'


-- task 11.6
SELECT
	os,
	CHARINDEX('.', os) AS place_1,
	CHARINDEX('v', os) AS place_2,
	SUBSTRING(os, CHARINDEX('v', os) + 1, CHARINDEX('.', os) - 1) AS place_3,
	SUBSTRING(os, CHARINDEX('.', os) + 1, 1) AS place_4
FROM phones
WHERE os LIKE 'android v%'
ORDER BY 
	SUBSTRING(os, CHARINDEX('v', os) + 1, CHARINDEX('.', os) - 1),
	SUBSTRING(os, CHARINDEX('.', os) + 1, 1)


-- task 11.7
SELECT
	os,
	CHARINDEX('.', os) AS place_1,
	CHARINDEX('v', os) AS place_2,
	SUBSTRING(os, CHARINDEX('v', os) + 1, CHARINDEX('.', os) - 1) * 1 AS place_3,
	SUBSTRING(os, CHARINDEX('.', os) + 1, 1) * 1 AS place_4
FROM phones
WHERE os LIKE 'android v%'
ORDER BY 
	SUBSTRING(os, CHARINDEX('v', os) + 1, CHARINDEX('.', os) - 1),
	SUBSTRING(os, CHARINDEX('.', os) + 1, 1)


-- task 11.8
SELECT
	client_name
FROM clients
ORDER BY SUBSTRING(client_name, 1, 1)


-- task 11.9
SELECT
	client_name
FROM clients
WHERE SUBSTRING(client_name, 1, 5) = REVERSE(SUBSTRING(client_name, 1, 5))


-- task 11.10
SELECT
	os,
	REPLACE(os, 'v', 'version')
FROM phones
WHERE os LIKE 'android v%'