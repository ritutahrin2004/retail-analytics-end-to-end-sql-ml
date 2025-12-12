DROP TABLE IF EXISTS finance.stg_price;

CREATE TABLE finance.stg_price AS
SELECT
  TRIM(UPPER(sku))        AS sku,
  style_id,
  category,
  weight,
  tp_1,
  tp_2,
  amazon_mrp,
  DATE '2021-03-01'       AS snapshot_date,
  'pl_march_2021'         AS source
FROM finance.pl_march_2021

UNION ALL

SELECT
  TRIM(UPPER(sku))        AS sku,
  style_id,
  category,
  weight,
  tp                     AS tp_1,
  NULL                   AS tp_2,
  amazon_mrp,
  DATE '2022-05-01'       AS snapshot_date,
  'may_2022'              AS source
FROM finance.may_2022;

DROP TABLE IF EXISTS finance.dim_price;

CREATE TABLE finance.dim_price AS
SELECT
  ROW_NUMBER() OVER () AS price_id,
  sku,
  style_id,
  category,
  weight,
  COALESCE(tp_2, tp_1) AS tp,
  amazon_mrp,
  snapshot_date,
  source
FROM finance.stg_price
WHERE sku IS NOT NULL;



SELECT COUNT(*) FROM finance.dim_price;


