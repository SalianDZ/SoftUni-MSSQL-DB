SELECT
t.[Name], t.Age, t.PhoneNumber, t.Nationality,
CASE
    WHEN bp.Id IS NULL THEN '(no bonus prize)'
    ELSE bp.[Name]
END AS Reward
FROM Tourists AS t
LEFT JOIN TouristsBonusPrizes AS tbp
ON t.Id = tbp.TouristId
LEFT JOIN BonusPrizes AS bp
ON tbp.BonusPrizeId = bp.Id
ORDER BY t.[Name]