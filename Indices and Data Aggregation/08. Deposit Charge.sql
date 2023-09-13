SELECT
DepositGroup,
MagicWandCreator,
MinDepositCharge
FROM (SELECT DepositGroup,
		MagicWandCreator,
		MIN(DepositCharge) AS MinDepositCharge
FROM WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator) AS subquery
ORDER BY MagicWandCreator, DepositGroup