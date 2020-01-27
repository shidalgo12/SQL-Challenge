--List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;
	
--List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.


--List the department of each employee with the following information: employee number, last name, first name, and department name.


--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


--In descending order, how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;