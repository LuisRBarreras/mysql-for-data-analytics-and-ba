-- ALTER TABLE departments_dup
-- DROP COLUMN dept_manager;
-- 
-- 
-- ALTER TABLE departments_dup
-- CHANGE COLUMN dept_no dept_no CHAR(4) NULL;
-- 
-- 
-- ALTER TABLE departments_dup
-- CHANGE COLUMN dept_name dept_Name VARCHAR(40) NULL;
-- -- 
-- DROP TABLE IF EXISTS dept_manager_dup;
-- 
-- CREATE TABLE dept_manager_dup (
-- 
--   emp_no int(11) NOT NULL,
-- 
--   dept_no char(4) NULL,
-- 
--   from_date date NOT NULL,
-- 
--   to_date date NULL
-- 
--   );
-- 
 

-- INSERT INTO dept_manager_dup
-- 
-- select * from dept_manager;
-- 
--  
-- 
-- INSERT INTO dept_manager_dup (emp_no, from_date)
-- 
-- VALUES                (999904, '2017-01-01'),
-- 
--                                 (999905, '2017-01-01'),
-- 
--                                (999906, '2017-01-01'),
-- 
--                                (999907, '2017-01-01');
-- 
-- DELETE FROM dept_manager_dup WHERE dept_no = 'd001';
		
		
SELECT * FROM dept_manager_dup ORDER BY dept_no;
		
				
SELECT * FROM departments_dup ORDER BY dept_no;
		



SELECT 
	m.dept_no, m.emp_no, d.dept_name 
FROM 
	dept_manager_dup m
INNER JOIN 
	departments_dup d on m.dept_no = d.dept_no
	
GROUP BY m.emp_no
ORDER BY dept_no;



describe dept_manager;

SELECT * from employees;

SELECT 
	m.emp_no, m.dept_no, e.first_name, e.last_name, e.hire_date, 
	m.from_date, m.to_date
FROM 
	dept_manager m 
JOIN 
	employees e ON m.emp_no = e.emp_no
ORDER BY m.dept_no;





DELETE FROM dept_manager_dup WHERE emp_no = '110228';

DELETE FROM departments_dup WHERE dept_no = 'd009';




INSERT INTO dept_manager_dup VALUES ('110228', 'd003','1992-03-21', '9999-01-01');

INSERT INTO departments_dup VALUES('d009', 'Customer Service');


SET sql_mode= '';
-- LEFT JOIN
SELECT 
	m.dept_no, m.emp_no, d.dept_name 
FROM 
	dept_manager_dup m
LEFT JOIN 
	departments_dup d on m.dept_no = d.dept_no
	GROUP BY m.emp_no

ORDER BY dept_no;



-- LEFT JOIN
SELECT 
	m.dept_no, m.emp_no, d.dept_name 
FROM 
	departments_dup d
LEFT  JOIN 
	 	dept_manager_dup m on m.dept_no = d.dept_no
		where dept_name IS NULL
ORDER BY dept_no;


SELECT 
	e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM employees e

LEFT JOIN  dept_manager m on m.emp_no = e.emp_no
WHERE last_name = 'Markovitch'
ORDER BY m.dept_no DESC, e.emp_no;


-- RIGHT JOIN

-- RIGHT JOIN
-- matching column = linking column
-- inner join connection points
SELECT 
	d.dept_no, m.emp_no, d.dept_name 
FROM 
	dept_manager_dup m 
RIGHT JOIN 
	 departments_dup d	on m.dept_no = d.dept_no
ORDER BY dept_no;


SELECT 
	e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM employees e, dept_manager m

WHERE  m.emp_no = e.emp_no
ORDER BY m.dept_no DESC, e.emp_no;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');


describe employees;

SELECT * FROM titles;

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM employees e
JOIN titles t on e.emp_no = t.emp_no
WHERE first_name = 'Margareta' AND e.last_name = 'Markovitch'


-- CROSS JOIN
-- cross jion will take the values from a table and connect them with all 
-- Cartesian Product

SELECT dm.*, d.*
FROM dept_manager dm 
CROSS JOIN departments d 
WHERE d.dept_no <> dm.dept_no
ORDER BY dm.emp_no, d.dept_no;



SELECT dm.*, d.*
FROM dept_manager dm 
CROSS JOIN departments d 
WHERE d.dept_no = 'd009'
ORDER BY dm.emp_no, d.dept_no;

SELECT  e.*, d.*
FROM
	employees e 
CROSS JOIN departments d 
WHERE e.emp_no < 10011



SELECT  e.gender, AVG(s.salary) AS average_salary 
FROM
	employees e 
JOIN salaries s on e.emp_no = s.emp_no 
GROUP BY e.gender


SELECT
	e.first_name,
	e.last_name,
	e.hire_date,
	m.from_date,
	d.dept_name 
FROM 
	employees e
JOIN dept_manager m ON m.emp_no = e.emp_no 
JOIN departments d ON m.dept_no = d.dept_no
;

SELECT * from titles;


SELECT
	e.first_name,
	e.last_name,
	e.hire_date,
	t.title,
	m.from_date,
	d.dept_name
FROM 
	employees e
JOIN 
	dept_manager m ON m.emp_no = e.emp_no 
JOIN 
	departments d ON m.dept_no = d.dept_no
JOIN 
	titles t on t.emp_no = m.emp_no
WHERE 
	t.title = 'Manager'
ORDER BY 
	e.emp_no;


-- as an analyst, your job is to extract fast and accurate results
SELECT 
	d.dept_name, AVG(s.salary) AS average_salary
FROM 
	departments d 
JOIN 
	dept_manager m ON d.dept_no = m.dept_no
JOIN 
	salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING average_salary > 60000
ORDER BY average_salary DESC



SELECT 
	e.gender,
	COUNT(m.emp_no) 
FROM 
	employees e
	JOIN dept_manager m on e.emp_no = m.emp_no
GROUP BY e.gender
	;






DROP TABLE IF EXISTS employees_dup;

CREATE TABLE employees_dup(
	emp_no int(11),
	birth_date date,
	first_name varchar(14),
	last_name VARCHAR(16),
	gender enum('M','F'),
	hire_date date
);


INSERT INTO employees_dup 
SELECT e.* FROM employees e LIMIT 20;



SELECT * from employees_dup;


INSERT INTO employees_dup VALUES(
	'10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26'
)



-- UNION ALL to unify table
-- UNION display only distinc VALUES
-- UNION ALL retrieves the duplicates as well
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	NULL AS dept_no,
	NULL AS from_date
FROM 
	employees_dup e 
WHERE 
	e.emp_no = 10001
UNION  SELECT
	NULL AS emp_no,
	Null as first_name,
	NULL AS last_name,
	m.dept_no,
	m.from_date
FROM 
	dept_manager m;



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
        last_name = 'Denis' 
		UNION SELECT
        NULL AS emp_no,
        NULL AS first_name,
        NULL AS last_name,
        dm.dept_no,
        dm.from_date
    FROM
        dept_manager dm) as a

ORDER BY -a.emp_no DESC;

















