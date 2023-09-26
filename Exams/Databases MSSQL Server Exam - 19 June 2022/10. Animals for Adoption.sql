SELECT a.Name, YEAR(a.BirthDate) AS BirthYear, at.AnimalType FROM Animals AS a
JOIN AnimalTypes AS at
ON at.Id = a.AnimalTypeId
WHERE OwnerId IS NULL AND DATEDIFF(YEAR, birthdate, '2022-01-01') < 5 AND at.AnimalType != ('Birds')
ORDER BY A.Name

SELECT * FROM Animals