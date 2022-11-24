DECLARE @i INT = 0, @tong INT = 0;
WHILE @i <= 10
	BEGIN 
		PRINT @i; 
			IF(@i%2 = 0)
				BEGIN
					SET @tong = @tong + @i;
				END;
		SET @i = @i + 1;
	END;
	PRINT 'tong la: ' + str(@tong);
GO

DECLARE @i INT = 0, @tong INT = 0;
WHILE @i <= 10
	BEGIN 
		PRINT @i; 
			IF(@i%2 = 0)
				BEGIN
				IF(@i != 4)
					BEGIN
						SET @tong = @tong + @i;
					END;
				END;
		SET @i = @i + 1;
	END;
	PRINT 'tong la: ' + str(@tong);
GO