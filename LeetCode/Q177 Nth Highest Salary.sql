CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN

DECLARE @result INT;

WITH Ranked AS(
    SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk FROM Employee
)

SELECT @result =  salary FROM Ranked WHERE rnk = @N;

RETURN @result;
END