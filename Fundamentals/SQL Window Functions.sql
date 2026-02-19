-- 1. View the table
SELECT *
FROM BabyNames;

-- 2. Order by popularity
SELECT *
FROM BabyNames
ORDER BY Total DESC;

-- 3. Order a popularity column
SELECT Gender, [Name], Total,
	ROW_NUMBER() OVER(ORDER BY Total DESC) AS Popularity
FROM BabyNames;

-- 4. Try different functions
SELECT Gender, [Name], Total,
	ROW_NUMBER() OVER(ORDER BY Total DESC) AS Popularity,
	RANK() OVER(ORDER BY Total DESC) AS PopularityR,
	DENSE_RANK() OVER(ORDER BY Total DESC) AS PopularityDR
FROM BabyNames;
-- RANK(): If two items tie for 1st place, the next item is ranked 3rd (skips 2).
-- DENSE_RANK(): If two items tie for 1st place, the next item is ranked 2nd.

-- 5. Try different windows
SELECT Gender, [Name], Total,
	ROW_NUMBER() OVER(PARTITION BY Gender ORDER BY Total DESC) AS Popularity
FROM BabyNames;

-- 6. What are the top 3 most popular names for each gender?
SELECT * FROM
(SELECT Gender, [Name], Total,
	ROW_NUMBER() OVER(PARTITION BY Gender ORDER BY Total DESC) AS Popularity
FROM BabyNames) AS Pop
WHERE Popularity <= 3;