DROP TABLE IF EXISTS finance.stg_international_sales;

CREATE TABLE finance.stg_international_sales AS
SELECT 
    CAST("DATE" AS DATE) AS sale_date,
    TRIM(UPPER("CUSTOMER")) AS customer,
    TRIM(UPPER("SKU")) AS sku,
    TRIM(UPPER("Size")) AS size,
    CAST("PCS" AS INTEGER) AS quantity,
    CAST("RATE" AS NUMERIC(10,2)) AS rate,
    CAST("GROSS AMT" AS NUMERIC(12,2)) AS gross_amount
FROM finance."International sale report"
WHERE "SKU" IS NOT NULL
  AND "PCS" ~ '^[0-9]+$'    -- keeps only valid numbers
  AND "GROSS AMT" ~ '^[0-9.]+$';


DROP TABLE IF EXISTS finance.fact_sales_international;

CREATE TABLE finance.fact_sales_international AS
SELECT
    sale_date,
    customer,
    sku,
    size,
    quantity,
    rate,
    gross_amount
FROM finance.stg_international_sales;
