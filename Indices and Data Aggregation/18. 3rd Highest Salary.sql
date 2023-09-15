SELECT DepartmentID, Salary AS ThirdHighestSalary
FROM (SELECT
		DepartmentID
		,Salary
		,DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS d  
	FROM Employees GROUP BY DepartmentID, Salary) AS Subquery
	WHERE d = 3