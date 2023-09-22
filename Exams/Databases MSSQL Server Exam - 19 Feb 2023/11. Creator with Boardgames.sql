CREATE FUNCTION udf_CreatorWithBoardgames(@name NVARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @boardGamesCounter INT

	SET @boardGamesCounter = (SELECT Count(cb.BoardgameId) AS CountGames FROM Creators AS c
	JOIN CreatorsBoardgames AS cb
	ON c.Id = cb.CreatorId
	WHERE c.FirstName = @name)

	RETURN @boardGamesCounter
END