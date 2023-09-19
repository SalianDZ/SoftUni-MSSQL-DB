SELECT p.Id, p.[Name], p.Price, c.Name
FROM Products AS p
LEFT JOIN Categories AS c
ON p.CategoryId = c.Id
WHERE c.Name In ('ADR', 'Others')
ORDER BY p.Price DESC