CREATE PROC usp_GetEmployeesFromTown
		(@town NVARCHAR(200))
AS
	SELECT
	FirstName
   ,LastName
	FROM Employees AS e
	JOIN Addresses AS a 
	ON e.AddressID = a.AddressID
	JOIN Towns AS t
	ON t.TownID = a.TownID
	WHERE LOWER(t.Name) = LOWER(@town)

EXEC dbo.usp_GetEmployeesFromTown 'Sofia'
