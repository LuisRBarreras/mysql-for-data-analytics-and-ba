-- name: Agregate FUNCTION o Sumarzin FUNCTION

SELECT * FROM salaries ORDER BY salary DESC 
LIMIT 10;


-- 
SELECT COUNT(salary)
FROM salaries;

-- name: COUNT (DISTIC)
-- How many employee start dates are in the database
SELECT COUNT(DISTINCT from_date)
FROM salaries;

SELECT * from departments;

SELECT COUNT(DISTINCT dept_no) from departments;

SELECT  sum(salary)
FROM salaries;

SELECT SUM(salary) from salaries where from_date > '1997-01-01'
ORDER BY from_date ASC;


SELECT MAX(salary), MIN(salary), AVG(salary) from salaries;

select MIN(emp_no) FROM employees;


SELECT ROUND(AVG(salary)) FROM salaries;


SELECT 
	ROUND(AVG(salary),2) 
FROM 
	salaries 
WHERE 
	from_date > '1997-01-01';
	
	
SELECT *
-- 	dept_no, 
-- 	IFNULL(dept_name, 'Department name not provided') AS depart_name
FROM 
	departments_dup 
ORDER BY dept_no ASC;


SELECT 
	dept_no, 
	dept_name,
	COALESCE(dept_manager, dept_name, 'N/A') AS depart_name
FROM 
	departments_dup 
ORDER BY dept_no ASC;

-- 
-- ALTER TABLE departments_dup
-- CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;
-- 

ALTER TABLE employees.departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;


SELECT 
	IFNULL(dept_no, 'N/A') as dept_no, 
	IFNULL(dept_name, 'Department name not provided') as dept_name,
	COALESCE(dept_no, dept_name) as dept_info
	
FROM 
	departments_dup 
ORDER BY dept_no ASC;









