CREATE PROC usp_CalculateFutureValueForAccount 
(@givenId INT, @givenInterestRate FLOAT)
AS
	BEGIN
	SELECT
	a.Id AS [Account Id]
   ,ah.FirstName AS [First Name]
   ,ah.LastName AS [Last Name]
   ,a.Balance AS [Current Balance]
   ,dbo.ufn_CalculateFutureValue(a.Balance, @givenInterestRate, 5) AS [Balance in 5 years]
	FROM Accounts AS a
	JOIN AccountHolders AS ah 
	ON a.AccountHolderId = ah.Id
	WHERE a.Id = @givenId
	END
