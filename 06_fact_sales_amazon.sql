DROP TABLE IF EXISTS finance.stg_amazon_sales;

CREATE TABLE finance.stg_amazon_sales AS
SELECT
  CASE
    WHEN order_date ~ '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
    THEN order_date::date
    ELSE NULL
  END                                   AS order_date,
  TRIM(order_id)                        AS order_id,
  TRIM(UPPER(sku))                      AS sku,
  NULLIF(regexp_replace(quantity, '[^0-9]', '', 'g'), '')::int
                                        AS quantity,
  NULLIF(regexp_replace(amount, '[^0-9\.]', '', 'g'), '')::numeric
                                        AS sales_amount,
  TRIM(LOWER(status))             AS order_status,
  TRIM(LOWER(fulfilled_by))       AS fulfillment_channel,
  TRIM(INITCAP(ship_city))              AS ship_city,
  TRIM(INITCAP(ship_state))             AS ship_state,
  TRIM(INITCAP(ship_country))           AS ship_country
FROM finance.amazon_sale_report;


DROP TABLE IF EXISTS finance.fact_sales_amazon;

CREATE TABLE finance.fact_sales_amazon AS
SELECT *
FROM finance.stg_amazon_sales
WHERE sku IS NOT NULL
  AND order_id IS NOT NULL;


  SELECT COUNT(*) FROM finance.fact_sales_amazon;
SELECT * FROM finance.fact_sales_amazon LIMIT 10;


