WITH CTE_TRANSACTIONS AS
(SELECT PAID_BY AS USER_ID, (-1 * AMOUNT) AMOUNT
 FROM transactions
 UNION ALL
 SELECT PAID_TO AS USER_ID, AMOUNT
 FROM transactions
),
CTE_USER_TOTAL AS
(SELECT USER_ID, SUM(AMOUNT) AS Total
 FROM CTE_TRANSACTIONS
 GROUP BY USER_ID)
SELECT U.USER_ID, USER_NAME, (U.CREDIT + ISNULL(CTE.Total,0)) AS CREDIT,
CASE WHEN (CREDIT + CTE.TOTAL) < 0 THEN 'Yes'
     ELSE 'No'
END AS CREDIT_LIMIT_BREACHED
FROM USERS U
LEFT JOIN CTE_USER_TOTAL CTE
ON CTE.USER_ID = U.USER_ID
ORDER BY U.USER_ID