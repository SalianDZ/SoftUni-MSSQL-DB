SELECT
	cn.ContinentCode
FROM Continents as cn
JOIN Countries as c
ON cn.ContinentCode = c.ContinentCode








SELECT TOP 5
	CountryName
   ,r.RiverName
FROM Countries AS c
JOIN Continents as cn
ON c.ContinentCode = cn.ContinentCode
LEFT JOIN CountriesRivers AS cr
ON c.CountryCode = cr.CountryCode
LEFT JOIN Rivers AS r
ON r.Id = cr.RiverId
WHERE cn.ContinentName = 'Africa'
ORDER BY c.CountryName