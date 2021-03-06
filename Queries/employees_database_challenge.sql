select employees.emp_number,
		employees.first_name,
		employees.last_name,
		job_titles.title,
		job_titles.start_date,
		job_titles.end_date
INTO retirement_titles
from employees
inner join job_titles
on employees.emp_number = job_titles.emp_number
where (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by employees.emp_number;
		


select distinct on (emp_number) emp_number,
		first_name,
		last_name,
		title,
		start_date,
		end_date
INTO unique_titles
from retirement_titles
where end_date = '9999-01-01'
order by emp_number;

select count(emp_number), title
into retiring_titles
from unique_titles
group by title
order by count(emp_number) desc



select distinct on (employees.emp_number) employees.emp_number,
		employees.first_name,
		employees.last_name,
		employees.birth_date,
		job_titles.title,
		dept_emps.start_date,
		dept_emps.end_date
INTO mentorship_eligibility
from employees
inner join job_titles
on employees.emp_number = job_titles.emp_number
inner join dept_emps
on employees.emp_number = dept_emps.emp_number
where (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
and dept_emps.end_date = '9999-01-01' and job_titles.end_date = '9999-01-01'
order by employees.emp_number;


