
--get counts from all tables

select count(*) from employee;
select count(*) from department;
select count(*) from dept_emp;
select count(*) from dept_manager;
select count(*) from salarie;
select count(*) from title;

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no,e.last_name,e.first_name,e.gender,s.salary
from employee e inner join salarie s on (e.emp_no = s.emp_no);

--2. List employees who were hired in 1986.

select * from employee where extract(year from hire_date) = 1986;

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.

select d.dept_no, d.dept_name ,e.emp_no,e.last_name,e.first_name, dm.from_date as start_date, dm.to_date as end_date
from employee e inner join dept_manager dm on (e.emp_no = dm.emp_no)
inner join department d on (d.dept_no = dm.dept_no) order by emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name, d.dept_name as department_name
from employee e inner join dept_emp de on (e.emp_no = de.emp_no)
inner join department d on (d.dept_no = de.dept_no) order by emp_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

select * from employee where first_name = 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name, d.dept_name as department_name
from employee e inner join dept_emp de on (e.emp_no = de.emp_no)
inner join department d on (d.dept_no = de.dept_no) 
where d.dept_no in (select dept_no from department where dept_name ='Sales')
order by emp_no;

 -- Second way
 
 select e.emp_no,e.last_name,e.first_name, d.dept_name as department_name
from employee e inner join dept_emp de on (e.emp_no = de.emp_no)
inner join department d on (d.dept_no = de.dept_no) 
where d.dept_name ='Sales'
order by emp_no;


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no,e.last_name,e.first_name, d.dept_name as department_name
from employee e inner join dept_emp de on (e.emp_no = de.emp_no)
inner join department d on (d.dept_no = de.dept_no) 
where d.dept_no in (select dept_no from department where dept_name in('Sales','Development'))
order by emp_no;
--Second way :

select e.emp_no,e.last_name,e.first_name, d.dept_name as department_name
from employee e inner join dept_emp de on (e.emp_no = de.emp_no)
inner join department d on (d.dept_no = de.dept_no) 
where d.dept_name in('Sales','Development')
order by emp_no;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select count(*) as same_lastname_cnt,last_name from employee
group by last_name
order by count(*) desc;