SELECT TOP 10 e.FirstName, e.LastName, e.DepartmentID
FROM Employees AS e
INNER JOIN (
    SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) AS DeptAvg ON E.DepartmentID = DeptAvg.DepartmentID
WHERE E.Salary > DeptAvg.AvgSalary;