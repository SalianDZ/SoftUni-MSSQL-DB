CREATE FUNCTION udf_RoomsWithTourists(@name VARCHAR(50)) 
RETURNS INT
AS
BEGIN
	DECLARE @count INT = (SELECT SUM(b.AdultsCount + b.ChildrenCount)
FROM Bookings AS b
JOIN Rooms AS r
ON r.Id = b.RoomId
WHERE r.Type = @name)
	RETURN @count
END

