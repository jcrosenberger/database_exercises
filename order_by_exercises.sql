/*
1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
    completed first part. Did not copy previous exercises into this document

2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?
    Code used:
        SELECT first_name, last_name 
        FROM employees
        WHERE  first_name =  'Irena' OR first_name = 'Vidya' or first_name = 'Maya'
        ORDER BY first_name
    Answer:
        Irena Reutenauer - first person
        Vidya Simmen - last person

3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and 
then last name. In your comments, answer: What was the first and last name in the first row of the results? What was 
the first and last name of the last person in the table?
    Code used:
        SELECT first_name, last_name 
        FROM employees
        WHERE  first_name =  'Irena' OR first_name = 'Vidya' or first_name = 'Maya'
        ORDER BY first_name, last_name
    Answer:
        Irena Acton - first person
        Vidya Zweizig - last person

4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name 
and then first name. In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?
    Code used:
        SELECT first_name, last_name 
        FROM employees
        WHERE  first_name =  'Irena' OR first_name = 'Vidya' or first_name = 'Maya'
        ORDER BY last_name, first_name
    Answer:
        Irena Acton - first person
        Maya Zyda - last person

5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their 
employee number. Enter a comment with the number of employees returned, the first employee number and their 
first and last name, and the last employee number with their first and last name.
    Code used:
        SELECT first_name, last_name 
        FROM employees
        WHERE  last_name LIKE 'E%E' 
        ORDER BY emp_no
    Answer:
        899 employees
        10021 Ramzi Erde
        499648 Tadahiro Erde

6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their 
hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, 
the name of the newest employee, and the name of the oldest employee.
    Code used:
        SELECT first_name, last_name 
        FROM employees
        WHERE  last_name LIKE 'E%E' 
        ORDER BY hire_date
    Answer:
        899 employees
        233488 Sergi Erde
        67892 Teiji Erde


Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who 
was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest 
employee who was hired last, and the name of the youngest employee who was hired first.
    Code used:
        SELECT emp_no, first_name, last_name 
        FROM employees
        WHERE  hire_date LIKE '199%' AND birth_date LIKE '%12-25' 
        ORDER BY hire_date
    Answer: 
*/