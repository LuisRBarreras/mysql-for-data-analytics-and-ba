-- Find the average salary of the male and female employees in each department. 

SELECT 
	e.gender,
	d.dept_name,
	AVG(s.salary)
FROM 
	t_salaries s
JOIN t_employees e on s.emp_no = e.emp_no
JOIN t_dept_emp de ON s.emp_no = de.emp_no 
JOIN t_departments d ON de.dept_no = d.dept_no
GROUP BY  d.dept_no, e.gender;