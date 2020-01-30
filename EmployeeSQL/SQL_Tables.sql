--Create Tables

CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name varchar
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date DATE
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR,
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles(
	emp_no INT,
	title VARCHAR,
	from_date DATE,
	to_date DATE
);