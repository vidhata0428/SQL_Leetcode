SELECT
player_id,
event_date AS first_login
FROM
(SELECT
player_id,
event_date,
DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_Date) AS RANKING
FROM ACTIVITY) AS A
WHERE RANKING = 1


