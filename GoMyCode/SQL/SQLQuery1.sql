-- Created in database
CREATE DATABASE Gomycode;

USE GOMYCODE;
-- Create a table
CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
	FirstName VARCHAR(100),
	LastName VARCHAR(100),
	Department VARCHAR(100),
	Salary DECIMAL(10,2)
	);

-- Inserting Data into the table
INSERT INTO Employees (EmployeeID, Firstname, Lastname, Department, Salary)
	VALUES (1, 'John', 'Doe', 'HR', 55000.00),
			(2, 'Jane', 'Smith', 'Marketing', 60000.00),
			(3, 'Bob', 'Johnson', 'IT', 65000.00);

-- view the structure of the table
SP_HELP Employees

SELECT *FROM Employees
-- Retrieve all employee from the Employee table
SELECT *FROM Employees

-- Retrieve employee in the HR department
SELECT *FROM Employees WHERE Department = 'HR';

-- Retrieve employee with a salary greater than 60000
SELECT *FROM Employees WHERE Salary > 60000;

-- Updating employeeID column
UPDATE Employees
SET Salary = 58000.00
WHERE EmployeeID = 1;

SELECT *FROM employees

-- delete employee with ID 3
DELETE FROM employees
WHERE EmployeeID = 3

SELECT *FROM Employees

-- Create another table
CREATE TABLE Departments(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR (100),
	);

SELECT *FROM Departments

-- Inset data into the 'department' table
INSERT INTO Departments (DepartmentID, DepartmentName)
	VALUES (1, 'HR'),
			(2, 'Marketing'),
			(3, 'IT');

	SELECT *FROM Employees
	SELECT *FROM Departments

	--INNER JOIN
	SELECT *FROM Employees
		FULL JOIN Departments
		ON Employees.Department = Departments.DepartmentName;

	-- Adding more values on the Employee's table
	INSERT INTO Employees (EmployeeID, Firstname, Lastname, Department, Salary)
	VALUES (4, 'Andy', 'Fineboy', 'HR', 75000.00),
			(5, 'Joseph', 'Smith', 'Marketing', 80000.00),
			(6, 'Dopeclas', 'Johnson', 'IT', 90000.00);

	-- LEFT JOIN
SELECT * FROM Employees
 FULL JOIN Departments
 ON Departments.DepartmentID = Employees. EmployeeID;

	SELECT * FROM Employees
	SELECT * FROM Departments

	-- Insert data into the 'departments' table
	INSERT INTO Departments (DepartmentID, DepartmentName)
	VALUES (7, 'Software'),
			(8, 'Finance'),
			(9, 'Administration');

SELECT *FROM Employees
SELECT *FROM Departments

-- Aggregate function
-- Calculate the average salary of employees in the IT department
SELECT AVG(Salary) As Average_Salary
FROM Employees
WHERE Department = 'IT'

-- Calculate the maximum salary of the employees
SELECT MAX(Salary) Maximum_Salary
	FROM Employees

-- get the first two records
SELECT TOP 2*
	FROM Employees

SELECT DISTINCT (FirstName)
	FROM Employees

-- Count records in the table
SELECT COUNT(*) IT_Employee
FROM Employees
WHERE Department = 'IT'

-- COUNT records in the table
SELECT FirstName, LastName, COUNT(*) IT_Employee
FROM Employees
WHERE Department = 'IT'
GROUP BY FirstName, LastName

-- Subqueries
SELECT AVG(Salary) From Employees
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees

WHERE Salary> (SELECT AVG(Salary) FROM Employees)

-- Using Constraints In SQL Server
CREATE TABLE Customer(
		CustomeID INT PRIMARY KEY,
		FirstName VARCHAR (100),
		LastName VARCHAR (100),
		);

-- Creating a foreign key
CREATE TABLE Orders(
		OrderID INT PRIMARY KEY,
		CustomerID INT,
		OrderDate DATE,
		ProductName VARCHAR (100),
		FOREIGN KEY (CustomerID) REFERENCES Customer(CustomeID)
		);

-- Creating a table with a unique constraint
CREATE TABLE Products(
		ProductID INT,
		ProductName VARCHAR(100)
		);

INSERT INTO Products(ProductID, ProductName)
VALUES(1, 'Electronics'),
		(2, 'Appliances'),
		(3, 'Furnitures'),
		(4, 'Cooking Utensils'),
		(5, 'Toiletries');

ALTER TABLE Products
ADD Price DECIMAL(10, 2)

INSERT INTO Products(Price)
VALUES (200.00),
		(300.00),
		(150.00),
		(500.00),
		(600.00);

DROP TABLE Products;


UPDATE Products
SET Price = 200.00
WHERE ProductID = 1

UPDATE Products
SET Price = 300.00
WHERE ProductID = 2

UPDATE Products
SET Price = 150.00
WHERE ProductID = 3

UPDATE Products
SET Price = 500.00
WHERE ProductID = 4

UPDATE Products
SET Price = 600.00
WHERE ProductID = 5

DELETE FROM Products
WHERE ProductID IS NULL;

SELECT *FROM Products

-- Using the NOT Operator
SELECT *FROM Products
WHERE NOT ProductName = 'Electronics'

-- Using the IN Operator
SELECT *FROM Products
WHERE ProductName IN ('Electronics', 'Cooking utensils')

-- Using the Between operator
SELECT *FROM Products
WHERE Price BETWEEN 200 AND 500

SELECT *FROM Products
WHERE Price NOT BETWEEN 200 AND 500

-- Using the LIKE Operator
SELECT *FROM Products
WHERE ProductName LIKE 'F%' OR ProductName IN ('Electronics', 'Cooking utensils')


