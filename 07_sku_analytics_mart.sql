DROP TABLE IF EXISTS finance.agg_international_sales;

CREATE TABLE finance.agg_international_sales AS
SELECT
  sku,
  SUM(quantity)        AS intl_units_sold,
  SUM(gross_amount)    AS intl_revenue,
  AVG(rate)            AS intl_avg_price
FROM finance.fact_sales_international
GROUP BY sku;


DROP TABLE IF EXISTS finance.agg_amazon_sales;

CREATE TABLE finance.agg_amazon_sales AS
SELECT
  sku,
  SUM(quantity)        AS amazon_units_sold,
  SUM(sales_amount)    AS amazon_revenue,
  AVG(sales_amount / NULLIF(quantity, 0)) AS amazon_avg_price
FROM finance.fact_sales_amazon
GROUP BY sku;


DROP TABLE IF EXISTS finance.latest_price;

CREATE TABLE finance.latest_price AS
SELECT DISTINCT ON (sku)
  sku,
  tp,
  amazon_mrp,
  snapshot_date
FROM finance.dim_price
ORDER BY sku, snapshot_date DESC;


DROP TABLE IF EXISTS finance.sku_analytics_mart;

CREATE TABLE finance.sku_analytics_mart AS
SELECT
  p.product_id,
  p.sku,
  p.design_no,
  p.category,
  p.size,
  p.color,

  -- International metrics
  i.intl_units_sold,
  i.intl_revenue,
  i.intl_avg_price,

  -- Amazon metrics
  a.amazon_units_sold,
  a.amazon_revenue,
  a.amazon_avg_price,

  -- Pricing context
  pr.tp               AS latest_tp,
  pr.amazon_mrp       AS latest_amazon_mrp,

-- Derived metrics
(a.amazon_avg_price - pr.tp::numeric) AS amazon_price_gap,
(i.intl_avg_price   - pr.tp::numeric) AS intl_price_gap


FROM finance.dim_product p
LEFT JOIN finance.agg_international_sales i ON p.sku = i.sku
LEFT JOIN finance.agg_amazon_sales a        ON p.sku = a.sku
LEFT JOIN finance.latest_price pr           ON p.sku = pr.sku;


SELECT COUNT(*) FROM finance.sku_analytics_mart;
SELECT * FROM finance.sku_analytics_mart LIMIT 10;


SELECT COUNT(*) AS product_skus
FROM finance.dim_product;

SELECT COUNT(DISTINCT sku) AS price_skus
FROM finance.dim_price;


SELECT COUNT(DISTINCT p.sku) AS matching_skus
FROM finance.dim_product p
JOIN finance.dim_price pr
  ON p.sku = pr.sku;

SELECT COUNT(*) FROM finance.sku_analytics_mart;
SELECT * FROM finance.sku_analytics_mart LIMIT 10;


  DROP TABLE IF EXISTS finance.sku_analytics_mart;

CREATE TABLE finance.sku_analytics_mart AS
SELECT
  p.product_id,
  p.sku,
  p.design_no,
  p.category,
  p.size,
  p.color,

  -- International metrics
  i.intl_units_sold,
  i.intl_revenue,
  i.intl_avg_price,

  -- Amazon metrics
  a.amazon_units_sold,
  a.amazon_revenue,
  a.amazon_avg_price

FROM finance.dim_product p
LEFT JOIN finance.agg_international_sales i ON p.sku = i.sku
LEFT JOIN finance.agg_amazon_sales a        ON p.sku = a.sku;






