-- Approach 1
WITH CTE_MANAGERS AS
(SELECT ID, NAME
 FROM EMPLOYEE
 WHERE ID IN (SELECT DISTINCT MANAGERID FROM EMPLOYEE))
 SELECT CTE_M.NAME
 FROM CTE_MANAGERS CTE_M
 JOIN EMPLOYEE E
 ON CTE_M.ID = E.MANAGERID
 GROUP BY CTE_M.NAME
 HAVING COUNT(E.MANAGERID) >= 5

-- Approach 2
WITH CTE_CNT_REPORTS AS
(SELECT MANAGERID, COUNT(*) AS CNT
 FROM EMPLOYEE
 GROUP BY MANAGERID
 HAVING COUNT(*) >= 5
 )
SELECT NAME FROM EMPLOYEE
WHERE ID IN (SELECT MANAGERID FROM CTE_CNT_REPORTS)

-- Approach 3
SELECT NAME FROM EMPLOYEE WHERE
ID IN (
SELECT MANAGERID FROM (
SELECT MANAGERID, COUNT(MANAGERID) AS CNT FROM EMPLOYEE E1
JOIN (SELECT ID FROM EMPLOYEE) E2
ON E1.MANAGERID = E2.ID
GROUP BY E1.MANAGERID
HAVING COUNT(MANAGERID) >= 5) TEMP)