-- Create a table with a check constraint
CREATE TABLE Students(
			StudentID INT PRIMARY KEY,
			Age INT,
			CHECK (Age> = 18)
			);

INSERT INTO Students (StudentID, Age)
	VALUES (001,16);

	 
-- Creating a table with a Default Constraint
CREATE TABLE Order_1(
	OrderID INT PRIMARY KEY,
	OrderDate DATE DEFAULT GETDATE()
	);

SELECT *FROM Order_1
INSERT INTO Order_1(OrderID)
	VALUES (1);

CREATE TABLE Parties(
		Party_id INT, 
		Party_name VARCHAR(100),
		Candidate_Name VARCHAR (100) DEFAULT 'NOT AVAILABLE',
		Position VARCHAR(100)
		);

INSERT INTO Parties (Party_id, Party_name, Position)
		VALUES (001, 'PDP', 'Presidency');

Select *from Parties

-- Adding a primary key constraint to an existing table
ALTER TABLE Parties
ALTER COLUMN Party_id INT NOT NULL;

ALTER TABLE Parties
ADD PRIMARY KEY (Party_id);

select * from Parties
DROP TABLE Parties;

-- Logical operators
-- AND example
SELECT *FROM Employees
WHERE Salary >= 55000 AND Department = 'IT';

-- CASE Statement
SELECT *FROM Students

INSERT INTO Students(StudentID, Age)
	VALUES(001, 25),
		(002, 35),
		(003, 29),
		(004, 32),
		(005, 30)
SELECT Age,
CASE
	WHEN Age <=29 THEN 'Consider marriage'
	WHEN Age <=32 THEN 'Marry already !!!'
	ELSE 'You might consider going to your pastor'
  END AS Marital_status
FROM Students;

--GROUP BY Statement
SELECT *FROM Employees
SELECT Department, AVG(Salary) AS AVG_Salary
	FROM Employees
	GROUP BY Department
	ORDER BY AVG_Salary;

SELECT FirstName, Department, AVG(Salary) AS AVG_Salary
	FROM Employees
	WHERE FirstName LIKE 'J%'
	GROUP BY FirstName, Department
	ORDER BY AVG_Salary;

SELECT EmployeeID, FirstName, Department, AVG(Salary) AS AVG_Salary
	FROM Employees
	GROUP BY EmployeeID, FirstName, Department
	HAVING EmployeeID > 4
	ORDER BY AVG_Salary;

-- Another CASE example
SELECT COUNT(*) AS Count_all,
CASE
	WHEN Age <=29 THEN 'Consider marriage'
	WHEN Age <=32 THEN 'Marry already !!!'
	ELSE 'You might consider going to your pastor'
  END AS Marital_status
FROM Students
GROUP BY
 CASE
	WHEN Age <= 29 THEN 'Consider marriage'
	WHEN Age <= 32 THEN 'Marry already !!!'
	ELSE 'You might consider going to your pastor'
END;

CREATE TABLE Products(
		ProductID INT,
		ProductName VARCHAR(100)
		);
INSERT INTO Products(ProductID, ProductName)
VALUES (1, 'Electronics'),
		(2, 'Appliances'),
		(3, 'Furnitures'),
		(4, 'Cooking Utensils'),
		(5, 'Toiletries');

SELECT *FROM Products

UPDATE Products
SET Price =
CASE ProductID
WHEN 1 THEN 200
WHEN 2 THEN 300
WHEN 3 THEN 150
WHEN 4 THEN 500
WHEN 5 THEN 600
END;
SELECT *FROM Products

DROP TABLE Products

SELECT *FROM Employees

UPDATE Employees
SET Salary = 
CASE
WHEN Department = 'IT' OR FirstName LIKE 'J%' THEN Salary *2
WHEN Department = 'HR' OR FirstName LIKE 'A%' THEN Salary *2.5
END;
SELECT *FROM Employees

-- SET Operator
SELECT *FROM Employees
SELECT *FROM Departments

SELECT EmployeeID FROM Employees
	UNION
SELECT DepartmentID FROM Departments

-- Add more values to Department Table
INSERT INTO Departments (DepartmentID, DepartmentName)
	VALUES (10, 'Software development'),
			(11, 'Admin'),
			(12, 'Product Management');


-- Import dataset
-- Houses that are in perfect condition (4 & 5) from 1990-present
-- A 3 bedroom apartment, 2 bathroom, that has condition(4) and price below 500,000
-- Houses that have only been renovated and have atleaset 2 views, should 3 bedroom above and should be in (seattle, kent, maple valley, and lake forest park)
-- SP_help house_pricing_dataset #checking table structure
SELECT *FROM house_pricing_dataset


-- Houses that are in perfect condition (4 & 5) from 1990-present
SELECT yr_built, condition, city, COUNT(*) Number_of_houses
FROM house_pricing_dataset
WHERE condition = 4 and yr_built >=1990
GROUP BY yr_built, condition, city 
ORDER BY yr_built, condition

-- A 3 bedroom apartment, 2 bathroom, that has condition(4) and price below 500,000
SELECT bedrooms, bathrooms, condition, price, yr_built, yr_renovated
FROM house_pricing_dataset
WHERE bedrooms=3 and bathrooms=2 and condition = 4 and price <=500000

-- Houses that have only been renovated and have atleaset 2 views, should have 3 bedroom above and should be in (seattle, kent, maple valley, and lake forest park)
SELECT *FROM house_pricing_dataset
WHERE yr_renovated >0 AND bedrooms >=3 AND city IN ('seattle', 'kent', 'maple valley', 'lake forest park')


sp_rename 'house_pricing_dataset.views', 'view_', 'COLUMN'






























