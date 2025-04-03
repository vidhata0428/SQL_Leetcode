WITH ConsecutiveVisits AS (
    SELECT 
        id, 
        visit_date, 
        people,
        id - DENSE_RANK() OVER (ORDER BY id) AS grp
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM ConsecutiveVisits
WHERE grp IN (
    SELECT grp FROM ConsecutiveVisits 
    GROUP BY grp 
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date;


