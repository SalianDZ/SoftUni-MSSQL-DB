CREATE FUNCTION udf_FlightDestinationsByEmail(@email VARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @passengersCount INT

	SET @passengersCount = (SELECT COUNT(PassengerId) FROM FlightDestinations AS fd
JOIN Passengers AS p
ON fd.PassengerId = p.Id
WHERE p.Email = @email)

	RETURN @passengersCount;
END
