INSERT INTO crm_contacts
SELECT 
	*
FROM t1

SELECT
	*
FROM crm_operator

ALTER TABLE crm_operator
ALTER COLUMN operator_id SMALLINT NOT NULL

ALTER TABLE crm_operator
ADD CONSTRAINT PK_operator_id PRIMARY KEY (operator_id)

ALTER TABLE crm_evaluate
ALTER COLUMN evaluate SMALLINT NOT NULL

ALTER TABLE crm_evaluate
ADD CONSTRAINT PK_evaluate_id PRIMARY KEY (evaluate)

ALTER TABLE crm_cont_type
ALTER COLUMN contact_id SMALLINT NOT NULL

ALTER TABLE crm_cont_type
ADD CONSTRAINT PK_contact_id PRIMARY KEY (contact_id)

SELECT
	DISTINCT contact_id,
	io,
	contact_descriptor
INTO crm_cont_type2
FROM crm_cont_type

SELECT
	*
FROM crm_cont_type2

DELETE FROM crm_cont_type

INSERT INTO crm_cont_type
SELECT 
	*
FROM crm_cont_type2

DROP TABLE crm_cont_type2

SELECT
	*
FROM crm_contacts

ALTER TABLE crm_contacts
ALTER COLUMN date_cont SMALLDATETIME NOT NULL

ALTER TABLE crm_contacts
ALTER COLUMN client_id INT NOT NULL

ALTER TABLE crm_contacts
ALTER COLUMN contact_id SMALLINT NOT NULL

ALTER TABLE crm_contacts
ADD CONSTRAINT FK_client_id FOREIGN KEY (client_id)
REFERENCES clients (client_id)

ALTER TABLE crm_contacts
ADD CONSTRAINT FK_evaluate_id FOREIGN KEY (evaluate_id)
REFERENCES crm_evaluate (evaluate)

ALTER TABLE crm_contacts
ADD CONSTRAINT FK_operator_id FOREIGN KEY (operator_id)
REFERENCES crm_operator (operator_id)

ALTER TABLE crm_contacts
ADD CONSTRAINT FK_contact_id FOREIGN KEY (contact_id)
REFERENCES crm_cont_type (contact_id)

SELECT
	*
FROM crm_contacts

ALTER TABLE crm_contacts
ADD id INT PRIMARY KEY IDENTITY