#
# using several 
	SELECT DISTINCT
	emp_no,
	salary,
	ROW_NUMBER() OVER (PARTITION by emp_no ORDER BY salary DESC) row_num1
FROM 
	salaries
WHERE
	emp_no = 10001

	
	SET sql_mode ='';
	
	SELECT	
		emp_no, (COUNT (salary) - COUNT(DISTINCT salary)) as diff  
	FROM
		salaries 
	GROUP BY emp_no
	HAVING diff > 0 
	ORDER BY emp_no
	;
	
	
	
	SELECT 
		emp_no, salary, DENSE_RANK() OVER w as rank_num  
	FROM 
		salaries
	WHERE emp_no = 11839
	WINDOW w as (PARTITION by emp_no ORDER BY salary DESC)
	;
	
	SELECT 
		emp_no,
		salary,
		ROW_NUMBER() OVER w as row_num
	FROM salaries
	WHERE emp_no = 10560
	WINDOW w AS (PARTITION by emp_no ORDER BY salary DESC)
	;
	
	
	SELECT s.emp_no, s.salary, COUNT(dm.dept_no) as contract_num 
	FROM salaries s
	JOIN dept_manager dm ON s.emp_no = dm.emp_no
	GROUP BY emp_no
	ORDER BY emp_no
	
		SELECT 
		emp_no,
		salary,
		RANK() OVER w as rank_num 
	FROM salaries
	WHERE emp_no = 10560
	WINDOW w AS (PARTITION by emp_no ORDER BY salary DESC)
	;
	
SELECT 
	emp_no,
	salary,
	DENSE_RANK() OVER w as rank_num 
FROM salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION by emp_no ORDER BY salary DESC)
	;
	
	
	SELECT
		d.dept_no,
		d.dept_name,
		dm.emp_no,
		RANK() OVER w AS department_salary_ranking,
		s.salary,
		s.from_date as salary_from_date,
		s.to_date as salary_to_date,
		dm.from_date as dept_manager_from_date,
		dm.to_date as dept_manager_to_date
	FROM 
		dept_manager dm 
	JOIN
		salaries s on s.emp_no = dm.emp_no 
		AND s.from_date BETWEEN dm.from_date AND dm.to_date
		AND s.to_date BETWEEN dm.from_date AND dm.to_date
	JOIN 
		departments d on d.dept_no = dm.dept_no 
	WINDOW
		w AS (PARTITION by dm.dept_no ORDER BY s.salary DESC)
	;
	
	
	
	
	
	
	SELECT s.*,
		RANK() over (PARTITION by emp_no ORDER BY salary DESC)
	FROM salaries s
	WHERE s.emp_no BETWEEN 10500 AND 10600
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	