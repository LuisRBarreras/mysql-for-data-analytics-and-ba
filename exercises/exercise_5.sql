# Exercise 5
# Retrieve a list with all employees from the ‘titles’ table who are engineers. 
# Repeat the exercise, this time retrieving a list with all employees from the ‘titles’ table who are senior engineers.
SELECT 
  e.*, t.title
FROM 
  employees e
INNER JOIN 
  titles t ON e.emp_no = t.emp_no 
  AND title LIKE '%senior engineer%'
;