CREATE PROCEDURE sp_UCLN
       @a INT , @B INT
AS
BEGIN
    DECLARE @TEMP INT
	IF @a > @B
	BEGIN
	    SELECT @TEMP = @a , @a = @B , @B = @TEMP
	END
	WHILE @B % @a != 0
	BEGIN
	    SELECT @TEMP = @a , @a = @B % @a , @B = @TEMP
	END
	PRINT N'Ước chung lớn nhất là: ' + CAST(@a AS VARCHAR)
END
EXECUTE sp_UCLN 35 , 45;