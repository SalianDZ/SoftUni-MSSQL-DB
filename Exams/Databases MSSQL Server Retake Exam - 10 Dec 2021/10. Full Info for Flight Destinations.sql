SELECT a.AirportName, fd.Start, fd.TicketPrice, p.FullName, ac.Manufacturer, ac.Model FROM FlightDestinations AS fd
JOIN Airports as a
ON fd.AirportId = a.Id
JOIN Passengers AS p ON p.Id = fd.PassengerId
JOIN Aircraft AS ac
ON fd.AircraftId = ac.Id
WHERE DATEPART(HOUR, fd.Start) BETWEEN 6 AND 20 AND fd.TicketPrice > 2500
ORDER BY ac.Model