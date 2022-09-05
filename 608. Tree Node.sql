SELECT ID,
            CASE
                WHEN ID IN (SELECT ID FROM TREE WHERE P_ID IS NULL) THEN 'Root'
                WHEN ID IN (SELECT P_ID FROM TREE WHERE P_ID IS NOT NULL) THEN 'Inner'
                ELSE 'Leaf'
            END AS TYPE
FROM TREE
