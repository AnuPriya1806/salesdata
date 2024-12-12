CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    registration_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

    

INSERT INTO customers VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', 'New York', 'NY', 'USA', '2024-01-01'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', 'Los Angeles', 'CA', 'USA', '2024-02-15');

INSERT INTO products VALUES 
(101, 'Laptop', 'Electronics', 1000.00, 50),
(102, 'Smartphone', 'Electronics', 700.00, 200),
(103, 'Headphones', 'Accessories', 150.00, 100);

INSERT INTO sales VALUES 
(1001, '2024-11-01', 1, 101, 1, 1000.00),
(1002, '2024-11-01', 2, 102, 2, 1400.00),
(1003, '2024-11-05', 1, 103, 1, 150.00);


-- Total Sales Revenue:
SELECT SUM(total_amount) AS total_revenue
FROM sales;

-- Top-Selling Products:
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;


-- Monthly Sales Trends:
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month, SUM(total_amount) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- Customer Segmentation:
SELECT c.customer_id, c.first_name, c.last_name, SUM(s.total_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;


-- Inventory Check (Low Stock Products):
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 20;


-- Sales by Category:
SELECT p.category, SUM(s.total_amount) AS category_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

Project Description: Sales Data Analysis for a Retail Store

Project Overview:
This project aims to simulate a real-world scenario where a retail store's sales data is analyzed using SQL. 
The primary focus is to extract meaningful insights, identify trends, and provide actionable information that can help improve business decisions.
The project involves designing a relational database, populating it with sample data, and executing SQL queries to generate reports and perform analytics.

