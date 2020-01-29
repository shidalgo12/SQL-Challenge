--Create Tables
create table departments(
	dept_no varchar,
	dept_name varchar
);

create table dept_emp(
	dept_emp_no varchar,
	emp_no INT,
	dept_no varchar,
	from_date DATE,
	to_date DATE
);

create table dept_manager(
	dept_no varchar,
	emp_no INT,
	from_date DATE,
	to_date DATE
);

create table employees(
	emp_no INT,
	birth_date DATE,
	first_name varchar,
	last_name varchar,
	gender varchar,
	hire_date DATE
);

create table salaries(
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE
);

create table titles(
	emp_no INT,
	title varchar,
	from_date DATE,
	to_date DATE
);