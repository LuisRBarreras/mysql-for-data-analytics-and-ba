
SELECT SYSDATE();

SELECT
	emp_no, from_date, to_date
FROM
	salaries
WHERE
	to_date > SYSDATE();
	
	
	
	
	
	
SELECT
	emp_no, MAX(from_date), to_date
FROM
	salaries
WHERE
	to_date > SYSDATE()
	GROUP BY emp_no;
	
	
	
	
	
	
	
	# current employees working on the company 
SELECT
	s1.emp_no, s.salary, s.from_date, s.to_date 
FROM 
		salaries s 
JOIN (
	SELECT emp_no, MAX(from_date) as from_date 
	FROM salaries
	GROUP BY emp_no
) s1 ON s.emp_no = s1.emp_no
WHERE
	s.to_date > SYSDATE()
	AND s.from_date = s1.from_date
	;
	
	
	
	
	
	SELECT * FROM dept_emp WHERE emp_no = 10010 LIMIT 1000;
	
	
	
SELECT
	s1.emp_no, s.salary, s.from_date, s.to_date 
FROM 
		salaries s 
JOIN (
	SELECT emp_no, MAX(from_date) as from_date 
	FROM salaries
	GROUP BY emp_no
) s1 ON s.emp_no = s1.emp_no
WHERE
	 s.from_date = s1.from_date
	
	
	
	
	
	
	
SELECT 
	* 
FROM
	dept_emp de 	
JOIN (
	SELECT emp_no, MAX(from_date) as from_date 
	FROM salaries
	GROUP BY emp_no
) s1 ON s1.emp_no = de.emp_no

WHERE 
	de.from_date > '2000-01-01' AND de.to_date < '2002-01-01'
	
	