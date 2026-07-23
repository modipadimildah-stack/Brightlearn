-- Databricks notebook source
--Creating a table called departments
CREATE OR REPLACE TABLE departments
(dept_id INT,
dept_name STRING);

--Inserting data into our table
INSERT INTO departments VALUES
(10, 'Sales'),
(20,'IT'),
(30, 'HR'),
(40, 'Legal');

--Running the newly created table
SELECT *
FROM departments;

--Creating a table called employees
CREATE OR REPLACE TABLE employees
(emp_id INT,
emp_name STRING,
dept_id INT);

--Inserting data into our table
INSERT INTO employees VALUES
(1,'Neo',10),
(2,'Amina',20),
(3,'Thabo',20),
(4,'Mia',50);

--Running the newly created table 
SELECT *
FROM employees;

--Join the tables using an INNER JOIN (Inner join returns the entries that are common in both columns)
SELECT a.emp_id,
    a.emp_name,
    b.dept_name
FROM employees AS a
INNER JOIN departments AS b 
ON a.dept_id = b.dept_id;

--Join the tables using a LEFT JOIN (It returns all the entries on the Left table and returns only the lines that match on the right table)
SELECT a.emp_id,
    a.emp_name,
    b.dept_name
FROM employees AS a
LEFT JOIN departments AS b
ON a.dept_id = b.dept_id;

--Joining the tables using a LEFT JOIN and replacing the null values using COALESCE (Coalesce is a way to replace NULL values using values from an alternative column)
SELECT a.emp_id,
    a.emp_name,
    b.dept_name,
    COALESCE (b.dept_name,'Unassigned') AS
Dept_name_clean 
FROM employees AS a 
LEFT JOIN departments AS b
ON a.dept_id = b.dept_id;