SELECT 
    first_name, last_name, hire_date
FROM
    employees;
    
   select dept_no
   from departments;
   
SELECT 
    *
FROM
    departments;
   
SELECT 
    *
FROM
    employees
;

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis' and gender = 'M'
;


select * from employees;

select gender
from employees
where gender = 'F'
;
select * from employees
where last_name = 'elvis'
;   
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna')
;   
select * from employees
where first_name IN ( 'Cathie' , 'Mark' , 'Nathan' )
;

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Kellie' , 'Elvis')
;
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob')
;

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('mar%')
;

/* 1.	Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters. */
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mark%')
;





#	Retrieve a list with all employees who have been hired in the year 2000. #
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%')
;

#	Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. #
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_')
;

# Extract all individuals from the ‘employees’ table whose first name contains “Jack”. #
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%')
;

# Once you have done that, extract another list containing the names of employees that do not contain “Jack”.#
SELECT 
    *
FROM
    employees
WHERE
    first_name not LIKE ('%jack%')
;

select * from employees
where hire_date between '1990-01-01' and '2000-01-01'
;

SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01'
;

 #	Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.#
 SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000'
;
   
#	Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.   #
SELECT 
    *
FROM
    employees
WHERE
    emp_no BETWEEN '10004' AND '10012'
;

#	Select the names of all departments with numbers between ‘d003’ and ‘d006’. #
SELECT 
    *
FROM
    departments
WHERE
    dept_no not BETWEEN 'd003' AND 'd006'
;
   
select * from departments;
# Select the names of all departments whose department number value is not null. #
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;


SELECT 
    *
FROM
    employees
WHERE
    hire_date <= '1985-02-01'
;
# Retrieve a list with data about all female employees who were hired in the year 2000 or after. #
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (hire_date >= '2000-01-01')
;
# Extract a list with all employees’ salaries higher than $150,000 per annum.#
SELECT 
    *
FROM
    salaries
WHERE
    salary > '150000'
;

/* Obtain a list with all different “hire dates” from the “employees” table.
Expand this list and click on “Limit to 1000 rows”. 
This way you will set the limit of output rows displayed back to the default of 1000.*/
SELECT DISTINCT
    *
FROM
    employees;

select count(distinct first_name)
from employees;

select * from salaries;

# How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table? #
SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000
;

# How many managers do we have in the “employees” database? #

SELECT 
    COUNT(*)
FROM
    dept_manager;

select * from employees
order by first_name, last_name DESC;
   
# Select all data from the “employees” table, ordering it by “hire date” in descending order. #
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;
   
SELECT 
    first_name, COUNT(first_name)
    as name_count
FROM
    employees
GROUP BY first_name
order by first_name DESC
;

/* Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
Lastly, sort the output by the first column. */
SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > '80000'
GROUP BY salary
ORDER BY salary
;

select first_name , count(first_name) as count_names
from employees
group by first_name
having count(first_name) > 250
order by first_name
;
/* Select all employees whose average salary is higher than $120,000 per annum. 
Hint: You should obtain 101 records. */

SELECT 
    emp_no, AVG(salary) AS avg_salary
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no
;

/* extract the list of all the employees’ names that appeared less than 200 times. 
However, let the data reveal the names of employees that were hired after the 1st January 1999. */
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    first_name > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name
;

select * from dept_emp ;

# Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000. #
select emp_no 
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having count(from_date) > 1
order by emp_no
;


SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

# Select the first 100 rows from the ‘dept_emp’ table.  #
SELECT 
    *
FROM
    dept_emp
LIMIT 100;

select * from employees;

insert into employees ( emp_no, birth_date, first_name, last_name, gender, hire_date)
values ( 999999901, '1995-02-16', 'John', 'Smith', 'M', '2023-02-01')
;

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Peterson',
    birth_date = '1998-06-24',
    gender = 'F',
    hire_date = '2020-01-31'
WHERE
    emp_no = 999999901
;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

select * from employees
order by emp_no desc;

# Select ten records from the “titles” table to get a better idea about its content. #
select * from titles
limit 10;

/* Then, in the same table, insert information about employee number 9999901. 
State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.
*/
insert into titles ( emp_no, title, from_date)
values ('9999901', 'Senior Engineer', '1997-09-01')
;
select * from titles
order by emp_no desc
;

