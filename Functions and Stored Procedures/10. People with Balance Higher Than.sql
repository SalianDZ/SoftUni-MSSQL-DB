CREATE PROC usp_GetHoldersWithBalanceHigherThan 
(@number DECIMAL(18,4))
AS
	BEGIN
	SELECT FirstName, LastName
	FROM AccountHolders AS ah
	JOIN (SELECT AccountHolderId, SUM(Balance) AS BalanceSum FROM Accounts AS a
	INNER JOIN AccountHolders AS ah ON a.AccountHolderId = ah.Id
	GROUP BY AccountHolderId) AS ahsq ON ah.Id = ahsq.AccountHolderId
	WHERE BalanceSum > @number
	ORDER BY FirstName, LastName
	END

EXEC dbo.usp_GetHoldersWithBalanceHigherThan 2500

SELECT * FROM AccountHolders
SELECT * FROM Accounts