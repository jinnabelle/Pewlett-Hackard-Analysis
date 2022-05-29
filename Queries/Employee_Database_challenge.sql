--1. retrieve emp_no, first_name, last_name from employees
SELECT emp_no,
	first_name,
	last_name
FROM employees;

--2. retrive title, from_date, to_date from titles
SELECT title,
	from_date,
	to_date
FROM titles;

--3/4/5 join, create and filter table
SELECT e.emp_no,
e.first_name,
e.last_name,
tt.title,
tt.from_date,
tt.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as tt
ON (e.emp_no = tt.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_emp
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--16. retiring titles
SELECT COUNT(emp_no) AS count_of
, title
INTO retiring_titles
FROM unique_emp
GROUP BY title
ORDER BY 1 DESC;
