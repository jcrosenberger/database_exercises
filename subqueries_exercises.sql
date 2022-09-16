-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT * FROM employees;

SELECT concat(first_name, " ",last_name), hire_date
FROM employees 
JOIN dept_emp USING(emp_no)
WHERE hire_date = (
					SELECT hire_date
					FROM employees
                    WHERE emp_no = 101010
                    )
AND to_date > CURDATE()
-- 69 current employees

-- 2. Find all the titles ever held by all current employees with the first name Aamod. 
/*
USE employees;
SELECT * FROM employees;
SELECT * FROM titles;

SELECT * 
FROM employees 
WHERE first_name = "Aamod";

SELECT title = (
		SELECT *
		FROM employees 
        WHERE first_name = "Aamod"
        ) AS aa
FROM titles
*/
USE employees;
SELECT * FROM employees;
SELECT * FROM titles;

SELECT * 
FROM employees 
WHERE first_name = "Aamod";

SELECT DISTINCT title
FROM titles 
WHERE emp_no IN 
			(
			SELECT emp_no
			FROM employees
            JOIN dept_emp USING (emp_no)
			WHERE first_name = "Aamod"
			)


-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT * FROM salaries LIMIT 1000;
SELECT * FROM dept_emp LIMIT 1000;
SELECT FORMAT(COUNT(*),0) AS number_former_employees
FROM employees 
WHERE emp_no IN	(
			SELECT DISTINCT emp_no
			FROM salaries
			WHERE to_date < CURDATE()
            )
;
-- 300,024 former employees


-- 4. Find all the current department managers that are female. List their names in a comment in your code.

SELECT * FROM employees LIMIT 1000;
SELECT * FROM dept_manager LIMIT 1000;
SELECT 	emp_no
FROM dept_manager
WHERE to_date > CURDATE();

SELECT CONCAT(first_name, " ", last_name)
FROM (
	  SELECT emp_no 
      FROM dept_manager 
      WHERE to_date > CURDATE()
      ) as bosses

JOIN employees AS e ON bosses.emp_no = e.emp_no
WHERE gender = "F" 

-- 'Isamu Legleitner, Karsten Sigstam, Hilary Kambil, Leon DasSarma


-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

-- definitely a result I don't like. I need to figure out how to join employees and salaries so I can return names

SELECT * FROM employees LIMIT 1000;
SELECT * FROM salaries LIMIT 1000;

SELECT AVG(salary)
FROM salaries
WHERE to_date < CURDATE();

SELECT emp_no, salaries
FROM salaries
WHERE salary > (
				SELECT AVG(salary)
                FROM salaries
                WHERE to_date < CURDATE()
                )
	AND to_date > CURDATE();

/*
6. How many current salaries are within 1 standard deviation of the current highest salary? 
(Hint: you can use a built in function to calculate the standard deviation.) 
What percentage of all salaries is this?
*/

SELECT MAX(salary)
FROM salaries
WHERE to_date > CURDATE();

SELECT STD(salary)
FROM salaries
WHERE to_date > CURDATE();

SELECT COUNT(*)
FROM salaries
WHERE to_date > CURDATE()
AND salary >= (
			  SELECT MAX(salary)
              FROM salaries
              WHERE to_date > CURDATE()
              )
              -
			 (
              SELECT STD(salary)
              FROM salaries
              WHERE to_date > CURDATE()
              )