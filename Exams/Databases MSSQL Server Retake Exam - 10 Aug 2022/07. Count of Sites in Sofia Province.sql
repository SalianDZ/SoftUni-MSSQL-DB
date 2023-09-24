SELECT l.Province, l.Municipality, l.[Name] AS [Location], Count(l.Name) AS [CountOfSites] FROM Locations AS l
JOIN Sites AS s
ON l.Id = s.LocationId
WHERE l.Province = 'Sofia'
GROUP BY l.Province, l.Municipality, l.[Name]
ORDER BY Count(l.Name) DESC, l.[Name] 