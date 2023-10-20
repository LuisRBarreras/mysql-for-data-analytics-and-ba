-- Name: inserts
SELECT
	* 
FROM
	employees
	ORDER BY emp_no DESC 
	LIMIT 10;
	
INSERT INTO employees ( emp_no, birth_date, first_name, last_name, gender, hire_date )
VALUES
	( 999901, '1986-04-21', 'John', 'Smith', 'M', '2011-01-01' );
	
	describe employees;
	
	
	INSERT INTO employees

	SELECT * FROM titles  ORDER BY emp_no desc limit 10 ;
	INSERT into titles (emp_no, title, from_date)
	VALUES (999903, 'Senior Engineer', '1997-10-1')
	
	
	SELECT * from departments;
	select * from dept_emp ORDER BY emp_no DESC;
	
	INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
	VALUES (999903, 'd005', '1997-10-01', '9999-01-01')
	
	
	SELECT * FROM departments_dup;
	
	
	CREATE TABLE departments_dup (
		dept_no CHAR(4) NOT NULL,
		dept_name VARCHAR(40) NOT NULL
	);
	
	INSERT INTO departments_dup
	SELECT * FROM departments;
	
	
	INSERT INTO departments
	VALUES('d010', 'Business Analysis')
	
	
	
	
	
	
	

	