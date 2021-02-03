
CREATE PROCEDURE usp_GetStuWithResult @Mark int
AS
SELECT * FROM Students
WHERE Result>@Mark

EXEC usp_GetStuWithResult 60

EXEC usp_GetStuWithResult 80

CREATE PROCEDURE usp_GetStuWithResultAndGroup @Mark int,@Group nvarchar(10)
AS
SELECT * FROM GetStudentInfo
WHERE Result>@Mark AND [Group]=@Group

EXEC usp_GetStuWithResultAndGroup 60,P119

EXEC usp_GetStuWithResultAndGroup @Group=P119,@Mark=70


CREATE PROCEDURE usp_GetStuWithResultAndGroupDefault @Mark int=65,@Group nvarchar(10)
AS
SELECT * FROM GetStudentInfo
WHERE Result>@Mark AND [Group]=@Group

EXEC usp_GetStuWithResultAndGroupDefault @Group=P119

EXEC usp_GetStuWithResultAndGroupDefault 75,P119


CREATE FUNCTION GetStudentCount(@Mark int)
RETURNS int
AS
BEGIN
	DECLARE @COUNT int
	SELECT @COUNT=COUNT(*) FROM Students
	WHERE Result>@Mark
	RETURN @COUNT
END

SELECT dbo.GetStudentCount(90)