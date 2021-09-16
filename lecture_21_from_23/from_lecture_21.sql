SELECT
	*
FROM clients where client_name LIKE '%¸%'

SELECT
	*
FROM clients where client_name LIKE '%¸%'

SELECT
	*
FROM clients where client_name LIKE 'ë%'

SELECT
	name,
	description
FROM fn_helpcollations()
WHERE name like 'UKR%'

-- SELECT @@LANGUAGE

SELECT date_format
FROM sys.dm_exec_sessions
WHERE session_id = @@spid

-- SELECT DATEADD(mm, 1, '01.02.2020')

-- EXEC sp_helplanguage @@LANGUAGE

SELECT
	*
FROM sys.syslanguages

SELECT
	DATEADD(mm, 1, '01.02.2020'),
	DATEADD(mm, 1, '20200102')