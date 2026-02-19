IF NOT EXISTS (
	SELECT 1
	FROM sys.databases
	WHERE name = 'MavenAnalyticsBabyNames'
)
BEGIN
    CREATE DATABASE MavenAnalyticsBabyNames;
END
GO

USE MavenAnalyticsBabyNames;
GO

CREATE TABLE BabyNames (
		Gender VARCHAR(10),
		Name VARCHAR(50),
		Total INT
	);

INSERT INTO BabyNames (Gender, Name, Total)
VALUES ('Girl', 'Ava', 95),
	('Girl', 'Emma', 106),
	('Boy', 'Ethan', 115),
	('Girl', 'Isabella', 100),
	('Boy', 'Jacob', 101),
	('Boy', 'Liam', 84),
	('Boy', 'Logan', 73),
	('Boy', 'Noah', 120),
	('Girl', 'Olivia', 100),
	('Girl', 'Sophia', 88);