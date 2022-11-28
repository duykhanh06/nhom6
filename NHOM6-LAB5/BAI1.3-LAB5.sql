CREATE PROCEDURE sp_SumEven
       @n INT
AS
BEGIN
    DECLARE @SUM INT , @i INT
	SET @SUM = 0;
	SET @i = 1;
	WHILE @i <= @n
	BEGIN
	    IF @i % 2 = 0
		BEGIN
		   SET @SUM = @SUM + @i
		END
		   SET @i = @i + 1
	END
	PRINT N'Tổng các số chẵn là: ' + CAST(@SUM AS VARCHAR)
END
EXECUTE sp_SumEven 10;