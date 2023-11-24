-- Created in database

CREATE DATABASE Andy_1

USE Andy_1

-- create a table for customers
CREATE TABLE Customers(
	customer_id INT PRIMARY KEY NOT NULL,
	customer_name VARCHAR(20) NOT NULL,
	customer_address VARCHAR(20) NOT NULL
	);

-- Insert values into customers table
INSERT INTO Customers(customer_id, customer_name, customer_address)
VALUES (1, 'Alice', '123 Main St'),
		(2, 'Bob', '456 Market St'),
		(3, 'Charlie', '789 Elm St');

SELECT *FROM Customers

-- create products table
CREATE TABLE Products(
	product_id INT PRIMARY KEY NOT NULL,
	product_name VARCHAR(50) NOT NULL,
	product_price DECIMAL (10,2),
	CHECK (product_price >0)
	);

-- Insert values into customers table
INSERT INTO Products(product_id, product_name, product_price)
VALUES (1, 'Widget', '10.00'),
		(2, 'Gadget', '20.00'),
		(3, 'Doohickey', '15.00');

SELECT *FROM Products

-- create orders table
CREATE TABLE Orders(
	order_id INT PRIMARY KEY NOT NULL,
	order_quantity INT NOT NULL,
	order_date DATE NOT NULL,
	customer_id INT,
	product_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
    );

SELECT *FROM Orders

-- Insert values into orders table
INSERT INTO Orders(order_id, order_quantity, order_date, customer_id, product_id)
VALUES (1, '10', '2021-01-01', '1', '1'),
		(2, '5', '2021-01-02', '1', '2'),
		(3, '3', '2021-01-03', '2', '1'),
		(4, '7', '2021-01-04', '2', '2'),
		(5, '2', '2021-01-05', '3', '1'),
		(6, '3', '2021-01-06', '3', '3');

SELECT *FROM Customers
SELECT *FROM Products
SELECT *FROM Orders