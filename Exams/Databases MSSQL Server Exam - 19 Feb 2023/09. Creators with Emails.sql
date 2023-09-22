SELECT FullName, Email, Rating FROM (SELECT 
	FullName, Email, MAX(Rating) AS Rating, DENSE_RANK() OVER(PARTITION BY FullName ORDER BY Rating DESC) AS [RankOrder]
FROM (SELECT 
	CONCAT_WS(' ', c.FirstName, c.LastName) AS FullName, Email, Rating
FROM Creators AS c
JOIN CreatorsBoardgames AS cb
ON c.Id = cb.CreatorId
JOIN Boardgames AS b
ON cb.BoardgameId = b.Id) AS subquery
WHERE RIGHT(Email, 4) = '.com'
GROUP BY FullName, Email, Rating) AS secondsubquery
WHERE RankOrder = 1