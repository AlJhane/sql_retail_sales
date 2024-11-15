# Retail Sales Analysis SQL project 
## Project overview
**Project Title**: Retail Sales Analysis
**Level**: Beginner
**Database**:'p1_retail_db'

This project is designed to demonstrate SQL skills and techniques typically used by data analyst to explore, clean, and analyze retail sales data. The project involves setting up a retail database, performing exploratory data analysis (EDA), and answering specific business quetions thourgh SQL queries. THis project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL. 

## objectives

1. **Set up a retail sales database**: Create and populate sales database with the provided sales data.
2. **Data cleaning**: Identify and remove any records with missing values.
3. **Exploratory Data Analysis**: Perform basic exploratory data analysis to understand the dataset/
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project structure
### 1. Database Setup 
- **Database Creation**: The project starts by creating a database named 'p1_retail_db'.
- **Table Creation**: A table named 'retail_sales' is created to store sales data. The table structure includes columnd for transation ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold(COGS), and total sale amount. 


```sql
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
	quantity INT,
	price_per_unit FLOAT,
	cogs FLOAT,
	total_sale FLOAT

  );
```
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






