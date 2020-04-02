-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--Create tables in the datebase base and based on relations between them
CREATE TABLE "departments" (
    "dept_no" CHAR(5)   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" CHAR(4)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
	CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" CHAR(4)   NOT NULL,
	"emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
	CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

SELECT * FROM dept_manager;

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;

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


