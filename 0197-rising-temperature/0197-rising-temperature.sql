WITH CTE AS (
SELECT
ID,
recordDate,
temperature,
LEAD(id ,1) OVER (ORDER BY recordDate) LEAD_ID,
LEAD(recordDate, 1) OVER (ORDER BY recordDate) AS LEAD_DATE,
LEAD(Temperature, 1) OVER (ORDER BY recordDate) AS LEAD_TEMP
FROM WEATHER
)
SELECT LEAD_ID AS id
FROM CTE
WHERE Temperature < LEAD_TEMP AND DATEDIFF(DAY,recordDate,LEAD_DATE)=1;


