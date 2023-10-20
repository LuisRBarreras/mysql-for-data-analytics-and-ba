# Indexes 
# data is taken from a column of the table and is store in a certain order in a distinct place 
# increase the speed of searches 


CREATE INDEX i_hire_date ON employees(hire_date);



EXPLAIN SELECT * FROM employees WHERE hire_date > '2000-01-01';


# composite index 
CREATE INDEX i_composite ON employees(first_name, last_name);


# primary and unique keys are indexes 

SELECT * FROM employees
WHERE first_name = 'Georgi' AND last_name = 'Facello';


DESCRIBE employees;

ALTER TABLE employees
DROP INDEX i_hire_date

# improvement of speed search and the resource used for its execution (good balance)
SHOW INDEX FROM employees;




CREATE INDEX i_salary ON salaries (salary);

SELECT * 
FROM salaries 
WHERE salary > 89000
