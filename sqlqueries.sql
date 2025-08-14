CREATE DATABASE sales_db;
USE sales_db;

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO sales (product, quantity, price) VALUES
('Laptop', 3, 50000),
('Mouse', 10, 500),
('Keyboard', 5, 1500),
('Monitor', 2, 12000),
('Laptop', 1, 50000),
('Mouse', 5, 500);




