--List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;
	
--List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
--department number , department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name,dept_manager.from_date,dept_manager.to_date
FROM dept_manager, departments, employees
WHERE dept_manager.dept_no = departments.dept_no AND dept_manager.emp_no = employees.emp_no
ORDER BY "dept_no" ASC;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM dept_emp, employees, departments
WHERE dept_emp.emp_no = employees.emp_no AND dept_emp.dept_no = departments.dept_no AND 
	--select department from the latest "from_date"
	(dept_emp.emp_no, dept_emp.from_date) in(
		select emp_no, max(from_date)as from_date 
		from dept_emp 
		group by emp_no
	);
	
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
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp, employees, departments
WHERE dept_emp.emp_no = employees.emp_no AND departments.dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp, employees, departments
WHERE dept_emp.emp_no = employees.emp_no AND ((departments.dept_name = 'Sales') OR (departments.dept_name = 'Development')) 
											  
--In descending order, how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;