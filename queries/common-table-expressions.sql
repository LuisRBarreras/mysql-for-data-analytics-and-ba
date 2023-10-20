# cte common table expression 
# you can a use a single query to make the required 

SET sql_mode=''
	
WITH cte AS (
	SELECT AVG(salary) as avg_salary FROM salaries
)
SELECT
	SUM(CASE WHEN s.salary > c.avg_salary THEN 1 ELSE 0 END) as no_f_salary_above_avg_w_sum,
	COUNT(CASE WHEN s.salary > c.avg_salary THEN s.salary ELSE NULL END) AS no_f_salary_avg_w_count,
	COUNT(s.salary) AS total_no_of_salary_contracts,
	c.avg_salary
FROM
	salaries s 
JOIN 
	employees e ON s.emp_no  = e.emp_no AND e.gender = 'F'
CROSS JOIN
	cte c;
	
	
	
	
	WITH cte as ( 
		SELECT AVG(salary) as avg_salary FROM salaries
	)
SELECT
	SUM(CASE WHEN s.salary > c.avg_salary THEN 1 ELSE 0 END) as no_m_salary_above_avgm,
	COUNT(s.salary) as total_num_salaries
FROM 
	salaries s
JOIN
	employees e on s.emp_no = e.emp_no AND e.gender ='M'
CROSS JOIN cte c;




	WITH cte as ( 
		SELECT AVG(salary) as avg_salary FROM salaries
	)
SELECT
	SUM(CASE WHEN s.salary < c.avg_salary THEN 1 ELSE 0 END) as no_m_salary_above_avgm,
	COUNT(s.salary) as total_num_salaries
FROM 
	salaries s
JOIN
	employees e on s.emp_no = e.emp_no AND e.gender ='M'
CROSS JOIN cte c;





SELECT
	SUM(CASE WHEN s.salary < a.avg_salary THEN 1 ELSE 0 END) as no_m_salary_above_avgm,
	COUNT(s.salary) as total_num_salaries
FROM 
(SELECT AVG(salary) as avg_salary FROM salaries ) AS  a

JOIN salaries s 
JOIN  employees e on s.emp_no = e.emp_no AND e.gender ='M'



	WITH cte as ( 
		SELECT AVG(salary) as avg_salary FROM salaries
	)
SELECT 
	Sum(case when s.salary <c.avg_salary then 1 else 0 END) as no_salries_below_avg

FROM 
	salaries s 
JOIN 
	employees e on s.emp_no = e.emp_no AND e.gender = 'M'
CROSS JOIN cte c;









