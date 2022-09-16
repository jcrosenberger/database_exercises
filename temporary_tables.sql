/*
1. Using the example from the lesson, create a temporary table called employees_with_departments that contains 
first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to 
create this table on your own database. If you see "Access denied for user ...", it means that the query 
was attempting to write a new table to a database that you can only read.

a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths 
of the first name and last name columns
b. Update the table so that full name column contains the correct data
c. Remove the first_name and last_name columns from the table.
d. What is another way you could have ended up with this same table?
*/


USE mirzakhani_1946;

DROP TEMPORARY TABLE employees_with_departments

CREATE TEMPORARY TABLE employees_with_departments(first_name VARCHAR(49) NOT NULL, 
										last_name VARCHAR(50) NOT NULL, 
                                        dept_name VARCHAR(75) NOT NULL)


SELECT * 
FROM employees_with_departments AS ewd;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

SELECT *
FROM employees_with_departments


/* 
For section D, 
We could just import from another database first_name and last_name columns and concated them in the process of importing
*/


**********************************************************************
***************************** Exercise 2 *****************************
**********************************************************************

-- Create a temporary table based on the payment table from the sakila database.

DROP TABLE IF EXISTS payments;
SELECT * FROM sakila.payment;

CREATE TEMPORARY TABLE payments AS(
SELECT payment_id, customer_id, staff_id, rental_id, amount*100 AS amounts_in_pennies
FROM sakila.payment
);

SELECT * FROM payments;

ALTER TABLE payments MODIFY amounts_in_pennies INT NOT NULL;

DESCRIBE payments





/*
Write the SQL necessary to transform the amount column such that it is stored as an integer 
representing the number of cents of the payment. For example, 1.99 should become 199.
*/


**********************************************************************
***************************** Exercise 3 *****************************
**********************************************************************
