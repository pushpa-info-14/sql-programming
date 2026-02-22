SELECT w2.id
FROM Weather w1
INNER JOIN Weather w2 ON w2.recordDate = DATEADD(DAY, 1, w1.recordDate)
WHERE w2.temperature > w1.temperature;