SELECT
p.FullName, COUNT(fd.Id) AS CountOfAircraft, SUM(fd.TicketPrice) AS TotalPayed
FROM FlightDestinations AS fd
JOIN Passengers AS p
ON fd.PassengerId = p.Id
WHERE p.FullName LIKE '_a%'
GROUP BY p.FullName
HAVING COUNT(fd.Id) > 1
ORDER BY p.FullName