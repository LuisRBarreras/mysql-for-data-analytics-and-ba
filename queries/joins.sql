-- 
-- 
-- ALTER TABLE departments_dup
-- change COLUMN dept_no dept_no char(4) null;
-- 
-- 
-- 
-- alter table departments_dup
-- change column dept_name dept_name varchar(40) null;
-- describe departments_dup;
-- 
-- 
-- insert into departments_dup
-- (dept_no, dept_name)
-- select * from departments;
-- 
-- 
-- insert into departments_dup (dept_name)
-- values ('Public Relations');
-- 
-- 
-- select * from departments_dup;
-- 
-- 
-- delete from departments_dup where dept_no = 'd002';
-- 
-- insert into departments_dup(dept_no) VALUES('d010'),('d011');
-- 
-- DROP TABLE IF EXISTS dept_manager_dup;
-- 
-- CREATE TABLE dept_manager_dup(
-- emp_no int(11) not null,
-- dept_no char(4) null,
-- from_date date not null,
-- to_date date null
-- )
-- 
-- 
-- insert into dept_manager_dup
-- select * from dept_manager
-- 
-- 
-- insert INTO dept_manager_dup(emp_no, from_date)
-- VALUES                (999904, '2017-01-01'),
-- 
--                                 (999905, '2017-01-01'),
-- 
--                                (999906, '2017-01-01'),
-- 
--                                (999907, '2017-01-01');
-- 
-- delete FROM dept_manager_dup where dept_no ='d001';
-- 
-- 
-- select * from dept_manager_dup ORDER BY dept_no;
-- 
-- select * FROM departments_dup ORDER BY dept_no;


SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup as m 
inner join 
	departments_dup as d ON m.dept_no = d.dept_no

ORDER BY m.dept_no;



delete from dept_manager_dup where emp_no = '110228';
DELETE FROM  departments_dup WHERE dept_no = 'd009';



INSERT INTO dept_manager_dup 
VALUES('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_dup
VALUES('d009', 'Customer Service');



SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup as m 
right join departments_dup d on m.dept_no = d.dept_no

ORDER BY m.dept_no ;



select e.*, s.salary
from employees e
INNER JOIN salaries s ON s.emp_no = e.emp_no 
WHERE s.salary > 145000;

SELECT dm.*, d.*
FROM dept_manager dm 
CROSS JOIN
departments d 
order by dm.emp_no, d.dept_no;



SELECT e.gender, AVG(s.salary) as average_salary 
FROM employees e 
	JOIN
		salaries s on e.emp_no = s.emp_no
GROUP BY e.gender;


select e.first_name, e.last_name, e.hire_date, m.from_date, d.dept_name
from employees e 
JOIN dept_manager m on m.emp_no = e.emp_no 
JOIN departments d on d.dept_no = m.dept_no



select ROUND(AVG(salary), 1)
from salaries;


SELECT * FROM employees WHERE emp_no = 999901;

UPDATE employees
SET first_name = 'Stella', last_name= 'Parkinson', gender ='f'
where emp_no = 999901;















