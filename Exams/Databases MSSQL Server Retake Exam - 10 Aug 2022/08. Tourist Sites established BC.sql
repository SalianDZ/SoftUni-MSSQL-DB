SELECT
s.[Name], l.[Name], l.Municipality, l.Province, s.Establishment
FROM Sites AS s
JOIN Locations AS l
ON s.LocationId = l.Id
WHERE LEFT(l.[Name], 1) NOT IN ('B','M','D') AND
RIGHT(s.Establishment, 2) = 'BC'
ORDER BY s.[Name]