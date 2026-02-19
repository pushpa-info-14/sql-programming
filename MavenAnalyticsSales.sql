IF NOT EXISTS (
	SELECT 1
	FROM sys.databases
	WHERE name = 'MavenAnalyticsSales'
)
BEGIN
    CREATE DATABASE MavenAnalyticsSales;
END
GO

USE MavenAnalyticsSales;
GO

CREATE TABLE sales (
    dt DATE,
    num_sales INT
);

INSERT INTO sales (dt, num_sales)
VALUES
    ('2025-01-01', 61),
    ('2025-01-02', 72),
    ('2025-01-04', 84),
    ('2025-01-05', 95),
    ('2025-01-07', 77);

CREATE TABLE final_sales (
    dt DATE,
    num_sales INT
);

INSERT INTO final_sales (dt, num_sales)
VALUES
    ('2025-01-01', 61),
    ('2025-01-02', 72),
    ('2025-01-03', 78),
    ('2025-01-04', 84),
    ('2025-01-05', 95),
    ('2025-01-06', 86),
    ('2025-01-07', 77);