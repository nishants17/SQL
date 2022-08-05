DELETE FROM PERSON 
WHERE ID IN (
SELECT ID FROM (
    SELECT ID, ROW_NUMBER() OVER (PARTITION BY EMAIL ORDER BY ID ASC) RN
    FROM PERSON 
    WHERE EMAIL IN (SELECT EMAIL
                    FROM PERSON
                    GROUP BY EMAIL
                    HAVING COUNT(*) > 1
                    )
               ) TEMP WHERE RN <> 1
            )
