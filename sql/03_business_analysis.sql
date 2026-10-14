-- Project 02: Retail Business Intelligence with SQL
-- 03 - Core business analysis
USE retail_business;

-- Overall KPIs
SELECT
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(AVG(sales), 2) AS average_order_value,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_percentage
FROM clean_orders;

-- Sales and profit by product category
SELECT
    p.category,
    COUNT(o.order_id) AS total_orders,
    SUM(o.sales) AS total_sales,
    SUM(o.profit) AS total_profit
FROM clean_orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- Sales and profit by customer region
SELECT
    c.region,
    COUNT(o.order_id) AS total_orders,
    SUM(o.sales) AS total_sales,
    SUM(o.profit) AS total_profit,
    ROUND(SUM(o.profit) / NULLIF(SUM(o.sales), 0) * 100, 2) AS profit_margin_percentage
FROM clean_orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_sales DESC;

-- Monthly sales and profit
SELECT
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS month_name,
    COUNT(order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM clean_orders
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY month_number;

-- Top 5 customers by total sales
SELECT
    c.customer_name,
    SUM(o.sales) AS total_sales,
    SUM(o.profit) AS total_profit,
    COUNT(o.order_id) AS total_orders
FROM clean_orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_sales DESC
LIMIT 5;
