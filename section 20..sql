use employees;

SELECT emp_no, first_name, last_name,
    ROW_NUMBER() OVER (partition by first_name order by last_name asc) AS row_num
FROM
employees;


SELECT emp_no, salary,
    ROW_NUMBER() OVER (partition by emp_no) AS row_num1,
        ROW_NUMBER() OVER (partition by emp_no order by salary desc) AS row_num2
FROM
salaries;

SELECT dm.emp_no, salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC) AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2   
FROM dept_manager dm
    JOIN salaries s ON dm.emp_no = s.emp_no;

SELECT dm.emp_no, salary,
    ROW_NUMBER() OVER () AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2
FROM dept_manager dm
    JOIN salaries s ON dm.emp_no = s.emp_no
ORDER BY row_num1, emp_no, salary ASC;


select emp_no, first_name, 
  row_number() over w as row_num
from employees
 window w as (partition by first_name order by emp_no desc);

SELECT a.emp_no,
       MIN(salary) AS min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
GROUP BY emp_no;

SELECT a.emp_no,
       MIN(salary) AS min_salary FROM (
SELECT emp_no, salary, 
ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary) AS row_num
FROM salaries) a
GROUP BY emp_no;

SELECT a.emp_no, MIN(salary) AS min_salary
FROM
    (SELECT emp_no, salary
    FROM salaries) a
GROUP BY emp_no;

SELECT a.emp_no, a.salary as min_salary FROM (
SELECT emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
WHERE a.row_num=1;

SELECT a.emp_no, a.salary as min_salary FROM (
SELECT emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
WHERE a.row_num=2;


select emp_no, salary,
dense_rank() over w as rank_num
from salaries
where emp_no = 10560
window w as (partition by emp_no order by salary desc);

SELECT dm.emp_no, (COUNT(salary)) AS no_of_salary_contracts
FROM dept_manager dm
        JOIN salaries s ON dm.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no;

SELECT
    e.emp_no,
    RANK() OVER w as employee_salary_ranking,
    s.salary
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
WHERE e.emp_no BETWEEN 10500 AND 10600
WINDOW w as (PARTITION BY e.emp_no ORDER BY s.salary DESC);

SELECT
    e.emp_no,
    DENSE_RANK() OVER w as employee_salary_ranking,
    s.salary, e.hire_date, s.from_date,
    (YEAR(s.from_date) - YEAR(e.hire_date)) AS years_from_start
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
    AND YEAR(s.from_date) - YEAR(e.hire_date) >= 5
WHERE e.emp_no BETWEEN 10500 AND 10600
WINDOW w as (PARTITION BY e.emp_no ORDER BY s.salary DESC);

SELECT
emp_no, salary,
    LAG(salary) OVER w AS previous_salary,
    LEAD(salary) OVER w AS next_salary,
    salary - LAG(salary) OVER w AS diff_salary_current_previous,
LEAD(salary) OVER w - salary AS diff_salary_next_current
FROM salaries
    WHERE salary > 80000 AND emp_no BETWEEN 10500 AND 10600
WINDOW w AS (PARTITION BY emp_no ORDER BY salary);

SELECT
emp_no, salary,
    LAG(salary) OVER w AS previous_salary,
LAG(salary, 2) OVER w AS 1_before_previous_salary,
LEAD(salary) OVER w AS next_salary,
    LEAD(salary, 2) OVER w AS 1_after_next_salary
FROM salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)
LIMIT 1000;

SELECT
    s1.emp_no, s.salary, s.from_date, s.to_date
FROM salaries s
        JOIN
    (SELECT emp_no, MIN(from_date) AS from_date
    FROM salaries
    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE s.from_date = s1.from_date;


