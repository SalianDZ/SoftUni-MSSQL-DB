SELECT c.LastName, CEILING(AVG(Rating)), p.[Name] FROM Creators AS c
JOIN CreatorsBoardgames AS cb
ON c.Id = cb.CreatorId
JOIN Boardgames AS b
ON b.Id = cb.BoardgameId
JOIN Publishers AS p
ON b.PublisherId = p.Id
WHERE p.Name = 'Stonemaier Games'
GROUP BY c.LastName, p.[Name]
ORDER BY AVG(Rating) DESC