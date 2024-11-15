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


