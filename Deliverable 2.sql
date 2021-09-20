--Deliverable 2: The Employees Eligible for the Mentorship Program

--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.

SELECT emp_no, first_name, last_name, birth_date
FROM employees;

--Retrieve the from_date and to_date columns from the Department Employee table.

SELECT from_date, to_date
FROM dept_emp;

--Retrieve the title column from the Titles table.

SELECT title
FROM titles;

--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON(employees.emp_no) employees.emp_no, 
    employees.first_name, 
    employees.last_name, 
    employees.birth_date,
    dept_emp.from_date,
    dept_emp.to_date,
    titles.title
FROM employees
Left outer Join dept_emp 
ON (employees.emp_no = dept_emp.emp_no)
Left outer Join titles 
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;

--Create a new table(mentorship_eligibilty) using the INTO clause

SELECT DISTINCT ON(employees.emp_no) employees.emp_no, 
    employees.first_name, 
    employees.last_name, 
    employees.birth_date,
    dept_emp.from_date,
    dept_emp.to_date,
    titles.title
INTO mentorship_eligibilty
FROM employees
Left outer Join dept_emp 
ON (employees.emp_no = dept_emp.emp_no)
Left outer Join titles 
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;

select * from  mentorship_eligibilty;
