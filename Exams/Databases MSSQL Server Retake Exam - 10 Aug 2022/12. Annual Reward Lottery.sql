CREATE PROC usp_AnnualRewardLottery(@TouristName VARCHAR(50))
AS
BEGIN
	SELECT [Name], 
	CASE
		WHEN sitesCount >= 100 THEN 'Gold badge'
		WHEN sitesCount >= 50 THEN 'Silver badge'
		WHEN sitesCount >= 25 THEN 'Bronze badge'
	END AS Reward
	FROM (SELECT t.[Name], COUNT(s.Name) AS sitesCount
	FROM Sites AS s
	JOIN SitesTourists AS st
	ON s.Id = st.SiteId
	JOIN Tourists AS t 
	ON t.Id = st.TouristId
	GROUP BY t.Name) AS subquery
	WHERE [Name] = @TouristName
END

