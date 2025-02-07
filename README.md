# Sales-Data-Analysis-Project
This project is designed to simulate and analyze a sales database using MySQL. It provides a comprehensive look into customer behavior, product performance, revenue trends, and inventory management.
The repository includes:

Dataset Generation:
Sample data for four key tables is generated using Python:

Customers: Contains customer details such as name, email, phone, and location.
Products: Contains product information including name, category, price, and stock quantity.
Orders: Contains order transactions with customer references, order dates, total amounts, and payment methods.
Order Items: Contains details of each order item with product IDs, quantities, and calculated subtotals.
Database Schema:
The MySQL schema is designed to reflect real-world sales data relationships, including foreign keys that link orders to customers and order items to products.

Data Cleaning & Validation:
Queries are included to identify and handle duplicate records, missing or NULL values, and standardize key fields (e.g., converting email addresses to lowercase).

Exploratory Data Analysis (EDA):
The project includes a range of MySQL queries to derive key business insights:

Total revenue generated across all sales.
Identification of the top 5 best-selling products by quantity sold.
Analysis of monthly sales trends using aggregated order data.
Calculation of the Average Order Value (AOV) to assess customer spending.
Inventory management insights, such as identifying low-stock products and the most profitable product categories.
Usage & Insights:
This project is ideal for anyone looking to:

Learn how to generate sample data and structure a relational database.
Explore and analyze sales data using SQL.
Understand data cleaning techniques and build practical business intelligence dashboards.
Whether you're a beginner looking to get hands-on practice with MySQL or a professional interested in data analysis and visualization, this project provides a solid foundation and useful queries for real-world scenarios.

