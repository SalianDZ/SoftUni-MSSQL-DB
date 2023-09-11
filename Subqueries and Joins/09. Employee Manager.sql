SELECT
	e.EmployeeID
   ,e.FirstName
   ,e.ManagerID
   ,me.FirstName
FROM Employees AS e
LEFT JOIN Employees AS me
ON e.ManagerID = me.EmployeeID
WHERE e.ManagerID IN (3,7)
ORDER BY e.EmployeeID
