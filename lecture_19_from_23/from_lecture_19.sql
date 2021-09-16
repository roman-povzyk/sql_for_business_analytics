/*USE P_STORE
GO
DECLARE @cur_year INT -- Year
DECLARE @qu_ph INT -- Amount of phone sells in 2019
DECLARE @cur_ph_id INT -- Phone ID
DECLARE @qu_sell INT -- Amoumt of phone sells
DECLARE @cur_mon INT -- Amount of phone sells this month
DECLARE @qu_sell_p INT -- Amount of phone sell in previous month
DECLARE @best_sellers TABLE(phone_id INT, mon SMALLINT)

SET @cur_year = 2019
SET @cur_ph_id = 1600000

SELECT
	@qu_ph = COUNT(DISTINCT phone_id)
FROM purchases
WHERE YEAR(date_purch) = @cur_year

WHILE ISNULL(@cur_ph_id, 0) <> 0
	BEGIN
	SELECT @cur_ph_id = MIN(phone_id)
	FROM purchases
	WHERE YEAR(date_purch) = @cur_year
		AND phone_id > @cur_ph_id

PRINT('Phone_id' + STR(@cur_ph_id))
SET @cur_mon = 1
SET @qu_sell_p = 0

WHILE @cur_mon <= 12
	BEGIN
	SELECT @qu_sell = COUNT(price)
	FROM purchases
	WHERE YEAR(date_purch) = @cur_year
		AND phone_id = @cur_ph_id
		AND MONTH(date_purch) = @cur_mon
	PRINT('Month ' + STR(@cur_mon, 2) + ' sell ' + STR(@qu_sell))
	IF @qu_sell > @qu_sell_p
		BEGIN
		SET @qu_sell_p = @qu_sell
		END
	ELSE
		BEGIN
		BREAK
		END
	SET @cur_mon = @cur_mon + 1
	END
PRINT('The amount of month with sell growth: ' + STR(@cur_mon - 1, 4))
IF @cur_mon - 1 >= 3
	BEGIN
	INSERT INTO @best_sellers (phone_id, mon)
	VALUES (@cur_ph_id, @cur_mon - 1)
	END
END
PRINT('In ' + STR(@cur_year, 4) + ' year')
PRINT('Sell ' + STR(@qu_ph, 4) + ' phones')
SELECT
	*
FROM @best_sellers*/

use P_STORE
GO
DECLARE @cur_year INT
DECLARE @cur_ph_id INT

SET @cur_year = 2019
SELECT
	@cur_ph_id = MIN(phone_id)
FROM purchases
WHERE YEAR(date_purch) = @cur_year
--GO
SELECT phone_name
FROM phones
WHERE phone_id = @cur_ph_id