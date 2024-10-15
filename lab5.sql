CREATE DATABASE lab5;

CREATE TABLE customers(
    customer_id INT,
    cust_name varchar(50),
    city varchar(50),
    grade INT,
    salesman_id INT
);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

CREATE TABLE orders (
    ord_no INT,
    purch_amt decimal(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

CREATE TABLE salesmen (
    salesman_id INT,
    name varchar(50),
    city varchar(50),
    commission decimal(3, 2)
);
INSERT INTO salesmen (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);
-- 3
SELECT SUM(purch_amt)
FROM orders;
-- 4
SELECT AVG(purch_amt)
FROM orders;
-- 5
SELECT COUNT(*) AS customer_name
FROM CUSTOMERS
WHERE cust_name IS NOT NULL;
-- 6
SELECT MIN(purch_amt)
FROM orders;
-- 6 second variant
SELECT purch_amt
FROM orders
ORDER BY purch_amt LIMIT 1;
-- 7
SELECT *
FROM customers
WHERE RIGHT(cust_name, 1)  = 'b';
-- LIKE '%b'
-- substring(cust_name, -1, 1) = 'b'
-- 8
SELECT orders.*
FROM orders
JOIN customers on orders.customer_id = customers.customer_id
WHERE customers.city = 'New York';
-- 9
SELECT DISTINCT customers.*
FROM customers
JOIN orders on customers.customer_id = orders.customer_id
WHERE orders.purch_amt > 10;
-- 10
SELECT SUM(grade) FROM customers;
-- 11
SELECT *
FROM customers
WHERE cust_name IS NOT NULL;
-- 12
SELECT MAX(grade) FROM customers;
-- 12 second variant
SELECT grade
FROM customers
ORDER BY grade DESC LIMIT 1 OFFSET 2;
