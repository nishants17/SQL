-- FINDING SALARY LESS THAN MAX SALARY
SELECT SALARY AS SECONDHIGHESTSALARY FROM EMPLOYEE
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE)
ORDER BY SALARY DESC
OFFSET 0 ROWS
FETCH FIRST 1 ROWS ONLY
