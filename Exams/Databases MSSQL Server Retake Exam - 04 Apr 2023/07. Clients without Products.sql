SELECT c.Id, c.Name AS Client, CONCAT_WS(', ', CONCAT_WS(' ', a.StreetName, a.StreetNumber), a.City, a.PostCode, cn.Name) AS Address FROM Clients AS c
LEFT JOIN ProductsClients AS pc
ON c.Id = pc.ClientId
LEFT JOIN Addresses AS a ON c.AddressId = a.Id
LEFT JOIN Countries AS cn ON a.CountryId = cn.Id
WHERE pc.ClientId IS NULL