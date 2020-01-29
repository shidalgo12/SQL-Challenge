--List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no
--To prevent duplicates
GROUP BY e.emp_no, e.first_name, e.last_name, e.gender, s.salary;

--List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
--department number , department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager dm, departments d, employees e
WHERE d.dept_no = dm.dept_no AND e.emp_no = dm.emp_no 
ORDER BY "dept_no" ASC;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM  employees e, departments d, dept_emp de
WHERE e.emp_no = de.emp_no AND d.dept_no = de.dept_no AND
	--select employee department from the latest "from_date"
		(de.emp_no, de.from_date) in(
		select emp_no, max(from_date) as from_date
		from dept_emp  
		group by emp_no)
--To prevent duplicates
GROUP BY e.emp_no, e.first_name, e.last_name, d.dept_name;

--select username, date, value
--from tablename where (username, date) in (
    --select username, max(date) as date
    --from tablename
    --group by username)
	--https://stackoverflow.com/questions/2411559/how-do-i-query-sql-for-a-latest-record-date-for-each-user;
	
--List all employees whose first name is "Hercules" and last names begin with "B"
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de, employees e, departments d
WHERE d.dept_name = 'Sales' AND de.dept_emp_no LIKE 'd007%' AND e.emp_no = de.emp_no
GROUP BY de.emp_no, e.last_name, e.first_name, d.dept_name

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de, employees e, departments d
WHERE ((d.dept_name = 'Sales') OR (d.dept_name = 'Development')) AND ((de.dept_emp_no LIKE 'd007%') OR (de.dept_emp_no LIKE 'd005%')) AND e.emp_no = de.emp_no
GROUP BY de.emp_no, e.last_name, e.first_name, d.dept_name;

--SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
--FROM dept_emp, employees, departments
--WHERE dept_emp.emp_no = employees.emp_no AND ((departments.dept_name = 'Sales') OR (departments.dept_name = 'Development')) 
											  
--In descending order, how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;