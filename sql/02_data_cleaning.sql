-- Permanently change current dates to proper DATE format
ALTER TABLE ecommerce_sales_analytics 
ALTER COLUMN order_date TYPE DATE
USING TO_DATE(order_date, 'MM/DD/YYYY');

-- What are the earliest and latest order dates in the entire dataset?
SELECT 
	MIN(esa.order_date) AS earliest_date,
	MAX(esa.order_date) AS latest_date
FROM ecommerce_sales_analytics esa;

-- How many orders are there in each year?
SELECT
    EXTRACT(YEAR FROM esa.order_date) AS order_year,
    COUNT(*) AS order_count
FROM ecommerce_sales_analytics esa
GROUP BY order_year
ORDER BY order_year ASC;
-- Result: Dataset spans 2022-2035, with approximately one order per day.

-- Check for duplicate order IDs
SELECT
    esa.order_id,
    COUNT(*) AS duplicate_count
FROM ecommerce_sales_analytics esa
GROUP BY esa.order_id
HAVING COUNT(*) > 1;
-- Result: No duplicate order IDs

-- How many orders have a missing customer rating?
SELECT
    COUNT(*) AS missing_ratings
FROM ecommerce_sales_analytics esa
WHERE esa.customer_rating IS NULL;