-- Create Departments table
CREATE TABLE departments (
    dept_no VARCHAR(50) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(50) NOT NULL
);

SELECT * FROM DEPARTMENTS LIMIT 100;

--Create employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);


SELECT * FROM employees LIMIT 100;


-- Create DeptEmp table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(50) NOT NULL,	
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_emp LIMIT 100;

-- Create DeptManager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(50) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager LIMIT 100;


-- Create salaries table
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries LIMIT 100;

-- Create Titles table
CREATE TABLE Titles (
    title_id VARCHAR(50) PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL
);

SELECT * FROM titles LIMIT 100;

--Listing the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;

--Listing the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--Listing the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT
    d.dept_no AS department_number,
    d.dept_name AS department_name ,
    dm.emp_no AS manager_employee_number,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM
    departments d
JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
JOIN
    employees e ON dm.emp_no = e.emp_no;

--Listing the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT 
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_no AS department_number,
    d.dept_name AS department_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no;

--Listing first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT
    first_name,
    last_name,
    sex
FROM
    employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';

--Listing each employee in the Sales department, including their employee number, last name, and first name

SELECT
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';


--Listing each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 

SELECT
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_name AS department_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');
	
--Listing the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 

SELECT
    last_name,
    COUNT(*) AS name_frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    name_frequency DESC;

	
