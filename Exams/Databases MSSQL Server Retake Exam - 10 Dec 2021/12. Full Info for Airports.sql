CREATE PROC usp_SearchByAirportName (@airportName VARCHAR(70))
AS
BEGIN
	SELECT
a.AirportName, p.FullName,
CASE
    WHEN fd.TicketPrice <= 400 THEN 'Low'
    WHEN fd.TicketPrice BETWEEN 401 AND 1500 THEN 'Medium'
    ELSE 'High'
END AS LevelOfTicketPrice,
ac.Manufacturer, Condition, TypeName
FROM Airports AS a
JOIN FlightDestinations AS fd
ON fd.AirportId = a.Id
JOIN Aircraft AS ac
ON ac.Id = fd.AircraftId
JOIN Passengers AS p
ON p.Id = fd.PassengerId
JOIN AircraftTypes AS atp
ON atp.Id = ac.TypeId
WHERE a.AirportName = @airportName
ORDER BY ac.Manufacturer, p.FullName
END
