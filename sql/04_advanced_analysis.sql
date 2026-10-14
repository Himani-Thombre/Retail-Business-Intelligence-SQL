-- Project 02: Retail Business Intelligence with SQL
-- 04 - Advanced analysis: ranking, CTE, LAG, month-over-month growth
USE retail_business;

-- Rank products by total sales
SELECT
    p.product_name,
    p.category,
    SUM(o.sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(o.sales) DESC) AS sales_rank
FROM clean_orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY sales_rank;

-- Monthly sales using a CTE and month-over-month comparison using LAG
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS sales_year,
        MONTH(order_date) AS month_number,
        MONTHNAME(order_date) AS month_name,
        SUM(sales) AS total_sales
    FROM clean_orders
    GROUP BY
        YEAR(order_date),
        MONTH(order_date),
        MONTHNAME(order_date)
)
SELECT
    month_name,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY sales_year, month_number
    ) AS previous_month_sales,
    ROUND(
        (total_sales - LAG(total_sales) OVER (
            ORDER BY sales_year, month_number
        )) /
        NULLIF(LAG(total_sales) OVER (
            ORDER BY sales_year, month_number
        ), 0) * 100,
        2
    ) AS growth_percentage
FROM monthly_sales
ORDER BY sales_year, month_number;

-- Return only the month with the highest sales
SELECT
    MONTHNAME(order_date) AS month_name,
    SUM(sales) AS total_sales
FROM clean_orders
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY total_sales DESC
LIMIT 1;
