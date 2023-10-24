/*
Exercise 2
Find the lowest department number encountered in the 'dept_emp' table. Then, 
find the highest
department number.
*/
SELECT 
	MIN(dept_no) as min_dept_num,
	MAX(dept_no) as max_dept_num
FROM 
	t_dept_emp;