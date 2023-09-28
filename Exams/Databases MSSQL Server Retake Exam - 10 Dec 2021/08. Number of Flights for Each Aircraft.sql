SELECT
a.Id AS AircraftId
,a.Manufacturer
,a.FlightHours
,COUNT(fd.Id) AS FlightDestinationsCount
,ROUND(AVG(fd.TicketPrice), 2) AS AvgPrice
FROM FlightDestinations AS fd
JOIN Aircraft AS a
ON fd.AircraftId = a.Id
GROUP BY a.Id, a.Manufacturer, a.FlightHours
HAVING COUNT(fd.Id) > 1
ORDER BY FlightDestinationsCount DESC, a.Id