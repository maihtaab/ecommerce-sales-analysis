-- How many rows are there?
SELECT COUNT(*)
FROM ecommerce_sales_analytics esa;

-- Check out the first 10 rows
SELECT *
FROM ecommerce_sales_analytics esa
LIMIT 10;

-- What product categories are in this data?
SELECT DISTINCT product_category
FROM ecommerce_sales_analytics esa;

-- What payment methods are in this data?
SELECT DISTINCT payment_method
FROM ecommerce_sales_analytics esa;

-- How many orders are in each product category?
SELECT
	esa.product_category,
	COUNT(*) AS order_count
FROM ecommerce_sales_analytics esa 
GROUP BY esa.product_category;

-- How many total units were sold in each product category?
SELECT
	esa.product_category,
	SUM(esa.quantity) AS total_units
FROM ecommerce_sales_analytics esa
GROUP BY esa.product_category; 

-- How much total revenue did each product category generate?
SELECT
	esa.product_category,
	SUM(esa.revenue) AS total_revenue
FROM ecommerce_sales_analytics esa 
GROUP BY esa.product_category
ORDER BY total_revenue DESC;

-- Which region generated the most revenue? Ans: West $1,345,582.4
SELECT
	esa.region,
	SUM(esa.revenue) AS total_revenue
FROM ecommerce_sales_analytics esa
GROUP BY esa.region 
ORDER BY total_revenue DESC;

-- Which region has the highest average revenue per order? Ans: West
SELECT 
	esa.region,
	AVG(esa.revenue) AS avg_revenue
FROM ecommerce_sales_analytics esa 
GROUP BY esa.region 
ORDER BY avg_revenue DESC;

-- Display region, total_orders, total_units, total_revenue, avg_order_revenue
SELECT 
	esa.region,
	COUNT(*) AS total_orders,
	SUM(esa.quantity) AS total_units,
	SUM(esa.revenue) AS total_revenue,
	AVG(esa.revenue) AS avg_order_revenue
FROM ecommerce_sales_analytics esa 
GROUP BY esa.region 
ORDER BY total_revenue DESC;

-- How much revenue did each region generate from Electronic orders only?
SELECT
	esa.region,
	SUM(esa.revenue) AS revenue
FROM ecommerce_sales_analytics esa 
WHERE esa.product_category = 'Electronics'
GROUP BY esa.region 
ORDER BY revenue DESC;

-- Which region generated the most revenue from Electronics and Clothing combined? Ans: West
SELECT 
	esa.region,
	SUM(esa.revenue) AS revenue
FROM ecommerce_sales_analytics esa 
WHERE esa.product_category IN ('Electronics', 'Clothing')
GROUP BY esa.region 
ORDER BY revenue DESC;

-- Check date formatting (Currently M/DD/YYYY)
SELECT DISTINCT esa.order_date
FROM ecommerce_sales_analytics esa
LIMIT 20;

SELECT 
	esa.order_date,
	TO_DATE(esa.order_date, 'MM/DD/YYYY') AS converted_date
FROM ecommerce_sales_analytics esa 
LIMIT 10;









