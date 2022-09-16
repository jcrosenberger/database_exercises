/*
1. Copy the order by exercise and save it as functions_exercises.sql.
    /fin

2. Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their 
first and last name together as a single column named full_name.
    Code used:
        SELECT CONCAT(first_name, last_name) FROM employees
        WHERE last_name LIKE '%E%'

3. Convert the names produced in your last query to all uppercase.
    Code used:
        SELECT UPPER(CONCAT(first_name, last_name)) FROM employees
        WHERE last_name LIKE '%E%'

4. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they 
have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
        SELECT CONCAT(first_name, ' ',last_name), DATEDIFF(NOW(), hire_date) AS days_with_company
        FROM employees
        WHERE hire_date LIKE '199%'
            AND birth_date LIKE '%12-25'

5. Find the smallest and largest current salary from the salaries table.
        SELECT MIN(salary), MAX(salary)
        FROM salaries
        WHERE to_date > CURDATE()


6. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should 
be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the 
employees last name, an underscore, the month the employee was born, and the last two digits of the year that they 
were born. Below is an example of what the first 10 rows will look like:
Code used: 
    SELECT first_name, last_name, birth_date,
	    LOWER(
		    CONCAT(
			    SUBSTRING(first_name,1,1),
			    SUBSTRING(last_name, 1,4),
                '_',
                SUBSTRING(birth_date, 6,2),
                SUBSTRING(birth_date, 3,2)
                )
		    )
            AS user_name
    FROM employees 
    LIMIT 100

        





*/