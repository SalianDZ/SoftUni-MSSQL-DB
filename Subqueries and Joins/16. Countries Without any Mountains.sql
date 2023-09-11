SELECT COUNT(*) FROM Countries as c
LEFT JOIN MountainsCountries AS mc
ON mc.CountryCode = c.CountryCode
WHERE mc.MountainId IS NULL