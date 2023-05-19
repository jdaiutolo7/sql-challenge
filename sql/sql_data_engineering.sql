DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no INT,
    emp_title_id VARCHAR NOT NULL,
    birth_date VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date VARCHAR NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id)
	REFERENCES titles (title_id)
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no)
	REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no)
	REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
	emp_no INT,
	FOREIGN KEY (emp_no)
	REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE salaries (
    emp_no INT,
    salary INT,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no)
	REFERENCES employees (emp_no)
);