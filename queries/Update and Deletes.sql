select * from departments;

DELETE from departments WHERE dept_no = 'd010';


UPDATE departments
SET dept_name = 'Data Analysis'
WHERE dept_name = 'Business Analysis'




COMMIT;

SELECT * FROM employees WHERE emp_no = 999903;

SELECT * FROM titles WHERE emp_no = 999903;

ROLLBACK;

DELETE FROM employees
WHERE emp_no = 999903;


SET autocommit = 0;


SELECT * FROM departments_dup;
COMMIT;
DELETE FROM departments_dup;

ROLLBACK;

/**
DROP VS TRUNCATE VS Delete
DROP remove data and structure 
TRUNCATE Delete all records from TABLE , when truncating, auto-increment values will be reset 
DELETE removes records row by row


*/


