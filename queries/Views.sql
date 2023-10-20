-- name: Views
-- A virtual table whose contents 
-- view object a view into the base table 
-- the view siply shows the data 
SET sql_mode = '' ;

SELECT 
	emp_no, from_date, to_date, COUNT(emp_no) AS Num 
FROM
	dept_emp 
GROUP BY emp_no 
HAVING Num > 1
;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS 
SELECT
	emp_no, MAX(from_date) as from_date, MAX(to_date) as to_date 	
FROM
	dept_emp 
GROUP BY emp_no;


-- Using SQL Views 
-- A view acts as shortcut for writing the same SELECT statement every time a new 
-- request has been made
-- ** saves a lot of coding time 
-- occupies no extra memory 
-- acts as a dynamic table because it instantly reflects data 
SELECT * from employees.v_dept_emp_latest_date;




SELECT m.*, ROUND(AVG(s.salary),2) FROM dept_manager m
INNER JOIN salaries s ON s.emp_no =m.emp_no
GROUP BY emp_no


CREATE OR REPLACE VIEW v_average_manager_salary AS
	SELECT 
		ROUND(AVG(s.salary),2) 
	FROM 
		salaries s
	JOIN dept_manager m ON s.emp_no = m.emp_no
	
	SELECT * FROM v_average_manager_salary
