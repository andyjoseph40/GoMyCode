-- creating a database
	CREATE DATABASE Gomycode_1

	USE Gomycode_1

-- creating a products table
CREATE TABLE products(
product_id INT PRIMARY KEY NOT NULL,
product_name VARCHAR (20) NOT NULL,
product_price DECIMAL (10,2),
);

-- Inserting values into the products table
INSERT INTO products(product_id, product_name, product_price)
VALUES (1, 'Cookies', '10'),
		(2, 'Candy', '5.2');

SELECT *FROM products

-- creating a customers table
CREATE TABLE customers(
customer_id INT PRIMARY KEY NOT NULL,
customer_name VARCHAR (20) NOT NULL,
customer_address VARCHAR (20) NOT NULL,
);

-- Inserting values into the customers table
INSERT INTO customers(customer_id, customer_name, customer_address)
VALUES (1, 'Ahmed', 'Tunisia'),
		(2, 'Coulibaly', 'Senegal'),
		(3, 'Hasan', 'Egypt');

SELECT *FROM customers

-- creating the orders table
CREATE TABLE orders(
order_id INT PRIMARY KEY NOT NULL,
customer_id INT NOT NULL,
product_id INT NOT NULL,
order_quantity INT NOT NULL,
order_date DATE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id),
);

-- Insert values into orders table
INSERT INTO orders(order_id, customer_id, product_id, order_quantity, order_date)
VALUES (1, '1', '2', '3', '2023-01-22'),
		(2, '2', '1', '10', '2023-04-14');

SELECT *FROM orders

-- updating order_quantity from orders table
UPDATE orders
SET order_quantity = 6
WHERE order_id = 2;

-- deleting third customer from the customers table
DELETE FROM customers
WHERE customer_id = 3;

SELECT *FROM customers

-- deleting orders table
DELETE FROM orders

SELECT *FROM orders

-- dropping the orders table
DROP TABLE orders




