CREATE PROC usp_SearchByCategory(@category NVARCHAR(30))
AS
BEGIN
	SELECT
	b.[Name], b.YearPublished, b.Rating, c.[Name] AS CategoryName, p.[Name] AS PublisherName, CONCAT_WS(' ', pr.PlayersMin, 'people') AS MinPlayers, CONCAT_WS(' ', pr.PlayersMax, 'people') AS MaxPlayers 
	FROM Boardgames AS b
	JOIN Categories AS c 
	ON b.CategoryId = c.Id
	JOIN Publishers AS p
	ON p.Id = b.PublisherId
	JOIN PlayersRanges AS pr
	ON b.PlayersRangeId = pr.Id
	WHERE c.[Name] = @category
	ORDER BY p.[Name], b.YearPublished DESC 
END