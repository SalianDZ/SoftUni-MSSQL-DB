CREATE FUNCTION ufn_CashInUsersGames(@gameName NVARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT SUM(Cash) AS TotalCash
    FROM (SELECT
	ROW_NUMBER() OVER(ORDER BY Cash DESC) AS [Index]
	,ug.Id
	,g.Name
	,ug.Cash
	FROM UsersGames AS ug
	JOIN Games AS g ON ug.GameId = g.Id
	WHERE LOWER(g.Name) = LOWER(@gameName)) AS subquery
    WHERE [Index] % 2 = 1  -- Filter rows with odd custom index
);