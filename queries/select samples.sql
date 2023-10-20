SELECT
	first_name,
	last_name 
FROM
	employees;
	
	
	
	SELECT dept_no FROM departments;
	
	
SELECT
	* 
FROM
	employees 
WHERE
	gender ='F' AND (first_name = 'Kellie' OR first_name = 'Aruna')
	
	
	
	SELECT * FROM employees where first_name NOT IN('Cathie', 'Mark', 'Nathan');
	
	SELECT * FROM employees where first_name IN ('Denis', 'Elvis');
	
	SELECT * FROM employees  where first_name LIKE('%ar');
	SELECT * FROM employees  where first_name LIKE('Mar_');
		
	SELECT * FROM employees  where first_name NOT LIKE('%Mar%');
	
	SELECT * FROM employees where first_name LIKE ('Mark%');
	
	SELECT * FROM employees where hire_date LIKE ('2000%');
		
	SELECT * FROM employees where emp_no LIKE('1000_');
	
	SELECT * FROM employees where first_name LIKE('%Jack%');
	SELECT * FROM employees where first_name NOT LIKE('%Jack%');
	
	SELECT * FROM employees where hire_date BETWEEN '1990-01-01' AND '2000-01-01';
	
	SELECT * FROM employees where hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';
	

SELECt * from salaries where salary BETWEEN 66000 AND 70000 ORDER BY salary ASC;
	
SELECT * FROM employees  where emp_no  NOT BETWEEN 10004 AND 10012;
	
SELECT * from departments as d where d.dept_no BETWEEN 'd003' AND 'd006'; 
	
SELECT * FROM employees WHERE first_name IS NULL;
		
SELECT * from departments as d where d.dept_no IS NOT NULL;
	
SELECT * FROM employees WHERE first_name <> 'Mark';

SELECT * FROM employees WHERE first_name != 'Mark';
	
SELECT * FROM employees WHERE hire_date >= '2000-01-01';

SELECT * FROM employees WHERE gender = 'F' AND hire_date >= '2000-01-01';
	
SELECT * from  salaries where salary > 150000;
	
	
	SELECT DISTINCT gender FROM employees;
	
	
SELECT DISTINCT hire_date FROM employees;
	
SELECT COUNT(DISTINCT first_name) FROM employees;
	
SELECT COUNT(emp_no) FROM salaries WHERE salary >= 100000;
	
SELECT COUNT(*) FROM dept_manager;
	
SELECT * FROM employees order by first_name DESC;
	
SELECT * FROM employees order by first_name, last_name DESC;
	
	
SELECT * FROM employees ORDER BY hire_date DESC;


SELECT 
	first_name, COUNT(first_name) AS names_count 
FROM 
	employees 
GROUP BY first_name 
ORDER BY first_name ASC;



	SELECT 
		salary, COUNT(emp_no) AS emps_with_same_salary 
	FROM salaries 
	where salary > 80000
	GROUP BY salary
	ORDER BY salary;
	
	
	
	SELECT first_name, COUNT(first_name) as name_count 
	FROM employees 
	GROUP BY first_name
	HAVING COUNT(first_name) > 250
	ORDER BY first_name;
	
SELECT emp_no, AVG(salary)
FROM
    salaries

GROUP BY emp_no
	HAVING AVG(salary) > 120000
ORDER BY emp_no;




SELECT 
	first_name, count(first_name) as names_count
FROM 
	employees
WHERE 
	hire_date > '1990-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;



SELECT * from dept_emp;

SELECT 
	emp_no, COUNT(from_date) 
FROM 
	dept_emp
WHERE 
	from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;



SELECT 
	* 
FROM 
	salaries
ORDER BY salary DESC
LIMIT 10;

SELECT * FROM dept_emp limit 100;

	