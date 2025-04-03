SELECT
    ROUND(
        COUNT(DISTINCT a1.player_id) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity)
    , 2) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) a1
JOIN Activity a2
    ON a1.player_id = a2.player_id
    AND DATEDIFF(DAY, a1.first_login, a2.event_date) = 1;