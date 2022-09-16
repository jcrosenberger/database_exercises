/*

1. Create a new SQL script named limit_exercises.sql.
/fin 

2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. 
For example, to find all the unique titles within the company, we could run the following query:

SELECT DISTINCT title FROM titles;
List the first 10 distinct last name sorted in descending order.

    Code used:
        SELECT DISTINCT last_name FROM employees
        ORDER BY last_name desc 
        LIMIT 10

3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees 
hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment 
in your code that lists the five names of the employees returned.

    Code used:
        SELECT last_name,first_name,hire_date FROM employees
        WHERE hire_date LIKE '199%'
        ORDER BY hire_date asc
        LIMIT 5       
    ANSWER:
        'Hainaut','Aiman'
        'Stiles','Lillian'
        'Sridhar','Teruyuki'
        'Demeyer','Sashi'
        'Rattan','Tomofumi'

4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The 
five after that would be your second page, etc. Update the query to find the tenth page of results.

LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET 
(number of results to skip), LIMIT (number of results per page), and the page number?

Limit gives maximum parameters to the number of results which will be produced.
Offset tells the server where to begin providing those results.

Put together in a batch, the SQL programmer can fill printed pages with neatly sorted results from queries.
For example, if we want 5 pages of results printed with 25 lines of output per page, we would limit 25 units
and then offset them by 25 for 5 iterations. 

*/