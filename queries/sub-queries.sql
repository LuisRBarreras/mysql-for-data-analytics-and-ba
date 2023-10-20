
-- name: subqueries 
-- may return a single value, a single row
-- allow for better structuring of the outer QUERY
-- thus, each inner query can be thought of in isolation 
SELECT 
	e.first_name, e.last_name 
FROM 
	employees e

WHERE 
	e.emp_no IN (
		SELECT 
			dm.emp_no 
		FROM
			dept_manager dm
	)	
;


SELECT 
	m.*
FROM
	dept_manager m 
WHERE 
	m.emp_no IN (
		SELECT 
			emp_no 
		FROM 
			employees 
		WHERE 
			hire_date BETWEEN '1990-01-01' AND hire_date 
	);



-- EXISTS - NOT EXISTS Ne



SELECT 
	e.first_name, e.last_name 
FROM 
	employees e 
WHERE
	EXISTS (
		SELECT
			*
		FROM 
			dept_manager dm 
		WHERE dm.emp_no = e.emp_no
	
		)
	ORDER BY e.last_name
	
	
	
	
	SELECT 
		*
	FROM employees e 
	WHERE 
		EXISTS(
			SELECT 
				t.emp_no
			FROM titles t 
			WHERE t.emp_no = e.emp_no AND t.title = 'Assistant Engineer' 
		)
	
	
	
	-- Assign employee number 110022 as a manager to all employees FROM 
	-- 10001 to 10020, and employee number 110039 as manager to ALL
	-- employees from 10021 to 10040
	INSERT INTO emp_manager 
	SELECT U.* 
	FROM 
(SELECT 
	A.* 
FROM
	(SELECT
		e.emp_no as employee_ID,
		MIN(de.dept_no) as department_code,
		(
			SELECT
				emp_no 
			FROM 
				dept_manager 
			WHERE 
				emp_no = 110022) as manager_ID
	FROM 
		employees e 
	JOIN dept_emp de ON e.emp_no = de.emp_no 
	WHERE e.emp_no <= 10020 AND e.emp_no >= 10001
	GROUP BY e.emp_no
	ORDER BY e.emp_no) as A
	UNION SELECT
		B.*
	FROM 
		(SELECT
			e.emp_no as employee_ID,
			MIN(de.dept_no) as department_code,
			(
				SELECT
					emp_no 
				FROM 
					dept_manager 
				WHERE 
					emp_no = 110039) as manager_ID
		FROM 
			employees e 
		JOIN dept_emp de ON e.emp_no = de.emp_no 
		WHERE e.emp_no >= 10021 AND e.emp_no <= 10040
		GROUP BY e.emp_no
		ORDER BY e.emp_no) as B) as U
	
	
	
	
	
	
	
	
	
	DROP TABLE IF EXISTS emp_manager;
	CREATE TABLE emp_manager(
		emp_no int(11) not null,
		dept_no CHAR(4) null,
		manager_no int(11) NOT NULL
	)
	
	SELECT * from emp_manager;


