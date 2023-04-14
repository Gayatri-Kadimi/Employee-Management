-- 1. Select employees first name, last name, job_id and salary whose first name starts with alphabet S
select first_name,last_name,job_id,salary from employees where first_name like 's%';

-- 2. Write a query to select employee with the highest salary
select first_name,last_name,job_id,salary from employees where salary =(select max(salary) from employees);

-- 3. Select employee with the second highest salary
select first_name,last_name,job_id,salary from employees where salary<(select max(salary) from employees) limit 1;

select employee_id,first_name,last_name,job_id,salary from employees  where salary != (select max(salary) from employees)
  order by salary desc  limit 1;
  
  -- 4. Fetch employees with 2nd or 3rd highest salary
  select employee_id,first_name,last_name,job_id,salary from employees a where 2 =(select count(distinct salary) from employees b
  where a.salary<b.salary);
  
    select employee_id,first_name,last_name,job_id,salary from employees a where 2 =(select count(distinct salary) from employees b
  where b.salary>a.salary);
  
   set @input:=1;
 select employee_id, 
        first_name,
        last_name,
        job_id,
        salary 
 from employees e 
 where @input =(select COUNT(DISTINCT Salary) 
           from employees p 
           where e.Salary<=p.Salary);
           
           
-- 5. Write a query to select employees and their corresponding managers and their salaries
select concat(emp.first_name,' ',emp.last_name) employee_name,emp.salary,concat(mng.first_name,' ',mng.last_name) manager_name,mng.salary
from employees emp join employees mng
on emp.manager_id=mng.employee_id;

-- 6. Write a query to show count of employees under each manager in descending order

 select 
 sup.employee_id employee_id,
     concat(sup.first_name,' ', sup.last_name)manager_name,
     COUNT(sub.employee_id) AS number_of_reportees
 from employees sub 
 join employees sup 
 on sub.manager_id = sup.employee_id
 group by sup.employee_id, sup.first_name, sup.last_name
 order by 3 desc;
 
 
  select 
 m.employee_id employee_id,
     concat(m.first_name,' ', m.last_name)manager_name,
     COUNT(e.employee_id) AS number_of_reportees
 from employees e
 join employees m
 on e.manager_id = m.employee_id
 group by m.employee_id, m.first_name, m.last_name
 order by 3 desc;
 
--  7. Find the count of employees in each department
select d.department_id,department_name,count(*) total_employees from employees e 
join departments d on e.department_id=d.department_id
group by d.department_id
order by total_employees desc;

select dept.department_name,
 count(emp.employee_id) emp_count
 from employees emp
 join departments dept on emp.department_id = dept.department_id
 group by dept.department_name
 order by 2 desc;
 
--  8. Get the count of employees hired year wise
select year(hire_date) year,count(*) Total_employees from employees
group by year
order by Total_employees desc;

-- 9. Find the salary range of employees
 select min(salary) min_sal, 
 max(salary) max_sal,
 round(avg(salary)) avg_sal
 from employees;

-- 10. Write a query to divide people into three groups based on their salaries
select first_name,last_name,salary,
case 
when salary<5000 then 'low'
when salary<10000 then 'med'
else 
'high' 
end salary_level
from employees
order by salary desc;

-- 11. Select the employees whose first_name contains “an”
select * from employees where first_name like '%an%';

-- 12. Select employee first name and the corresponding phone number in the format (_ _ _)-(_ _ _)-(_ _ _ _)
 select concat(first_name, ' ', last_name) employee,
 replace(phone_number,'.','-') phone_number
 from employees;

-- 13. Find the employees who joined in August, 1994.
select first_name,last_name,hire_date from employees
where monthname(hire_date)='august' and year(hire_date)=1994;

-- 14. Write an SQL query to display employees who earn more than the average salary in that company
select employee_id,first_name,last_name,salary from employees where salary>(select avg(salary) from employees);

 -- 15. Find the maximum salary from each department.
 select d.department_id,department_name,max(e.salary)
 from employees e join departments d
 on e.department_id=d.department_id
  group by d.department_name,d.department_id
 order by d.department_id;
 
 -- 16. Write a SQL query to display the 5 least earning employees
 select last_name,first_name,salary from employees 
 order by salary
 limit 5;
 
 -- 17. Find the employees hired in the 80s
 select first_name,last_name,hire_date from employees
 where year(hire_date) between 1980 and 1989 ;
 
 -- 18. Display the employees first name and the name in reverse order
select lower(first_name)name,lower(reverse(first_name)) name_in_reverse from employees;

-- 19. Find the employees who joined the company after 15th of the month
select first_name,last_name,hire_date from employees
where day(hire_date) between 15 and 31;

select first_name,last_name,hire_date from employees
where day(hire_date)>15;

-- 20. Display the managers and the reporting employees who work in different departments

 select 
  concat(mgr.first_name,' ',mgr.last_name) manager,
  concat(emp.first_name,' ',emp.last_name) employee,
  mgr.department_id mgr_dept,
  emp.department_id emp_dept
  from employees emp
  join employees mgr on emp.manager_id = mgr.employee_id
  where emp.department_id != mgr.department_id
  order by 1;
  
  ------------------------------------------------------------------------------------------------------------------------------------------
  
  
