
--Deliverable 1


--Deliverable 1
--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
	 
SELECT emp_no, first_name, last_name
FROM employees;

--Retrieve the title, from_date, and to_date columns from the Titles table.

SELECT title, from_date, to_date
FROM titles;
	 

--Create a new table using the INTO clause

SELECT employees.emp_no,
	 employees.first_name,
	 employees.last_name,
     titles.title,
     titles.from_date,
     titles.to_date
INTO New_table
FROM employees

--Join both tables on the primary key in New_table
INNER JOIN titles
ON employees.emp_no = titles.emp_no

--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no;


select * from New_table;

-- Use Dictinct with Orderby to remove duplicate rows


SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
FROM New_table
ORDER BY emp_no, title DESC;


--retrieve the number of employees by their most recent job title who are about to retire.
--retrieve the number of titles from the retiring_titles table.

SELECT COUNT(New_table.emp_no),
New_table.title
INTO retiring_titles
FROM New_table 
GROUP BY title 
ORDER BY COUNT(title) DESC;

select * from retiring_titles;


--------------------------------------




