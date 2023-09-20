SELECT
c.[Name] AS Client,
MAX(p.Price) AS Price,
c.NumberVAT
FROM Clients AS c
JOIN ProductsClients AS pc 
ON c.Id = pc.ClientId
JOIN Products AS p
ON pc.ProductId = p.Id
WHERE RIGHT(c.[Name], 2) != 'KG'
GROUP BY c.[Name], c.NumberVAT
ORDER BY Price DESC