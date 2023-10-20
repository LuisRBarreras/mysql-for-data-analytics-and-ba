
-- Value Windows FUNCTION

set sql_mode='';


SELECT 
	emp_no,
	salary,
	LAG(salary) OVER w  AS previous_salary,
	LEAD(salary) OVER w AS next_salary,
	salary - lag(salary) over w AS diff_salary_current_previous,
	LEAD(salary) OVER w - salary AS diff_salary_next_current
FROM
	salaries
	
WHERE emp_no = 10001
WINDOW w AS  (ORDER BY salary) 
;





SELECT 
	emp_no,
	salary,
	LAG(salary) OVER w  AS previous_salary,
	LEAD(salary) OVER w AS next_salary,
	salary - lag(salary) over w AS diff_salary_current_previous,
	LEAD(salary) OVER w - salary AS diff_salary_next_current
FROM
	salaries
WHERE emp_no BETWEEN 10500 AND 10600
AND salary > 80000
WINDOW w AS  (PARTITION BY emp_no ORDER BY salary) 
;



