--List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no
--To prevent duplicates
GROUP BY e.emp_no, e.first_name, e.last_name, e.gender, s.salary;

--List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;

--List the manager of each department with the following information: 
--department number , department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM departments d, employees e, dept_manager dm
WHERE d.dept_no = dm.dept_no AND e.emp_no = dm.emp_no 
GROUP BY d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
ORDER BY "dept_no" ASC;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM  employees e, departments d, dept_emp de
WHERE e.emp_no = de.emp_no AND d.dept_no = de.dept_no AND
	--select employee department from the latest "from_date"
		(de.emp_no, de.from_date) IN(
		SELECT emp_no, MAX(from_date) AS from_date
		FROM dept_emp  
		GROUP BY emp_no)
GROUP BY e.emp_no, e.first_name, e.last_name, d.dept_name;
	
--List all employees whose first name is "Hercules" and last names begin with "B"
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC;

--List all employees currently in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_emp de
WHERE d.dept_name = 'Sales' AND de.dept_emp_no LIKE 'd007%' AND e.emp_no = de.emp_no AND to_date = '9999-01-01'
GROUP BY e.emp_no, e.last_name, e.first_name, d.dept_name

--List all employees currently in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_emp de
WHERE ((d.dept_name = 'Sales' AND de.dept_emp_no LIKE 'd007%' AND e.emp_no = de.emp_no AND to_date = '9999-01-01')
	OR (d.dept_name = 'Development' AND de.dept_emp_no LIKE 'd005%' AND e.emp_no = de.emp_no AND to_date = '9999-01-01'))
	AND e.emp_no = de.emp_no
GROUP BY e.emp_no, e.last_name, e.first_name, d.dept_name;

--TEST
--List all employees currently in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_emp de
WHERE ((d.dept_name = 'Sales' AND de.dept_no = 'd007' AND e.emp_no = de.emp_no AND to_date = '9999-01-01')
	OR (d.dept_name = 'Development' AND de.dept_no = 'd005' AND e.emp_no = de.emp_no AND to_date = '9999-01-01'))
	AND e.emp_no = de.emp_no
GROUP BY e.emp_no, e.last_name, e.first_name, d.dept_name;

--TEST
--List all employees currently in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_emp de
WHERE d.dept_name = 'Sales' AND de.dept_emp_no LIKE 'd007%' AND e.emp_no = de.emp_no AND to_date = '9999-01-01'
GROUP BY e.emp_no, e.last_name, e.first_name, d.dept_name

--In descending order, how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;