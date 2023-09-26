SELECT 
v.Name, v.PhoneNumber, SUBSTRING(Address, CHARINDEX(',', Address) + 2, LEN(v.Address)) AS Address
FROM Volunteers AS v
JOIN VolunteersDepartments AS vd
ON v.DepartmentId = vd.Id
WHERE Address LIKE '%Sofia%' AND vd.DepartmentName = 'Education program assistant'
ORDER BY v.Name