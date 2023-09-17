CREATE FUNCTION ufn_CalculateFutureValue
(@initialSum DECIMAL(18,4), @yearlyInterest FLOAT, @years INT)
RETURNS DECIMAL(18, 4)
AS
BEGIN
	DECLARE @totalSum DECIMAL(18,4);
	SET @totalSum = @initialSum * POWER(1 + @yearlyInterest, @years)
	RETURN @totalSum;
END