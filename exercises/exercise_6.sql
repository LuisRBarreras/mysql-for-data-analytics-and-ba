/*
  Exercise 6
  Create a procedure that asks you to insert an employee number and that will obtain an output containing
  the same number, as well as the number and name of the last department the employee has worked in.
  Finally, call the procedure for employee number 10010
*/
DROP PROCEDURE IF EXISTS get_department;

DELIMITER $$

CREATE PROCEDURE get_department(IN p_emp_no INTEGER )
BEGIN
	SELECT 
		de.emp_no, d.dept_no, d.dept_name
	FROM 
		dept_emp de
	JOIN 
		departments d ON de.dept_no = d.dept_no
	WHERE 
		de.emp_no = p_emp_no
		AND de.from_date = (SELECT 
				MAX(from_date) 
			FROM 
				dept_emp 
			WHERE 
			emp_no = p_emp_no);
END$$
DELIMITER ;


call get_department(10010);