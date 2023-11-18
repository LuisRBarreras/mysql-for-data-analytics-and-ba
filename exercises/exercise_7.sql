-- Exercise 7
-- How many contracts have been registered in the ‘salaries’ table with duration of more than one year and
-- of value higher than or equal to $100,000?
-- Hint: You may wish to compare the difference between the start and end date of the salaries contracts.
SELECT 
  COUNT(*) 
FROM 
  salaries
WHERE 
  DATEDIFF(to_date, from_date) > 365  
  AND salary >= 100000;
