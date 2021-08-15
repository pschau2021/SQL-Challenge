--Create departments table
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
PRIMARY KEY(dept_no),
dept_no VARCHAR NOT NULL,
dept_name VARCHAR NOT NULL
);

select * from departments

--Create department employee table
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
emp_no	INT NOT NULL,
dept_no VARCHAR NOT NULL
);

select * from dept_emp

--Create department manager table
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no	VARCHAR NOT NULL,
emp_no INT NOT NULL
);

select * from dept_manager

--Create employees table
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
PRIMARY KEY(emp_no),
FOREIGN KEY (emp_title_id) REFERENCES title(title_id),
emp_no INT NOT NULL,	
emp_title_id VARCHAR NOT NULL,
birth_date VARCHAR NOT NULL,
first_name VARCHAR NOT NULL,	
last_name VARCHAR NOT NULL,	
sex VARCHAR NOT NULL,	
hire_date VARCHAR NOT NULL
);

select * from employees

--Create salaries table
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
emp_no INT NOT NULL,
salary INT NOT NULL
);

select * from salaries

--Create titles table
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
PRIMARY KEY (title_id),
title_id VARCHAR NOT NULL,
title VARCHAR NOT NULL
);
	
select * from titles