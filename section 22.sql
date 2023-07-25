use employees;


create temporary table f_highest_salary
select s.emp_no, max(s.salary) as f_highest_salary
from salaries s
join employees e on s.emp_no = e.emp_no and e.gender = 'F'
group by s.emp_no;

select * from f_highest_salary
where emp_no <= 10010;

drop temporary table if exists f_highest_salary;

create temporary table male_max_salaries
select s.emp_no, max(s.salary) as male_max_salaries
from salaries s
join employees e on s.emp_no = e.emp_no and e.gender = 'M'
group by s.emp_no;

select *
from male_max_salaries;


create temporary table f_highest_salary
select s.emp_no, max(s.salary) as f_highest_salary
from salaries s
join employees e on s.emp_no = e.emp_no and e.gender = 'F'
group by s.emp_no
limit 10;


create temporary table dates
select now() as current_date_time,
       date_sub(now(), interval 1 month) as month_earlier,
              date_sub(now(), interval -1 year) as year_later;
              

select *
from dates;



with cte as (select now() as current_date_time,
       date_sub(now(), interval 1 month) as month_earlier,
              date_sub(now(), interval -1 year) as year_later)
select * from dates d join cte c;

drop temporary table if exists dates;
drop temporary table if exists f_highest_salary;


create temporary table dates
select now() as current_date_time,
       date_sub(now(), interval 2 month) as two_month_earlier,
       date_sub(now(), interval -2 year) as two_year_later;
       
select * 
from dates;

with cte as (select now() as current_date_time,
       date_sub(now(), interval 2 month) as two_month_earlier,
       date_sub(now(), interval -2 year) as two_year_later)
       select * from dates d join cte c;
       
       
with cte as (select now() as current_date_time,
        date_sub(now(), interval 2 month) as two_month_earlier,
        date_sub(now(), interval -2 year) as two_year_later)
        select * from dates d union select * from cte c;
        
        
drop temporary table if exists dates;
drop temporary table if exists male_max_salaries;

