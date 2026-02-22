-- 1. View the table (note the missing dates)
SELECT * FROM sales;

-- 2. Preview the final results
SELECT * FROM final_sales;

-- 3. Generate a series of dates [UNION, UNION ALL]
SELECT '2025-01-01' AS dt
UNION
SELECT '2025-01-02'
UNION
SELECT '2025-01-03';

-- 4. Join with our original table [Subquery, Left Join, Inner Join]
SELECT sq.dt, sales.num_sales
FROM
(SELECT '2025-01-01' AS dt
UNION ALL
SELECT '2025-01-02'
UNION ALL
SELECT '2025-01-03'
UNION ALL
SELECT '2025-01-04'
UNION ALL
SELECT '2025-01-05'
UNION ALL
SELECT '2025-01-06'
UNION ALL
SELECT '2025-01-07') AS sq
LEFT JOIN sales ON sq.dt = sales.dt;

-- 5. Rewrite subquery as a CTE [CTE]
WITH cte AS (
	SELECT '2025-01-01' AS dt
	UNION ALL
	SELECT '2025-01-02'
	UNION ALL
	SELECT '2025-01-03'
	UNION ALL
	SELECT '2025-01-04'
	UNION ALL
	SELECT '2025-01-05'
	UNION ALL
	SELECT '2025-01-06'
	UNION ALL
	SELECT '2025-01-07'
)
SELECT cte.dt, sales.num_sales
FROM cte
LEFT JOIN sales ON cte.dt = sales.dt;

-- 6. Rewrite CTE as a recursive CTE [Recursive CTE, Date Expression, CAST Function]
WITH cte AS (
	SELECT CAST('2025-01-01' AS DATE) AS dt

	UNION ALL

	SELECT DATEADD(DAY, 1, dt)
	FROM cte
	WHERE dt < CAST('2025-01-07' AS DATE)
)
SELECT cte.dt, sales.num_sales
FROM cte
LEFT JOIN sales ON cte.dt = sales.dt;

-- 7. Fill in null values [NULL Function, Numeric Function]
WITH cte AS (
	SELECT CAST('2025-01-01' AS DATE) AS dt

	UNION ALL

	SELECT DATEADD(DAY, 1, dt)
    FROM cte
    WHERE dt < CAST('2025-01-07' AS DATE)
)
SELECT cte.dt, sales.num_sales,
	COALESCE(sales.num_sales, 0) AS sales_estimate,
    COALESCE(sales.num_sales, ROUND((SELECT AVG(sales.num_sales) FROM sales), 1)) AS sales_estimate_2
FROM cte
LEFT JOIN sales ON cte.dt = sales.dt;

-- 8. Introduce window functions [Window Functions]
SELECT dt, num_sales,
	ROW_NUMBER() OVER(ORDER BY dt) AS row_num,
    LAG(num_sales) OVER(ORDER BY dt) AS prior_row,
    LEAD(num_sales) OVER(ORDER BY dt) AS next_row
FROM sales;

-- 9. Add on two window functions [Final Query]
WITH cte AS (
	SELECT CAST('2025-01-01' AS DATE) AS dt

	UNION ALL

	SELECT DATEADD(DAY, 1, dt)
    FROM cte
    WHERE dt < CAST('2025-01-07' AS DATE)
)
SELECT cte.dt,
    COALESCE(
		sales.num_sales,
		ROUND(
			(LAG(sales.num_sales) OVER(ORDER BY cte.dt) +
			LEAD(sales.num_sales) OVER(ORDER BY cte.dt))/2, 1)
			) AS sales_estimate
FROM cte
LEFT JOIN sales ON cte.dt = sales.dt;
