SELECT TOP 5 o.Name, COUNT(a.Id) AS CountOfAnimals  FROM Animals AS a
JOIN Owners AS o
ON a.OwnerId = o.Id
GROUP BY o.Name
ORDER BY COUNT(a.Id) DESC