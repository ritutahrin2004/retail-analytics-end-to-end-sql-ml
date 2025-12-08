DROP TABLE IF EXISTS finance.stg_customer;

CREATE TABLE finance.stg_customer AS
SELECT DISTINCT
    TRIM(UPPER("CUSTOMER")) AS customer_name
FROM finance."International sale report"
WHERE "CUSTOMER" IS NOT NULL
  AND TRIM("CUSTOMER") <> '';


  DROP TABLE IF EXISTS finance.dim_customer;

CREATE TABLE finance.dim_customer AS
SELECT
    ROW_NUMBER() OVER () AS customer_id,
    customer_name
FROM finance.stg_customer;

