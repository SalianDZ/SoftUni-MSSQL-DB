SELECT TOP 5
b.[Name], b.Rating, c.[Name]
FROM Boardgames AS b
JOIN Categories AS c
ON b.CategoryId = c.Id
JOIN PlayersRanges AS pc
ON b.PlayersRangeId = pc.Id
WHERE (b.Rating > 7.00 AND b.[Name] LIKE '%a%')
OR (b.Rating > 7.50 AND pc.PlayersMin >= 2 AND pc.PlayersMax <= 5)
ORDER BY b.[Name], b.Rating DESC