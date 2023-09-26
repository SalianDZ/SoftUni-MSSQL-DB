CREATE FUNCTION udf_GetVolunteersCountFromADepartment (@VolunteersDepartment VARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @volunteersCount INT

	SET @volunteersCount = (SELECT COUNT(v.Id) FROM Volunteers AS v
JOIN VolunteersDepartments AS vd 
ON v.DepartmentId = vd.Id
WHERE DepartmentName  = @VolunteersDepartment
GROUP BY vd.DepartmentName)

	RETURN @volunteersCount
END