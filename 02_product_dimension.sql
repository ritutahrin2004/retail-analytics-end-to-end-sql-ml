DROP TABLE IF EXISTS finance.stg_product;


CREATE TABLE finance.stg_product AS
SELECT DISTINCT
    TRIM(UPPER("SKU Code"))   AS sku,
    TRIM(UPPER("Design No.")) AS design_no,
    TRIM(INITCAP("Category")) AS category,
    TRIM(UPPER("Size"))       AS size,
    TRIM(INITCAP("Color"))    AS color
FROM finance."Sale Report"
WHERE "SKU Code" IS NOT NULL;


CREATE TABLE finance.dim_product AS
SELECT
    ROW_NUMBER() OVER () AS product_id,
    sku,
    design_no,
    category,
    size,
    color
FROM finance.stg_product;
