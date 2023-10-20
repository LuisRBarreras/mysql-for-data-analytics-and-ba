
# each query in sql procudes a temporary dataset 
# A temporary result like:
# JOINs 
# Subqueries
# Window functions 
# Common Table Expressions (CTEs)
# Temporary tables 

# Temoprary table is often used "at the back" when executing 
# could be beneficial if we need to refect a result set multiple times in out analysis 
CREATE TEMPORARY TABLE f_highest_salaries
SELECT
	s.emp_no, MAX(s.salary) AS f_highest_salary 
FROM 
	salaries s 
JOIN
	employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY s.emp_no;



SELECT * FROM f_highest_salaries
WHERE emp_no <= '10010';

DROP TEMPORARY TABLE IF EXISTS f_highest_salaries;




CREATE TEMPORARY TABLE m_highest_salaries 
SELECT 
	s.emp_no, MAX(s.salary) AS f_highest_salary 
FROM 
	salaries s 
JOIN 
	employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
	GROUP BY s.emp_no;


SELECT * FROM m_highest_salaries;


DROP TEMPORARY TABLE IF EXISTS m_highest_salaries;


# Temporary tables are lock up during a query, if you want to use a UNION use it in combination of a CTE

WITH cte AS (
	SELECT
		s.emp_no, MAX(s.salary) AS f_highest_salary 
	FROM 
		salaries s 
	JOIN
		employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
	GROUP BY s.emp_no
	LIMIT 10
)

SELECT * FROM f_highest_salaries f1 JOIN cte c;


CREATE TEMPORARY TABLE dates
SELECT
	NOW() AS current_date_and_time,
	DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
	DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later;


SELECT * from dates;



WITH cte AS (
	SELECT
		NOW() AS current_date_and_time,
		DATE_SUB(NOW(), INTERVAL 2 MONTH) AS a_month_earlier,
		DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later
)
SELECT * FROM cte c CROSS JOIN cte c1


# Exercise lecture Other features of MySQL Temporary Tables

DROP TEMPORARY TABLE IF EXISTS dates;



CREATE TEMPORARY TABLE dates 
SELECT
	NOW() AS current_date_and_time,
	DATE_SUB(NOW(), INTERVAL 2 MONTH) AS two_months_earlier,
	DATE_SUB(NOW(), INTERVAL -2 YEAR) AS two_years_later;
	

WITH cte AS (
	SELECT
		NOW() AS current_date_and_time,
		DATE_SUB(NOW(), INTERVAL 2 MONTH) AS two_months_earlier,
		DATE_SUB(NOW(), INTERVAL -2 YEAR) AS two_years_later
)
SELECT * FROM dates
 JOIN cte c;


WITH cte AS (
	SELECT
		NOW() AS current_date_and_time,
		DATE_SUB(NOW(), INTERVAL 2 MONTH) AS two_months_earlier,
		DATE_SUB(NOW(), INTERVAL -2 YEAR) AS two_years_later
)
SELECT * 
FROM dates 
UNION SELECT * FROM cte;


