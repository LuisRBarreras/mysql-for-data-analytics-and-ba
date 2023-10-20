
# How many female emplyees' highest contract salary 
# values were higher than the all-time company salary average(across all genders) ???

SELECT AVG(salary) AS avg_salary FROM salaries;


SELECT
	s.emp_no, MAX(s.salary) AS highest_salary 
FROM 
	salaries s 
JOIN
	employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no;



WITH cte1 AS (
	SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
	SELECT
		s.emp_no, MAX(s.salary) AS f_highest_salary 
	FROM 
		salaries s 
	JOIN
		employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
	GROUP BY s.emp_no
)
SELECT 
	SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END) AS f_highest_salaries_above_avg,
	COUNT(e.emp_no) AS total_no_female_contracts,
	CONCAT(
		ROUND((
			SUM(CASE WHEN c2.f_highest_salary > c1.avg_salary THEN 1 ELSE 0 END)/ COUNT(e.emp_no)
	) * 100, 2), '%') AS '% percentange'
FROM employees e 
JOIN cte2 c2 ON c2.emp_no = e.emp_no 
CROSS JOIN cte1 c1;	





WITH cte1 AS (
	SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
	SELECT
		s.emp_no, MAX(s.salary) AS m_highest_salary_below_avg
	FROM 
		salaries s 
	JOIN
		employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
	GROUP BY s.emp_no
)
SELECT
	SUM(CASE WHEN c2.m_highest_salary_below_avg < c1.avg_salary THEN 1 ELSE 0 END) ,
	COUNT(CASE WHEN c2.m_highest_salary_below_avg < c1.avg_salary THEN c2.m_highest_salary_below_avg ELSE NULL END) m_highest_salaries_below_avg_count
FROM 
	employees e
JOIN cte2 c2 ON c2.emp_no = e.emp_no 
CROSS JOIN cte1 c1;




WITH emp_hired_from_jan_2000 AS (
	SELECT * FROM employees WHERE hire_date > '2000-01-01'
),
highest_contract_salary_values AS (
	SELECT e.emp_no, MAX(salary)
	FROM salaries s 
	JOIN emp_hired_from_jan_2000 e ON e.emp_no = s.emp_no 
	GROUP BY s.emp_no	
)
SELECT * FROM highest_contract_salary_values












