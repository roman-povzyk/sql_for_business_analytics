DECLARE @my_date DATETIME
DECLARE @my_named NCHAR(12)

SET @my_date = GETDATE()

print(@my_named)

CREATE FUNCTION my_dayweek(@my_date DATETIME)
RETURNS NCHAR(15)
BEGIN
	IF DATEPART(dw, @my_date) = 1 RETURN 'Monday'
	IF DATEPART(dw, @my_date) = 2 RETURN 'Tuesday'
	IF DATEPART(dw, @my_date) = 3 RETURN 'Wednesday'
	IF DATEPART(dw, @my_date) = 4 RETURN 'Thursday'
	IF DATEPART(dw, @my_date) = 5 RETURN 'Friday'
	IF DATEPART(dw, @my_date) = 6 RETURN 'Saturday'
	IF DATEPART(dw, @my_date) = 7 RETURN 'Sunday'
	RETURN '***'
END

SELECT
	a.*,
	dbo.my_dayweek(date_purch) AS day_week_1,
	DATENAME(DW, a.date_purch) AS day_week_2
FROM purchases a

ALTER FUNCTION my_dayweek(@tp_ret TINYINT, @my_date DATETIME)
RETURNS NCHAR(15)
BEGIN
IF @tp_ret = 1
	BEGIN
		IF DATEPART(dw, @my_date) = 1 RETURN 'Monday'
		IF DATEPART(dw, @my_date) = 2 RETURN 'Tuesday'
		IF DATEPART(dw, @my_date) = 3 RETURN 'Wednesday'
		IF DATEPART(dw, @my_date) = 4 RETURN 'Thursday'
		IF DATEPART(dw, @my_date) = 5 RETURN 'Friday'
		IF DATEPART(dw, @my_date) = 6 RETURN 'Saturday'
		IF DATEPART(dw, @my_date) = 7 RETURN 'Sunday'
	END
IF @tp_ret = 2
	BEGIN
		IF DATEPART(dw, @my_date) = 1 RETURN 'Monday_2'
		IF DATEPART(dw, @my_date) = 2 RETURN 'Tuesday_2'
		IF DATEPART(dw, @my_date) = 3 RETURN 'Wednesday_2'
		IF DATEPART(dw, @my_date) = 4 RETURN 'Thursday_2'
		IF DATEPART(dw, @my_date) = 5 RETURN 'Friday_2'
		IF DATEPART(dw, @my_date) = 6 RETURN 'Saturday_2'
		IF DATEPART(dw, @my_date) = 7 RETURN 'Sunday_2'
	END
	RETURN '***'
END

CREATE FUNCTION cl_birthday(@month_n TINYINT, @day_n TINYINT) RETURNS TABLE
RETURN SELECT
			client_id, 
			client_name,
			client_tlf,
			birth_date
		FROM clients
		WHERE month(birth_date) = @month_n
			AND DAY(birth_date) = @day_n

SELECT
	*
FROM dbo.cl_birthday(2, 29)

SELECT *
FROM purchases p
JOIN dbo.cl_birthday(2, 29) c
	ON p.client_id = c.client_id

CREATE FUNCTION my_period(@begin_date, @end_date)
RETURN @month_period
TABLE(p_year SMALLINT, p_month TINYINT)
BEGIN
	DECLARE @cur_date DATE
	SET @cur_date = @begin_date
	WHILE DATEDIFF(mm, @cur_date, @end_date) >= 0
		BEGIN
		INSERT INTO @month_period(p_year, p_month)
		VALUES(year(@cur_date), month(@cur_date))
		SET @cur_date = DATEADD(mm, 1, @cur_date)
		END
		RETURN
END

SELECT
	MONTH(date_purch) as mp,
	COUNT(price) AS qu
FROM purchases
WHERE date_purch BETWEEN DATETIMEFROMPARTS(2019, 1, 1, 0, 0, 0, 0)
							AND DATETIMEFROMPARTS(2019, 12, 31, 23, 59, 59, 999)
							AND phone_id = 161337
							AND merchant_id = 10
GROUP BY MONTH(date_purch)
ORDER BY MONTH(date_purch)

CREATE PROCEDURE add_purch @v_phone_id INT,
							@v_color_id TINYINT,
							@v_merchant_id TINYINT,
							@v_client_id INT,
							@v_price NUMERIC(18, 0)
AS
INSERT INTO purchases(phone_id, 
						color_id, 
						merchant_id, 
						client_id, 
						price, 
						date_purch)
VALUES(@v_phone_id,
		@v_color_id, 
		@v_merchant_id,
		@v_client_id,
		@v_price,
		GETDATE())

SELECT
	*
FROM purchases
WHERE phone_id = 161337
	AND color_id = 23
	AND merchant_id = 10
ORDER BY date_purch DESC

-- EXEC dbo.add_purch 161337, 23, 10, 1, 1111

CREATE TRIGGER TR_purchases_insert
	ON purchases
AFTER INSERT
AS 
UPDATE s SET s.amount = s.amount - 1
FROM stock s
JOIN inserted i
	ON s.phone_id = i.phone_id
		AND s.color_id = i.color_id
		AND s.merchant_id = i.merchant_id

SELECT
	*
FROM stock
WHERE phone_id = 161337
	AND color_id = 23
	AND merchant_id = 10

-- EXEC dbo.add_purch 161337, 23, 10, 1, 1112