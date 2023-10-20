-- self join 
-- applied when a table must join itself 


-- Task From th emp_Manager table, extract record data only of those employees 
-- who are as well manager

SELECT 
	* 
from emp_manager;


SELECT
	e1.emp_no, e1.dept_no, e2.manager_no
FROM 
	emp_manager e1 
JOIN 
	emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE 
	e2.emp_no IN (SELECT manager_no FROM emp_manager );