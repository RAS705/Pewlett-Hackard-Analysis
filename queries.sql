SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';


-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
into retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Retirement eligibility
SELECT count(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_number,
     dm.start_date,
     dm.end_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_number = dm.dept_number;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_number,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emps.end_date
From retirement_info
left join dept_emps
ON retirement_info.emp_number = dept_emps.emp_number;

SELECT ri.emp_number,
    ri.first_name,
    ri.last_name,
	de.end_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emps as de
ON ri.emp_number = de.emp_number
where de.end_date = ('9999-01-01');


-- Employee count by department number
SELECT COUNT(ce.emp_number), de.dept_number
into ret_department
FROM current_emp as ce
LEFT JOIN dept_emps as de
ON ce.emp_number = de.emp_number
GROUP BY de.dept_number
ORDER BY de.dept_number;

SELECT * FROM salaries
ORDER BY end_date DESC;

SELECT employees.emp_number,
    employees.first_name,
	employees.last_name,
    employees.gender,
	salaries.salary,
	dept_emps.end_date
INTO emp_info
FROM employees
INNER JOIN salaries
ON (employees.emp_number = salaries.emp_number)
INNER JOIN dept_emps
ON (employees.emp_number = dept_emps.emp_number)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
and (dept_emps.end_date = '9999-01-01');


-- List of managers per department
SELECT  dm.dept_number,
        d.dept_name,
        dm.emp_number,
        ce.last_name,
        ce.first_name,
        dm.start_date,
        dm.end_date
--INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_number = d.dept_number)
    INNER JOIN current_emp AS ce
        ON (dm.emp_number = ce.emp_number);
		
SELECT ce.emp_number,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emps AS de
ON (ce.emp_number = de.emp_number)
INNER JOIN departments AS d
ON (de.dept_number = d.dept_number);


