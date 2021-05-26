
--list the employee number, last name, first name, gender, and salary of each empolyee.
SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees 
LEFT JOIN salaries
ON employees.emp_no=salaries.emp_no

--list all employees who were hired in 1986
SELECT first_name, last_name,hire_date
FROM employees
WHERE CAST(hire_date AS CHAR(10)) LIKE '1986%';

--list department number, department name,employee number, last name, first name, and start and end employment dates for the manager of each departmentSELECT departments.dept_no, dept_name, dept_manager.emp_no, last_name, first_name, from_date,to_date
SELECT dept_no, dept_manager.emp_no, first_name, last_name, from_date, to_date
FROM dept_manager
LEFT JOIN employees
ON dept_manager.emp_no=employees.emp_no;


SELECT b.dept_no, dept_name,emp_no, first_name, last_name, from_date, to_date
FROM departments AS a
RIGHT JOIN (
	SELECT dept_no, dept_manager.emp_no, first_name, last_name, from_date, to_date
	FROM dept_manager
	LEFT JOIN employees
	ON dept_manager.emp_no=employees.emp_no
) AS b
ON a.dept_no =b.dept_no;

--list employee number, last name, first name, and department name of each employee
SELECT dept_emp.emp_no, dept_no, first_name, last_name
FROM dept_emp
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no;

SELECT emp_no,last_name, first_name, dept_name
FROM departments AS c
RIGHT JOIN (
	SELECT dept_emp.emp_no, dept_no, first_name, last_name
	FROM dept_emp
	LEFT JOIN employees
	ON dept_emp.emp_no = employees.emp_no
) AS d
ON c.dept_no=d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

--List employee number, last name, first name, and department name for all employees in the sales department
SELECT emp_no,last_name, first_name, dept_name
FROM departments AS c
RIGHT JOIN (
	SELECT dept_emp.emp_no, dept_no, first_name, last_name
	FROM dept_emp
	LEFT JOIN employees
	ON dept_emp.emp_no = employees.emp_no
) AS d
ON c.dept_no=d.dept_no
WHERE dept_name='Sales';

--List employee number, last name, first name, and department name for all employees in the sales department and development departments
SELECT emp_no,last_name, first_name, dept_name
FROM departments AS c
RIGHT JOIN (
	SELECT dept_emp.emp_no, dept_no, first_name, last_name
	FROM dept_emp
	LEFT JOIN employees
	ON dept_emp.emp_no = employees.emp_no
) AS d
ON c.dept_no=d.dept_no
WHERE dept_name='Sales'
OR dept_name='Development';

--List the frequency count of employee last names in decending order 
SELECT last_name,COUNT(last_name) AS "Last Name Counts"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Counts" DESC;


SELECT * FROM employees;
SELECT* 
FROM employees
WHERE emp_no = 499942;


