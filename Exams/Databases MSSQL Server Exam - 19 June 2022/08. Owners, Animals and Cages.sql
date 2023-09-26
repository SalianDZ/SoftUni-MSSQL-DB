SELECT CONCAT_WS('-', o.Name, a.Name), o.PhoneNumber, c.Id AS CageId FROM Animals AS a
JOIN Owners AS o
ON a.OwnerId = o.Id
JOIN AnimalsCages AS ac
ON a.Id = ac.AnimalId
JOIN Cages AS c
ON ac.CageId = c.Id
JOIN AnimalTypes As at
ON a.AnimalTypeId = at.Id
WHERE at.AnimalType = 'mammals'
ORDER BY o.Name, a.Name DESC