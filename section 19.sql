use employees;
commit;

delimiter $$
create trigger before_salaries_insert
before insert on salaries
for each row
begin
 if new.salary < 0 then
  set new.salary = 0;
  end if;
end $$  

select * from salaries
where emp_no = 10001;

insert into salaries values ('10001' , '-90000' , '1995-02-16' , '2000-05-10');


delimiter $$
create trigger hire_date
BEFORE INSERT ON employees
FOR EACH ROW  
BEGIN  
IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN     
SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');     
END IF;  
END $$  
DELIMITER ;  

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  
SELECT  *  FROM  employees
ORDER BY emp_no DESC;

select * from employees
where hire_date > '2000-01-01';

create index i_hire_date
on employees (hire_date);


select * from employees
where first_name = 'Georgi' and last_name = 'Facello';

create index i_composite
on employees (first_name, last_name);


ALTER TABLE employees
DROP INDEX i_hire_date;

select * from salaries
where salary > '89000';

create index i_salary
on salaries (salary);

SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'MALE'
        ELSE 'FEMALE'
    END AS gender
FROM
    employees;

select * from salaries;
select * from dept_manager;
select * from employees;

select dm.emp_no, e.first_name, e.last_name,
MAX(s.salary) - MIN(s.salary) as salary_difference,
case
when MAX(s.salary) - MIN(s.salary) > '30000' then 'salary was raised by more than $30,000'
when MAX(s.salary) - MIN(s.salary) BETWEEN '20000' and '30000' then 'salary was raised by more than $20,000 but less than $30,000'
else 'salary was raised by less than $20,000'
end
from dept_manager dm
join employees e on e.emp_no = dm.emp_no
join salaries s on s.emp_no = dm.emp_no
group by s.emp_no;

SELECT e.emp_no, e.first_name, e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM employees e
        LEFT JOIN dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990;

SELECT dm.emp_no,  e.first_name,  e.last_name,  
    MAX(s.salary) - MIN(s.salary) AS salary_difference,  
    CASE  
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'  
        ELSE 'Salary was NOT raised by more then $30,000'  
    END AS salary_raise  
FROM  dept_manager dm  
        JOIN  employees e ON e.emp_no = dm.emp_no  
        JOIN  salaries s ON s.emp_no = dm.emp_no  
GROUP BY s.emp_no;  

SELECT  
    dm.emp_no,  e.first_name,  e.last_name,  
    MAX(s.salary) - MIN(s.salary) AS salary_difference,  
    IF(MAX(s.salary) - MIN(s.salary) > 30000, 'Salary was raised by more then $30,000', 
    'Salary was NOT raised by more then $30,000') AS salary_increase  
FROM  dept_manager dm  
        JOIN  employees e ON e.emp_no = dm.emp_no  
        JOIN  salaries s ON s.emp_no = dm.emp_no  
GROUP BY s.emp_no;

select e.emp_no, e.first_name, e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM employees e
        JOIN dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;