select * from dept_emp;

insert into dept_emp (emp_no, dept_no, from_date, to_date)
values ('9999901', 'd005', '1997-09-01', '9999-01-01')
;
select * from dept_emp
order by emp_no desc
limit 10
;

select * from departments;

create table department_dup
(
dept_no char(4) not null,
dept_name varchar(40) not null
) ;

SELECT 
    *
FROM
    department_dup;
commit;

UPDATE department_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Assurance'
;
rollback;

SELECT 
    *
FROM
    departments;
    
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010'
;


insert into department_dup (dept_no, dept_name)
select dept_no, dept_name
from departments;

select * from department_dup
order by dept_no desc;


insert into departments (dept_no, dept_name)
values ('d010', 'Business Analysis')
;

select * from departments;


select * from employees
order by emp_no desc
limit 10;

delete from employees
where emp_no = '999999901';

select * from employees
where emp_no = '999999901'
;

SELECT 
    *
FROM
    departments;
    
# Remove the department number 10 record from the “departments” table. #

DELETE FROM departments 
WHERE
    dept_no = 'd010'
;

# How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question. #

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;

SELECT 
    SUM(salary)
FROM
    salaries
;


# What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997? #
SELECT 
    *
FROM
    salaries;

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01'
;

SELECT 
    MAX(salary)
FROM
    salaries;

SELECT 
    MIN(salary)
FROM
    salaries;

/* 1. Which is the lowest employee number in the database? 
2. Which is the highest employee number in the database? */

SELECT 
    MAX(emp_no)
FROM
    employees;

SELECT 
    MIN(emp_no)
FROM
    employees;
    
   SELECT 
    AVG(salary)
FROM
    salaries; 
    
# What is the average annual salary paid to employees who started after the 1st of January 1997? #
SELECT 
    *
FROM
    salaries;
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date = '1997-01-01'
;
    
# Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents. #
SELECT 
    ROUND(AVG(salary) , 2) as average_rounded
FROM
    salaries
WHERE
    from_date = '1997-01-01'
;    
	
select * from department_dup;
alter table department_dup
change column dept_name dept_name varchar(40) NULL
;
insert into department_dup(dept_no)
values ('d010') , ('d011')
;
alter table department_dup
add column dept_manager varchar(255) null after dept_name;
select * from department_dup
order by dept_no desc;
commit;

select dept_no, dept_name,
coalesce(dept_name , dept_manager, 'N/A') as dept_manager
from department_dup
;    
/* Select the department number and name from the ‘departments_dup’ table 
and add a third column where you name the department number (‘dept_no’) as ‘dept_info’. 
If ‘dept_no’ does not have a value, use ‘dept_name’. */

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    department_dup
ORDER BY dept_no ASC;

/* Modify the code obtained from the previous exercise in the following way. 
Apply the IFNULL() function to the values from the first and second column, 
so that ‘N/A’ is displayed whenever a department number has no value, 
and ‘Department name not provided’ is shown if there is no value for ‘dept_name’. */
SELECT 
    dept_no,
    dept_name,
    IFNULL(dept_no, 'N/A') AS dept_no,
	IFNULL(dept_name, 'Department name not provided') AS dept_name
FROM
    department_dup
ORDER BY dept_no ASC;

select * from department_dup;
alter table department_dup
drop column dept_manager;

alter table department_dup
change column dept_no dept_no char(4) NULL;

alter table department_dup
change column dept_name dept_name varchar(40) NULL;

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );
INSERT INTO dept_manager_dup

select * from dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'), (999905, '2017-01-01'), (999906, '2017-01-01'), (999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';

