-- FINDING SALARY LESS THAN MAX SALARY
SELECT MAX(SALARY) AS SECONDHIGHESTSALARY FROM EMPLOYEE
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE)
ORDER BY MAX(SALARY) DESC
OFFSET 0 ROWS
FETCH FIRST 1 ROWS ONLY

-- RANKING SALARY APPROACH
WITH CTE_RANK_SALARY AS 
(SELECT SALARY, DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RANK
 FROM EMPLOYEE)
SELECT MAX(SALARY) AS SECONDHIGHESTSALARY FROM CTE_RANK_SALARY
WHERE RANK = 2
