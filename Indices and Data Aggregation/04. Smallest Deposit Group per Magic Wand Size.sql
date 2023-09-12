SELECT TOP 2
	DepositGroup
FROM (SELECT
	DepositGroup
   ,AVG(MagicWandSize) AS LongestMagicWand
   FROM WizzardDeposits AS w
   GROUP BY DepositGroup) AS Subquery
   ORDER BY LongestMagicWand
