-- APPROACH 1
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

-- APPROCH 2
DELETE FROM Person
    WHERE Id IN
    (SELECT P1.Id FROM Person AS P1, Person AS P2 
	     WHERE P1.Id > P2.Id AND P1.Email = P2.Email);
