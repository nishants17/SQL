-- APPROACH 1:SELECTING ALL EMPLOYEES WHOSE SALARY IS GREATER THAN MANAGER USING SUBQUERY
SELECT NAME AS EMPLOYEE FROM EMPLOYEE
WHERE ID IN (SELECT E1.ID 
                FROM EMPLOYEE E1
                JOIN EMPLOYEE E2
                ON E1.MANAGERID = E2.ID
                WHERE E1.MANAGERID IS NOT NULL
                AND E1.SALARY > E2.SALARY)
                
-- APPROACH 2: IS NOT NULL CHECK IS NOT REQUIRED
SELECT NAME AS EMPLOYEE FROM EMPLOYEE
WHERE ID IN (SELECT E1.ID 
                FROM EMPLOYEE E1
                JOIN EMPLOYEE E2
                ON E1.MANAGERID = E2.ID
               -- WHERE E1.MANAGERID IS NOT NULL
                WHERE E1.SALARY > E2.SALARY)
