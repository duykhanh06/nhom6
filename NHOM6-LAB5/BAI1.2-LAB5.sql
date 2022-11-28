CREATE PROCEDURE sp_SUM
       @S1 INT , @S2 INT
AS
BEGIN
    DECLARE @tg INT;
	SET @tg = @S1 + @S2;
	PRINT N'Tổng là: '+ CAST(@tg AS VARCHAR)
END
GO
ALTER PROCEDURE sp_SUM
      @S1 INT , @S2 INT
AS
BEGIN
    DECLARE @tg INT;
	SET @tg = @S1 + @S2;
	PRINT N'Tổng là: '+ CAST(@tg AS VARCHAR)
END
GO
EXECUTE sp_SUM 10 , 20;