
DELIMITER ;
DROP PROCEDURE IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(in p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2))
BEGIN
	SELECT 
		AVG(s.salary)
	INTO 
		p_avg_salary 
	FROM
		employees e 
	JOIN
		salaries s ON e.emp_no = s.emp_no 
	WHERE e.emp_no = p_emp_no;
END$$

DELIMITER ;

call emp_avg_salary(int p_emp_no)



DESCRIBE employees;

DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$ 
CREATE PROCEDURE emp_info(
	in p_first_name VARCHAR(14), in p_last_name VARCHAR(16), 
	OUT p_emp_no INTEGER)
BEGIN
	SELECT e.emp_no 
	INTO p_emp_no 
	FROM employees e
	WHERE 
		e.first_name = p_first_name  
		AND e.last_name = p_last_name
		;
END$$


DELIMITER ;











