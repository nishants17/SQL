--The total monthly income of an account in some month is the sum of all its deposits in that month
--(i.e., transactions of the type 'Creditor').
-- Suspicious -> Total income > Max_income for 2 or more consecutive months
-- PENDING TO SOLVE **
WITH CTE_TOTAL_MONTHLY_INCOME AS
(SELECT ACCOUNT_ID, MONTH(DAY) AS MONTH, SUM(AMOUNT) AS TOTAL_INCOME
 FROM transactions
 GROUP BY ACCOUNT_ID, MONTH(DAY)
 HAVING TYPE = 'Creditor'
),
CTE_CONSECUTIVE_MONTHS_INCOME AS
(SELECT ACCOUNT_ID, RANK() OVER (PARTITION BY MONTH(DAY) ORDER BY MONTH(DAY)), TOTAL_INCOME
 FROM CTE_CONSECUTIVE_MONTHS_INCOME CTE1
 JOIN CTE_TOTAL_MONTHLY_INCOME CTE2
 ON CTE1.ACCOUNT_ID = CTE2.ACCOUNT_ID)
SELECT ACCOUNT_ID
FROM CTE_CONSECUTIVE_MONTHS_INCOME CTE
JOIN ACCOUNTS ACC
ON CTE.ACCOUNT_ID = ACC.ACCOUNT_ID
WHERE TOTAL_INCOME > Max_income
