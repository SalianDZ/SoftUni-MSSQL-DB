UPDATE Aircraft
SET Condition = 'A'
WHERE (Condition IN ('C', 'B')) AND (FlightHours IS NULL OR (FlightHours >= 0 AND FlightHours <= 100)) AND
Year >= 2013