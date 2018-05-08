CREATE PROCEDURE dbo.cursor1
	@Cursor1 CURSOR VARYING OUTPUT
AS
SET NOCOUNT ON;
SET @Cursor1 = CURSOR
FORWARD_ONLY STATIC FOR
	SELECT E.Surname as 'Фамилия работника',
	S.Name_specialization as 'Специалиация работника'
	FROM Employee as E
	INNER JOIN [Employee's_specialization] as ES ON ES.id_employee = E.id_employee
	INNER JOIN Specialization as S ON S.id_specialization = ES.id_specialization
OPEN @Cursor1
GO

DECLARE @Cursor2 CURSOR
EXEC dbo.cursor1 @Cursor1 = @Cursor2 OUTPUT

WHILE(@@FETCH_STATUS = 0)
BEGIN
	FETCH NEXT FROM @Cursor2
END
CLOSE @Cursor2
DEALLOCATE @Cursor2
GO

DROP PROCEDURE dbo.cursor1