CREATE FUNCTION udf_ProductWithClients(@name VARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @productBoughtCounter INT = (
		SELECT
		COUNT(pc.ProductId)
		FROM Products AS p
		JOIN ProductsClients AS pc
		ON p.Id = pc.ProductId
		WHERE p.Name = @name
	)
	RETURN @productBoughtCounter
END

SELECT dbo.udf_ProductWithClients('DAF FILTER HU12103X')