-- Project 02: Retail Business Intelligence with SQL
-- 02 - Data quality checks
USE retail_business;

SELECT COUNT(*) AS total_orders
FROM orders;

-- Check duplicate order IDs
SELECT order_id, COUNT(*) AS id_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Check zero or negative quantities
SELECT *
FROM orders
WHERE quantity <= 0;

-- Check discounts outside the accepted 0-to-1 range
SELECT *
FROM orders
WHERE discount < 0 OR discount > 1;

-- Check negative sales
SELECT *
FROM orders
WHERE sales < 0;

-- Flag negative profit for investigation; do not automatically exclude it
SELECT *
FROM orders
WHERE profit < 0;

-- Check missing important values
SELECT *
FROM orders
WHERE order_id IS NULL
   OR customer_id IS NULL
   OR product_id IS NULL
   OR order_date IS NULL
   OR quantity IS NULL
   OR discount IS NULL
   OR sales IS NULL
   OR profit IS NULL;

-- Reusable view: excludes invalid quantities, discounts outside 0-to-1, and negative sales.
-- Negative-profit orders are retained for investigation.
CREATE OR REPLACE VIEW clean_orders AS
SELECT *
FROM orders
WHERE quantity > 0
  AND discount BETWEEN 0 AND 1
  AND sales >= 0;

-- Expected 994 rows for the current practice dataset
SELECT COUNT(*) AS valid_orders
FROM clean_orders;

SELECT *
FROM clean_orders
LIMIT 10;
