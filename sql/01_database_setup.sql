-- Project 02: Retail Business Intelligence with SQL
-- 01 - Database and table setup
-- Run only if you need to create the database and tables from scratch.
-- If tables already exist, do not run CREATE TABLE statements again.

CREATE DATABASE IF NOT EXISTS retail_business;
USE retail_business;

CREATE TABLE IF NOT EXISTS customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    region VARCHAR(50),
    segment VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(12,2)
);

CREATE TABLE IF NOT EXISTS orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    order_date DATE,
    quantity INT,
    discount DECIMAL(5,2),
    sales DECIMAL(14,2),
    profit DECIMAL(14,2),
    CONSTRAINT fk_orders_customers
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_products
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

SHOW TABLES;

-- Existing practice data is not included in this setup script.
