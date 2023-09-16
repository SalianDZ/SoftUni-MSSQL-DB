CREATE PROC usp_GetTownsStartingWith
		(@start NVARCHAR(200))
AS
	SELECT 
	Name
	FROM Towns
	WHERE Name LIKE LOWER(@start) + '%'
