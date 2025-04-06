SELECT
name , bonus
FROM Employee AS A
LEFT JOIN
Bonus AS B
ON A.empID = B.empID
WHERE bonus < 1000 OR Bonus is NULL
