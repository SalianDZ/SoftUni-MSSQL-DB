SELECT * FROM (SELECT
SUBSTRING(t.[Name], CHARINDEX(' ', t.[Name]) + 1, LEN(t.[Name]) - CHARINDEX(' ', t.[Name])) AS LastName,
t.Nationality, t.Age, t.PhoneNumber
FROM SitesTourists AS st
JOIN Sites AS s
ON st.SiteId = s.Id
JOIN Tourists AS t
ON st.TouristId = t.Id
WHERE s.CategoryId = 8) AS subquery
GROUP BY LastName, Nationality, Age, PhoneNumber
ORDER BY LastName


