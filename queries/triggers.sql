##########################################################
##########################################################

-- SECTION: Advanced SQL Topics

##########################################################
##########################################################



###########
-- LECTURE: MySQL Triggers


# In this lesson, we will introduce you to MySQL triggers.

# By definition, a MySQL trigger is a type of stored program, associated with a table, 
# that will be activated automatically once a specific event related to the table of association occurs. 

# This event must be related to one of the following three DML statements: INSERT, UPDATE, or DELETE. 
# Therefore, triggers are a powerful and handy tool that professionals love to use where database consistency 
# and integrity are concerned.
# In other words, a trigger is a MySQL object that can “trigger” a specific action or calculation ‘before’ or ‘after’ an INSERT, 
# UPDATE, or DELETE statement has been executed. For instance, a trigger can be activated before a new record is inserted into a table, 
# or after a record has been updated.


USE employees;

COMMIT;

DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = 0; 
	END IF; 
END $$

DELIMITER ;



# Let’s check the values of the “Salaries” table for employee 10001.
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
# Now, let’s insert a new entry for employee 10001, whose salary will be a negative number.
INSERT INTO salaries VALUES ('10001', -92891, '2010-06-22', '9999-01-01');




    
# You can see that the “before_salaries_insert” trigger was activated automatically. It corrected the value of minus 92,891 
# we tried to insert. 

# Fantastic!

# Now, let’s look at a BEFORE UPDATE trigger. The code is similar to the one of the trigger we created above, with two 
# substantial differences.
# BEFORE UPDATE
DELIMITER $$

CREATE TRIGGER trig_upd_salary
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = OLD.salary; 
	END IF; 
END $$

DELIMITER ;

# First, we indicated that this will be a BEFORE UPDATE trigger.  
/*
BEFORE UPDATE ON salaries
*/


# Then, run the following UPDATE statement, with which we will modify the salary value of employee 10001 with another positive value.
UPDATE salaries 
SET 
    salary = 98765
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
# Execute the following SELECT statement to see that the record has been successfully updated.
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
				
UPDATE salaries 
SET 
    salary = - 50000
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        




# For instance, SYSDATE() delivers the date and time of the moment at which you have invoked this function.
SELECT SYSDATE();

# Another frequently employed function, “Date Format”, assigns a specific format to a given date. For instance, the following query 
# could extract the current date, quoting the year, the month, and the day. 
SELECT DATE_FORMAT(SYSDATE(), '%y-%m-%d') as today;



DELIMITER $$

CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary int;
    
	SELECT 
			MAX(salary)
	INTO v_curr_salary 
	FROM
		salaries
	WHERE
		emp_no = NEW.emp_no;

	IF v_curr_salary IS NOT NULL THEN
		UPDATE salaries 
		SET 
			to_date = SYSDATE()
		WHERE
			emp_no = NEW.emp_no and to_date = NEW.to_date;

		INSERT INTO salaries 
			VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
	END IF;
END $$

DELIMITER ;

# After you are sure you have understood how this query works, please execute it and then run the following INSERT statement.  
INSERT INTO dept_manager VALUES ('111534', 'd009', date_format(sysdate(), '%y-%m-%d'), '9999-01-01');

# SELECT the record of employee number 111534 in the ‘dept_manager’ table, and then in the ‘salaries’ table to see how the output was affected. 
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no = 111534;
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 111534;

# Conceptually, this was an ‘after’ trigger that automatically added $20,000 to the salary of the employee who was just promoted as a manager. 
# Moreover, it set the start date of her new contract to be the day on which you executed the insert statement.

# Finally, to restore the data in the database to the state from the beginning of this lecture, execute the following ROLLBACK statement. 
ROLLBACK;

# End.





DELIMITER $$
CREATE TRIGGER trig_hire_date 
BEFORE INSERT ON employees
FOR EACH ROW 
BEGIN
	IF NEW.hire_date > date_format(SYSDATE(),  '%Y-%m-%d') 
	THEN 
		SET NEW.hire_date = date_format(SYSDATE(), '%Y-%m-%d'); 

     END IF;  
END $$


DELIMITER ;

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  

SELECT * FROM employees ORDER BY emp_no DESC;


