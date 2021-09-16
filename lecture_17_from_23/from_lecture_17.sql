SELECT
	*
FROM phone_feedback


INSERT INTO phone_feedback (phone_id, date_feedback, nick_name, phone_adv, phone_dsa, phone_comm)
VALUES(1647950, '01.01.2020', 'Ivan', 'Good camera', 'Bad memory', 'I like it')


INSERT INTO phone_feedback (phone_id, date_feedback, nick_name, phone_adv, phone_dsa, phone_comm)
VALUES(1647950, '02.02.2020', 'B52', 'Office', 'Bad autonomy', 'I dont like it')


CREATE TABLE phone_feedback_1 (phone_id INT, date_feedback date,
								nick_name NVARCHAR(20), phone_adv NVARCHAR(1000),
								phone_dsa NVARCHAR(1000), phone_comm NVARCHAR(1000))


SELECT
	*
FROM phone_feedback_1


SELECT
	b.Brand_name,
	a.phone_name,
	a.phone_id,
	b.brand_id
INTO my_phones_t
FROM phones a
JOIN brands b
	ON a.brand_id = b.brand_id


SELECT
	*
FROM my_phones_t


CREATE VIEW my_phones_v AS
SELECT
	b.Brand_name,
	a.phone_name,
	a.phone_id,
	b.brand_id
FROM phones a
JOIN brands b
	ON a.brand_id = b.brand_id


SELECT
	*
FROM my_phones_v