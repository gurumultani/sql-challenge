# sql-challenge

# Employee Database SQL Readme
This README provides an overview of the SQL code for creating and querying an employee database. This database includes tables for employee information, departments, salaries, and titles. The SQL code is organized into sections, each addressing a specific task or query related to the employee database.

# Table Creation
departments table: Stores department information, including department number and name.

employees table: Contains employee details such as employee number, birth date, first name, last name, sex, and hire date.

dept_emp table: Represents the relationship between employees and departments, with foreign keys referencing the employees and departments tables.

dept_manager table: Stores information about department managers, linking them to departments and employees.

salaries table: Holds salary information for employees, with a foreign key referencing the employees table.

titles table: Contains employee job titles and their corresponding IDs.

# Queries

## Basic Queries

Query 1: Lists employee numbers, last names, first names, sex, and salaries for each employee by joining the employees and salaries tables.

Query 2: Lists the first names, last names, and hire dates of employees hired in the year 1986.

Query 3: Lists the department number, department name, manager's employee number, manager's last name, and manager's first name for each department by joining the departments, dept_manager, and employees tables.

Query 4: Lists the department number, employee number, last name, first name, and department name for each employee by joining the employees, dept_emp, and departments tables.

## Filtered Queries

Query 5: Lists the first name, last name, and sex of employees with the first name "Hercules" and last names starting with "B".

Query 6: Lists employees in the "Sales" department, including their employee number, last name, and first name.

Query 7: Lists employees in the "Sales" and "Development" departments, including their employee number, last name, first name, and department name.

# Aggregated Query

Query 8: Lists the frequency counts (in descending order) of employee last names, showing how many employees share each last name.

