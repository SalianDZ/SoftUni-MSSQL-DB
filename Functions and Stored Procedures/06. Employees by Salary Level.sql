CREATE PROC usp_EmployeesBySalaryLevel(@level VARCHAR(7))
AS
	SELECT FirstName
		  ,LastName
	FROM (SELECT FirstName
		  ,LastName
		  ,Salary
		  ,dbo.ufn_GetSalaryLevel(Salary) AS SalaryLevel
		  FROM Employees) AS subquery
		  WHERE LOWER(SalaryLevel) = LOWER(@level)