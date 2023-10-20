# Case statement 

SELECT
	emp_no,
	first_name,
	last_name,
	CASE 
		WHEN gender = 'M' THEN 'Male'
		ELSE 'Female'
	END AS gender 
FROM
	employees;
	
	
	
	
SELECT
	emp_no,
	first_name,
	last_name,
	CASE gender 
		WHEN 'M' THEN 'Male'
		ELSE 'Female'
	END AS gender 
FROM
	employees;
	
	
	
	##
	#CASE 
	# WHEN dm.emp_no IS NOT NULL THEN 'Manager'
	
	SELECT
	emp_no,
	first_name,
	last_name,
	IF(gender = 'M', 'Male', 'Female') AS gender
FROM
	employees;
	
	
	
	
	WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised'
	
	DESCRIBE dept_manager
	
set session sql_mode=""

	 
	SELECT
		e.emp_no,
		e.first_name,
		e.last_name,
		SUM(CASE 
			WHEN m.dept_no IS NOT NULL THEN 1
			ELSE 0
		END) AS managers,
		SUM(CASE
			WHEN m.dept_no IS NULL then 1 ELSE 0
			END
		) as employees
FROM
	employees e
LEFT JOIN 
	dept_manager m ON  e.emp_no = m.emp_no 
WHERE 
	e.emp_no > 109990;
	
	
	
		 
	SELECT
		e.emp_no,
		e.first_name,
		e.last_name,
		m.dept_no,
		MAX(s.salary) - MIN(s.salary) as salary_diff,
		IF(MAX(s.salary) - MIN(s.salary) > 30000, 'Raise', 'Not Raise' )  as salary_increase,
		CASE 
			WHEN  MAX(s.salary) - MIN(s.salary) > 30000 THEN 'salary raise was higher than $30,000'
			ELSE 'salary not raise highter'
		END as raise

FROM
	employees e
JOIN 
	dept_manager m ON  e.emp_no = m.emp_no 
JOIN salaries s ON m.emp_no = s.emp_no
GROUP BY s.emp_no




SELECT  
	e.emp_no,
	e.first_name,
	e.last_name,
	CASE 
		WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
		ELSE 'Not an employee anymore'
		END AS current_employee 
FROM
	employees e 
JOIN dept_emp de ON de.emp_no = e.emp_no 
GROUP BY de.emp_no 
LIMIT 100;

	