SELECT TOP 7 i.Number, i.Amount, c.Name AS Client
FROM Invoices AS i
JOIN Clients AS c ON i.ClientId = c.Id
WHERE IssueDate < '2023-01-01' AND Currency = 'EUR' OR i.Amount > 500 AND LEFT(c.NumberVAT, 2) = 'DE'
ORDER BY i.Number, i.Amount DESC