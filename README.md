# Retail Business Intelligence with SQL

## Project Overview
This project analyzes retail sales data using MySQL to identify sales trends, evaluate product performance, understand customer purchasing behavior, and measure profitability.

The project demonstrates SQL skills ranging from data quality checks and joins to Common Table Expressions (CTEs) and window functions.

## Business Objectives
- Evaluate overall sales and profitability.
- Identify top-performing product categories and products.
- Compare sales performance across regions.
- Analyze monthly sales trends and growth.
- Identify high-value customers.
- Detect and filter invalid transaction records.

## Tools and Technologies
- MySQL
- MySQL Workbench
- SQL

## Database Structure
The database contains three related tables:

- **customers:** Customer details, city, region, and segment.
- **products:** Product names, categories, and unit prices.
- **orders:** Transaction dates, quantities, discounts, sales, and profits.

## Data Quality Checks
The project checks for:
- Duplicate order IDs
- Missing important values
- Zero or negative quantities
- Discounts outside the accepted range
- Negative sales
- Negative-profit transactions requiring investigation

A `clean_orders` view is used to exclude records with non-positive quantities, discounts outside 0–100%, or negative sales. Negative-profit transactions are retained for further investigation.

## SQL Analysis
- Overall KPIs: total orders, sales, profit, average order value, and profit margin
- Category-wise sales and profit
- Region-wise performance
- Monthly sales and profit trends
- Top five customers by sales
- Product ranking using `RANK()`
- Month-over-month growth using `LAG()` and a CTE

## Key Findings
- Electronics generated the highest sales among product categories.
- Laptops ranked first by total product sales.
- December recorded the highest monthly sales in the practice dataset.
- October had the highest month-over-month sales growth.
- The customer with the highest sales was not the customer with the highest profit among the top five customers.

## Project Structure
```text
Retail-Business-Intelligence-SQL/
├── README.md
└── sql/
    ├── 01_database_setup.sql
    ├── 02_data_quality_checks.sql
    ├── 03_business_analysis.sql
    └── 04_advanced_analysis.sql
```

## Learning Outcomes
- Writing SQL queries for business analysis
- Applying joins and aggregate functions
- Performing basic data quality checks
- Using views to reuse cleaning logic
- Applying window functions and CTEs
- Calculating month-over-month sales growth
- Translating query results into business insights

## Dataset Note
This is a synthetic practice dataset created for learning and portfolio development. Findings should not be interpreted as actual business performance.

## Author
Aspiring Data Analyst | SQL | Excel | Data Analysis
