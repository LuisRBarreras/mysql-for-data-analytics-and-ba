
SET @v_avg_salary = 0;

CALL employees.emp_avg_salary_out(11300, @v_avg_salary);

SELECT @v_avg_salary;


SET @v_emp_no = 0;
CALL  emp_info('Aruna', 'Journel', @v_emp_no)
SELECT @v_emp_np;











# A sessions begin at a certain point in time and termiante at another point 
# @ indicates a session variable 
SET @s_var1 = 3;

SELECT @s_var1;



# Global variables apply to all connections to a specific server 
# you cannot set just any variable as global 
# Are specific system variables
# SET GLOBAL  var_name;
# .MAX_CONNECTIONS_PER_HOUR

SET GLOBAL max_connections = 1000;
SET @@global.max_connections = 1;



# User defined vs System variables 
# user-defined:  
# system:

SET SESSION sql_mode 










