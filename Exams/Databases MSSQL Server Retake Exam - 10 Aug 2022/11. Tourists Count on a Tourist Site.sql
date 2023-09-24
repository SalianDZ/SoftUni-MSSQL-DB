CREATE FUNCTION udf_GetTouristsCountOnATouristSite(@Site VARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @touristCounter INT

	SET @touristCounter = (SELECT Count(st.TouristId) FROM Sites AS s
JOIN SitesTourists AS st
ON s.Id = st.SiteId
WHERE s.Name = @Site)

	RETURN @touristCounter
END