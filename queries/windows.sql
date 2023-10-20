
SELECT 
	emp_no,
	salary,
	ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM 
	salaries;
	
	

# Refering to Window, to provide the specification with ALIAS 
SELECT 
	emp_no,
	salary,
	ROW_NUMBER() OVER w AS row_num
FROM 
	salaries
WINDOW 
	w AS (PARTITION BY emp_no ORDER BY salary DESC)
	;
	
	

SELECT 
	emp_no,
	first_name,
	ROW_NUMBER() OVER w AS row_num
FROM 
	employees
WINDOW 
	w AS (PARTITION BY first_name ORDER BY emp_no)
	;
	
	

	
	
	
	
	
	
	
	
	
	SELECT 
		*,
		ROW_NUMBER() OVER (ORDER BY emp_no ASC) AS row_num
	FROM 
		dept_manager;
		
		
		
SELECT
	emp_no,
	first_name,
	last_name,
	ROW_NUMBER() OVER (PARTITION BY first_name ORDER BY last_name ) AS row_num
FROM
	employees;
	
	
	
	
	
	# using several 
	SELECT 
	emp_no,
	salary,
	ROW_NUMBER() OVER () row_num1,
	ROW_NUMBER() OVER (PARTITION by emp_no) as row_num2
FROM 
	salaries
ORDER BY emp_no, salary;
	
	
SELECT 
	m.emp_no,
	s.salary,
	ROW_NUMBER() OVER (PARTITION by emp_no ORDER BY salary ASC) row_num1,
	ROW_NUMBER() OVER (PARTITION by emp_no ORDER BY salary DESC) as row_num2
FROM 
	dept_manager m
INNER JOIN salaries s on m.emp_no = s.emp_no
	
	
	
	
	# Partition By vs GROUP BY 
	SET sql_mode='';
	
	SELECT * FROM salaries 
	GROUP BY emp_no;
	
	
	
	SELECT
		emp_no,
		salary,
		ROW_NUMBER() OVER (PARTITION by emp_no ORDER BY salary DESC) as row_num 
	FROM salaries;
	
	SELECT a.emp_no, MAX(salary) AS max_salary FROM
		(SELECT
		emp_no,
		salary,
		ROW_NUMBER() OVER (PARTITION by emp_no ORDER BY salary DESC) as row_num 
	FROM salaries) a
	GROUP BY emp_no
	;
	
	
	
	SELECT 
		a.emp_no,
		a.salary AS max_salary FROM (
			SELECT emp_no, salary,
				ROW_NUMBER() OVER w as row_num 
			FROM salaries
			WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
		) a
	WHERE a.row_num = 1
	;
	
	
	SELECT a.emp_no, a.salary AS max_salary FROM(
		SELECT emp_no, salary,
			ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC ) as row_num
		FROM salaries	
		) a
	WHERE
		a.row_num = 1
	;
	
	
	
	SELECT a.emp_no, min(a.salary) 
	FROM(
		SELECT emp_no, salary,
			ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC ) as row_num
		FROM salaries	
		) a

	GROUP BY a.emp_no
	;
	
	
	
	
	
	# Find outh the second-lowest salary value each employee has 
	# ever signed a contract for 
	SELECT a.emp_no, a.salary AS second_lowest_salary FROM(
		SELECT emp_no, salary,
			ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC ) as row_num
		FROM salaries	
		) a
	WHERE
		a.row_num = 2
	;
	
	
	
	
	
	
	
	
	
	
	