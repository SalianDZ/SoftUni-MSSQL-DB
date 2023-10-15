SELECT FORMAT(ArrivalDate, 'yyyy-MM-dd') AS ArrivalDate, AdultsCount, ChildrenCount FROM Bookings AS b
JOIN Rooms As r
ON b.RoomId = r.Id
ORDER BY R.Price DESC, ArrivalDate