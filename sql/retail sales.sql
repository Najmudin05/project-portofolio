USE project

CREATE TABLE retail_sales (
    transaction_id INT PRIMARY KEY,
    date DATE,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    total_amount DECIMAL(10, 2)
);

INSERT INTO retail_sales (transaction_id, date, customer_id, gender, age, product_category, quantity, price_per_unit, total_amount) VALUES
(1, '2024-09-01', 101, 'Male', 28, 'Electronics', 2, 499.99, 999.98),
(2, '2024-09-01', 102, 'Female', 34, 'Clothing', 3, 39.99, 119.97),
(3, '2024-09-02', 103, 'Male', 45, 'Groceries', 10, 1.99, 19.90),
(4, '2024-09-02', 104, 'Female', 22, 'Beauty', 1, 59.99, 59.99),
(5, '2024-09-03', 101, 'Male', 28, 'Electronics', 1, 199.99, 199.99);

SELECT * FROM retail_sales

SELECT date, SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY date
ORDER BY date;

SELECT product_category, SUM(quantity) AS total_sold
FROM retail_sales
GROUP BY product_category
ORDER BY total_sold DESC;

SELECT CASE
           WHEN age BETWEEN 18 AND 25 THEN '18-25'
           WHEN age BETWEEN 26 AND 35 THEN '26-35'
           WHEN age BETWEEN 36 AND 45 THEN '36-45'
           ELSE '46+'
       END AS age_group,
       AVG(total_amount) AS avg_spending
FROM retail_sales
GROUP BY age_group
ORDER BY age_group;

SELECT gender, SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY gender;

SELECT customer_id, SUM(total_amount) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

SELECT customer_id, COUNT(transaction_id) AS num_transactions
FROM retail_sales
GROUP BY customer_id
ORDER BY num_transactions DESC;

SELECT EXTRACT(MONTH FROM date) AS month, SUM(total_amount) AS monthly_sales
FROM retail_sales
GROUP BY EXTRACT(MONTH FROM date)
ORDER BY month;

SELECT product_category, SUM(total_amount) AS total_revenue
FROM retail_sales
GROUP BY product_category
ORDER BY total_revenue DESC;
