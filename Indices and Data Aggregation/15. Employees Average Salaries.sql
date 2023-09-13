SELECT *
INTO DemoEmployees
FROM
    Employees
WHERE Salary > 30000

DELETE FROM DemoEmployees
WHERE ManagerID = 42;

UPDATE DemoEmployees
SET Salary = Salary + 5000
WHERE DepartmentID = 1

SELECT DepartmentID, AVG(Salary) FROM DemoEmployees GROUP BY DepartmentID
