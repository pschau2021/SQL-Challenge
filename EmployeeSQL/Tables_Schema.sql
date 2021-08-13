--Create departments table
DROP TABLE IF EXISTS departments cascade;
CREATE TABLE departments (
    dept_no varchar(10) NOT NULL primary key,
    dept_name varchar(30) NOT NULL
);

--Create department employee table
DROP TABLE IF EXISTS dept_emp cascade;
CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)	
);

--Create department manager table
DROP TABLE IF EXISTS dept_manager cascade;
CREATE TABLE dept_manager (
    dept_no varchar(4) NOT NULL,
    emp_no int NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Create employees table
DROP TABLE IF EXISTS employees cascade;
CREATE TABLE Employees (
	emp_no INT PRIMARY KEY,
	title_id VARCHAR(200) NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR(200) NOT NULL,
	last_name  VARCHAR(200) NOT NULL,
	sex VARCHAR(200) NOT NULL,
	hire_date date NOT NULL
);  

--Create salaries table
DROP TABLE IF EXISTS salaries cascade;
CREATE TABLE salaries (
    emp_no int PRIMARY KEY NOT NULL,
    salary int NOT NULL,
   	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Create titles table
DROP TABLE IF EXISTS titles cascade;
CREATE TABLE titles (
	title_id VARCHAR(200) PRIMARY KEY,
	title VARCHAR(200) NOT NULL
);

--Import departments data to table
copy departments from 'C:\data\departments.csv'
with (format csv, header);

--Import department employee data to table
copy dept_emp from 'C:\data\dept_emp.csv'
with (format csv, header);

--Import department manager data to table
copy dept_manager from 'C:\data\dept_manager.csv'
with (format csv, header);

--Import employees data to table
copy employees from 'C:\data\employees.csv'
with (format csv, header);

--Import salaries data to table
copy salaries from 'C:\data\salaries.csv'
with (format csv, header);

--Import titles to table
copy titles from 'C:\data\titles.csv'
with (format csv, header);