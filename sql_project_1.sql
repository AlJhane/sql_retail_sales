
-- SQL Retail Sales Analysis -P1
CREATE DATABASE sql_project_p2;

-- create table
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
  (
	transactions_id	 INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id	INT,
	gender	VARCHAR(15),
	age	INT,
	category VARCHAR(15),
	quantiy INT,
	price_per_unit FLOAT,
	cogs FLOAT,
	total_sale FLOAT

  );
-- Fixing the name of the column quantity 
ALTER TABLE retail_sales
RENAME COLUMN quantiy TO quantity;

-- to check that the imported data is correct 
-- will only show data from 1-10 rows

  SELECT *
  FROM retail_sales
  LIMIT 10;

--Counting the rows
  SELECT 
  COUNT(*)
  FROM retail_sales;

-- Find null values

  SELECT *
  FROM retail_sales
  WHERE transactions_id IS NULL;
  

  SELECT *
  FROM retail_sales
  WHERE sale_date IS NULL;


-- select all null values in all rows
SELECT *
FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

-- Deleting null values 

DELETE FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

--DATA exploration 

-- How many sales we have? 

SELECT COUNT (*) as total_sale FROM retail_sales;

--How many unique customers we have??

SELECT COUNT (DISTINCT customer_id) as total_customers FROM retail_sales;

-- T0 know unique category 

SELECT DISTINCT category FROM retail_sales;

-- DATA ANALYSIS & business key problems and answers 


-- Q1. Write a SQL query to retrieve all columns for sales made in '2022-11-05'

SELECT * 
FROM retail_sales
WHERE sale_date = '2022-11-05';


-- Q2. Write a SQL query to retrieve all transactions where category is 'Clothing' and the quantity sold is more than 10 
-- the month of Nov-2022

SELECT *
FROM retail_sales
WHERE 
    category = 'Clothing' 
	AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND quantity >= 4;
 

-- Q3. Write a SQL query to calculate the total sales (total_sale) for each category 


SELECT category, 
	   SUM(total_sale) as net_sale,
	   COUNT(*) as total_order
FROM retail_sales
GROUP by category;



-- Q4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT ROUND(AVG(age),2) as avg_age
FROM retail_sales
WHERE category = 'Beauty';


-- Q5. Write an SQL query to find all transactions where the total_sale is greater than 1000.


SELECT * 
FROM retail_sales
WHERE total_sale > 1000;

-- Q6. Write a SQL query to find the total number transactions (transaction_id) made each gender in each category

SELECT category, gender, COUNT(*) as total_trans
FROM retail_sales
GROUP by gender, category
ORDER BY 1;


-- Q7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year. 

SELECT 
	year, 
	month, 
	avg_sale
FROM (
SELECT
	EXTRACT(YEAR FROM sale_date) as year,
	EXTRACT(MONTH FROM sale_date) as month,
	AVG(total_sale) as avg_sale,
	RANK()OVER(PARTITION BY EXTRACT (YEAR FROM sale_date) ORDER BY AVG (total_sale)DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank =1;
-- ORDER BY 1, 3 DESC;


-- Q8. write a sql query to find the top 5 based on the highest total sales. 
SELECT 
	customer_id,
	SUM(total_sale) as total_sale
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


-- Q9. Write a SQL query to find the number of unique customers who purchased items from each category. 

SELECT category,
	   COUNT(DISTINCT customer_id) as cnt_unique_cst
FROM retail_sales
GROUP by 1;

-- Q10. Write a SQL query to create each shift and number of orders (Example morning <=12, Afternoon Between 12&17, Evening >17)

WITH hourly_sale
AS (
SELECT *,
	CASE 
		WHEN EXTRACT (HOUR FROM sale_time) <12 THEN 'Morning'
		WHEN EXTRACT (HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END as shift 
FROM retail_sales
) SELECT shift, count(*) as total_orders
FROM hourly_sale
GROUP BY shift;

-- end of project 

SELECT EXTRACT (HOUR FROM CURRENT_TIME )
