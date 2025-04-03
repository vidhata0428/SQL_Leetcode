WITH DuplicateEmails AS (
    SELECT 
        MIN(ID) AS KeepID, 
        EMAIL 
    FROM PERSON 
    GROUP BY EMAIL
)
DELETE FROM PERSON 
WHERE ID NOT IN (SELECT KeepID FROM DuplicateEmails);
