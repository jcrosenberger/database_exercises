
/*
1. Use the join_example_db. Select all the records from both the users and roles tables.Use the join_example_db. 
Select all the records from both the users and roles tables.

USE join_example_db;
SELECT *
FROM users
JOIN roles ON users.role_id = roles.id

There were 4 users because only four users had role_ids given to them

2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
Before you run each query, guess the expected number of results.
 
 LEFT JOIN = 6 results
 RIGHT JOIN = 5 rows (which did not include the fifth id)


3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
Hint: You will also need to use group by in the query.

*/
/*

1. Use the employees database.
/fin

2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department 
along with the name of the current manager for that department.

USE employees;

SELECT CONCAT(c.first_name, " ",c.last_name) AS "Department Manager", 
	a.dept_name AS Department
FROM employees AS c

JOIN dept_manager AS b ON c.emp_no = b.emp_no
JOIN departments AS a ON b.dept_no = a.dept_no

WHERE to_date NOT LIKE "9999%"


3. Find the name of all departments currently managed by women.

USE employees;

SELECT CONCAT(c.first_name, " ",c.last_name) AS "Department Manager", 
	a.dept_name AS Department,
    b.to_date

FROM employees AS c

JOIN dept_manager AS b ON c.emp_no = b.emp_no
    AND b.to_date > CURDATE()
    AND c.gender ="F"
    JOIN departments AS a USING (dept_no) -- using does the same thing as the ON statement from above

4. Find the current titles of employees currently working in the Customer Service department.

SELECT d.title, 
	COUNT(e.emp_no) AS 'Count'
FROM dept_emp AS e
JOIN titles AS d ON e.emp_no = d.emp_no
	AND d.to_date > CURDATE()
    AND e.to_date > CURDATE()
JOIN departments AS a ON e.dept_no = a.dept_no
	AND a.dept_name = "Customer Service"
    
GROUP BY d.title


5. Find the current salary of all current managers.


SELECT CONCAT(e.first_name, " ",e.last_name) AS "Name", 
	d.dept_name AS "Department Name",
    s.salary AS "Salary"
    
FROM employees AS e
JOIN salaries s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND dm.to_date > CURDATE()
JOIN departments AS d ON dm.dept_no = d.dept_no

ORDER BY s.salary desc


6. Find the number of current employees in each department.

SELECT * FROM departments;
 SELECT * FROM dept_emp;
 
SELECT d.dept_no,
	d.dept_name,
    COUNT(emp_no) AS "Number of Employees"
FROM dept_emp AS de

JOIN departments AS d ON de.dept_no = d.dept_no
	AND de.to_date > CURDATE()

GROUP BY d.dept_no, d.dept_name
ORDER BY d.dept_no


7. Which department has the highest average salary? Hint: Use current not historic information.

USE employees;
 
SELECT d.dept_name, 
	AVG(salary) AS average_salary
FROM dept_emp de
JOIN salaries AS s ON de.emp_no = s.emp_no
	AND de.to_date > CURDATE()
    AND s.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY average_salary desc
LIMIT 1


8. Who is the highest paid employee in the Marketing department?


SELECT * 
FROM employees
JOIN dept_emp AS de ON e.emp_no = de.emp_no
	AND de.to_date > CURDATE()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d ON de.dept_no =d.dept_no
	AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1


9. Which current department manager has the highest salary?

SELECT e.first_name, e.last_name, CONCAT('$ ', FORMAT(s.salary, 2)), d.dept_name 
FROM employees AS e

JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND dm.to_date > CURDATE()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d ON dm.dept_no = d.dept_no
ORDER BY s.salary DESC
LIMIT 1


10. Determine the average salary for each department. Use all salary information and round your results.

SELECT d.dept_name, CONCAT('$ ',ROUND(s.salary),2) AS average_salary
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN salaries AS s ON de.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY s.salary DESC