INSERT INTO departments_dup (dept_name)
VALUES('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd002';


select * from dept_manager_dup;

select * from dept_manager_dup
order by dept_no asc;

select * from department_dup
order by dept_no asc;

INSERT INTO departments_dup (dept_name)
VALUES('Public Relations');

INSERT INTO departments_dup (dept_name) VALUES ('Test');


CREATE TABLE `departments_dup` 
(
  `dept_no` char(4) DEFAULT NULL,
  `dept_name` varchar(40) DEFAULT NULL
  );

select * from departments_dup;
INSERT INTO departments_dup
(
    dept_no,
    dept_name
)
SELECT *FROM departments;
INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');
DELETE FROM departments_dup
WHERE    dept_no = 'd002'; 
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

select * from departments_dup
order by dept_no asc;

select * from departments_dup;
select * from dept_manager_dup;

DROP TABLE IF EXISTS departments_dup;
CREATE TABLE departments_dup
(
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

INSERT INTO departments_dup
(
    dept_no,
    dept_name
)SELECT
                *
FROM departments;
INSERT INTO departments_dup (dept_name)
VALUES                ('Public Relations');
DELETE FROM departments_dup
WHERE
    dept_no = 'd002';    
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

select * from dept_manager_dup
order by dept_no asc;

select * from departments_dup
order by dept_no asc;

select m.dept_no , m.emp_no , d.dept_name
from dept_manager_dup m
right join departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

select * from dept_manager;
select * from employees;

select dm.dept_no, e.emp_no, e.first_name, e.last_name
from dept_manager dm
join employees e ON e.emp_no = dm.emp_no;

select * from employees;

select * from dept_manager;

select e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no
where e.last_name = 'Markovitch'
order by dept_no, e.emp_no;

select * from dept_manager;
select e.emp_no, e.first_name, e.last_name, e.hire_date, dm.dept_no
from employees e,
dept_manager dm
where e.emp_no = dm.emp_no;

select * from employees;
select * from salaries;

select e.emp_no, e.first_name, e.last_name, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no
where s.salary >= 145000;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

select * from dept_emp;

select e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
from employees e
join titles t on e.emp_no = t.emp_no
where first_name = 'Margareta' AND last_name = 'Markovitch';

select * from departments;
select * from dept_manager;

select d.* , dm.*
from departments d
cross join dept_manager dm
where d.dept_no = 'd009'  
ORDER BY d.dept_no;

select * from salaries;

SELECT e.*, d.*
FROM employees e
CROSS JOIN departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;

select e.gender, AVG(salary) as average_salary
from employees e 
 join salaries s ON e.emp_no = s.emp_no
group by gender;

select e.first_name, e.last_name, e.hire_date, dm.from_date, d.dept_name
from employees e 
join dept_manager dm on e.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no;


select e.first_name, e.last_name, e.hire_date, t.title, m.from_date, d.dept_name
from employees e 
join dept_manager m on e.emp_no = m.emp_no
join departments d on d.dept_no = m.dept_no
join titles t on e.emp_no = t.emp_no
where t.title = 'Manager'
order by e.emp_no;


select d.dept_name, avg(salary) as avergae_salary_per_department
from departments d 
join dept_manager m on d.dept_no = m.dept_no
join salaries s on m.emp_no = s.emp_no
group by dept_name
having avergae_salary_per_department >=60000
order by d.dept_no
;

select e.gender, count(m.emp_no)
from employees e 
join dept_manager m on e.emp_no = m.emp_no
group by gender;

select e.gender,count(e.gender)  
from employees e
JOIN titles t ON e.emp_no = t.emp_no
where t.title= 'Manager'
group by e.gender;


create table employees_dup
(
emp_no INT,
birth_date date,
first_name varchar(40),
last_name varchar(40),
gender enum ('M' , 'F'),
hire_date date
);

insert into employees_dup
select e.*
from employees e
limit 20;

select * from employees;
select * from employees_dup;

insert into employees_dup
values ('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

select e.emp_no, e.first_name, e.last_name, 
null as dept_no, 
null as from_date
from employees_dup e 
where e.emp_no = '10001'
union select
null as emp_no,
null as first_name,
null as last_name,
m.dept_no, m.from_date
from dept_manager m;


SELECT

    *

FROM

    (SELECT

        e.emp_no,

            e.first_name,

            e.last_name,

            NULL AS dept_no,

            NULL AS from_date

    FROM

        employees e

    WHERE

        last_name = 'Denis' UNION SELECT

        NULL AS emp_no,

            NULL AS first_name,

            NULL AS last_name,

            dm.dept_no,

            dm.from_date

    FROM

        dept_manager dm) as a

ORDER BY -a.emp_no DESC;




















