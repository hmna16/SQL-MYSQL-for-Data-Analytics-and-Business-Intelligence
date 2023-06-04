select * from dept_manager;

SELECT * FROM dept_manager
WHERE
    emp_no IN (SELECT emp_no
        FROM employees
        WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');
        
select e.first_name, e.last_name
from employees e 
where exists (select * from dept_manager dm
              where dm.emp_no = e.emp_no);
              
select * from employees e 
where exists (select * from titles t 
              where e.emp_no = t.emp_no and
              title = 'Assistant Engineer');

select A.* from
(select e.emp_no as employee_ID,
MIN(de.dept_no) as department_ID,
(
select emp_no from dept_manager
where emp_no = 110022) 
as manager_ID
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no <=10020
group by e.emp_no
order by e.emp_no) as A
UNION 
select B.* from
 (select e.emp_no as employee_ID,
 MIN(de.dept_no) as department_ID,
 (
 select emp_no from dept_manager
 where emp_no = 110039) 
 as manager_ID
 from employees e
 join dept_emp de on e.emp_no = de.emp_no
 where e.emp_no > 10021
 group by e.emp_no
 order by e.emp_no
 limit 20) as B;

drop table if exists emp_manager;
create table emp_manager
( emp_no INT NOT NULL,
dept_no CHAR(4) null,
manager_no INT NOT NULL
);
              
INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;


select * from emp_manager;




