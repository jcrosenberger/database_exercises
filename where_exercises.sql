/*
1. Create a file named where_exercises.sql. Make sure to use the employees database.
    USE employees.db

2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the 
    number of records returned.
    Code used:
        SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya')
    Answer: 
        709 Rows

3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
    Enter a comment with the number of records returned. Does it match number of rows from Q2?
    Code used:
        SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' or first_name = 'Maya'
    Answer:
        709 Rows

4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
    Enter a comment with the number of records returned.
    Code used:
        SELECT * FROM employees WHERE gender = 'M' AND (first_name = 'Irena' OR first_name = 'Vidya' or first_name = 'Maya')
    Answer:
        441 rows

5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name 
   starts with E.
    Code used:
        SELECT * FROM employees 
        WHERE last_name LIKE 'E%'
    Answer:
        7330 Employees

6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees 
    whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
    Code used:
        SELECT * FROM employees 
        WHERE last_name LIKE 'E%' OR last_name LIKE '%E'
        &
        SELECT * FROM employees 
        WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%'
    Answer:
        30723 Employees with an E at the beginning or end of their name
        23393 Employees with an E at the end of their name but do not have an E at the beginning of their name

7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of 
    employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
    Code used:
        SELECT * FROM employees 
        WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
        &
        SELECT * FROM employees 
        WHERE last_name LIKE '%E' 
    Answer:
        899 Employees whose names begin and end with an E
        24292 employees whose name end with an E

8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
    Code used:
        SELECT COUNT(hire_date) FROM employees
        WHERE hire_date LIKE '199%'
    Answer:
        135214

9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
    Code used:
        SELECT * FROM employees
        WHERE birth_date LIKE ('%12-25')
    Answer:
        842

10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
    Code used:
        SELECT * FROM employees
        WHERE birth_date LIKE '%12-25' AND hire_date LIKE '199%'
    Answer:
        362 employees

11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
    Code used:
        SELECT * FROM employees
        WHERE last_name LIKE '%q%' 
    Answer:
        1873 employees

12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
    Code used:
        SELECT * FROM employees
        WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
    Answer: 
        547 employees
*/