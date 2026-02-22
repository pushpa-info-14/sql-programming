WITH Ranked AS (
    SELECT *, dense_rank() over (ORDER BY salary DESC) AS rnk FROM Employee
)

SELECT iif(
    (SELECT COUNT(*) FROM Ranked WHERE rnk = 2) = 0,
    NULL,
    (SELECT top(1) salary FROM Ranked WHERE rnk = 2)
) AS SecondHighestSalary
