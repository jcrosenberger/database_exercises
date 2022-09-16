/*
1. Create a new file named group_by_exercises.sql

2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? 
Answer that in a comment in your SQL file.
    SELECT DISTINCT title
    FROM titles

    ANSWER: 
    7 titles

3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
        SELECT last_name
        FROM employees
        WHERE last_name LIKE 'E%E'
        GROUP BY last_name

        Answer:
        5 names

4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and 
end with 'E'.
    SELECT
    	CONCAT(first_name,' ', last_name)
        AS name
    FROM employees
    WHERE last_name LIKE 'E%E'
    GROUP BY name 

    ANSWER:
    846 people

5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
        SELECT last_name
        FROM employees
        WHERE last_name LIKE '%q%'
	        AND last_name NOT LIKE '%qu'
        GROUP BY last_name

    ANSWER:
    10 people

6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
        SELECT last_name, COUNT(last_name) AS number_of_employees
        FROM employees
        WHERE last_name LIKE '%q%'
	        AND last_name NOT LIKE '%qu%'
        GROUP BY last_name


7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of 
employees for each gender with those names.
 
        SELECT gender, first_name, count(gender) AS number_per_gender
        FROM employees
        WHERE first_name IN ('Irena', 'Vidya','Maya')
        GROUP BY gender, first_name

8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. 
Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

SELECT COUNT(*) as dupe_count,
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
GROUP BY user_name

The above code gave me 300024 unique user names? I don't like my answer. 


Running different code, I can find plenty of duplicate user names. 
        SELECT COUNT(*) AS number,
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
        GROUP BY user_name
        HAVING number > 1
        ORDER BY number desc

With THAT code, I came up with 13251 duplicate user names (but not the total of people with duplicate usernames)


Does this code work well?

        select sum(total) total_dupes
        from(
	        SELECT COUNT(*) total,
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
            GROUP BY user_name
            HAVING total > 1
             ) src

    The result was 27,403 total duplicate usernames between all the people


9. Bonus: More practice with aggregate functions:

Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll 
probably be grouping by that exact column.
Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one 
for each department and the employee count.
Determine how many different salaries each employee has had. This includes both historic and current.
Find the maximum salary for each employee.
Find the minimum salary for each employee.
Find the standard deviation of salaries for each employee.
Now find the max salary for each employee where that max salary is greater than $150,000.
Find the average salary for each employee where that average salary is between $80k and $90k.
*/