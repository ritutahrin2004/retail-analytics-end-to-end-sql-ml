-- 1) Drop old (wrong/empty) fact table
DROP TABLE IF EXISTS finance.fact_sales_international;

-- 2) Recreate fact table from the NEW cleaned staging table
CREATE TABLE finance.fact_sales_international AS
SELECT
    sale_date,
    customer,
    sku,
    size,
    quantity,
    rate,
    gross_amount
FROM finance.stg_international_sales
WHERE sku IS NOT NULL
  AND quantity IS NOT NULL
  AND gross_amount IS NOT NULL;

  SELECT COUNT(*) FROM finance.fact_sales_international;

SELECT *
FROM finance.fact_sales_international
LIMIT 20;

