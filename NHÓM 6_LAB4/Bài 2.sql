select * from NHANVIEN;

DECLARE @MAX INT, @NUM INT;
SELECT @MAX = MAX(CAST(MANV AS INT)) FROM NHANVIEN;

SET @NUM =1;

WHILE @NUM <= @MAX
BEGIN
	IF @NUM=4
	BEGIN
		SET @NUM=@NUM+1;
		CONTINUE;
	END

	IF @NUM %2 =0
	SELECT HONV,TENLOT, TENNV from NHANVIEN where cast (MANV as int) = @num;

	SET @NUM = @NUM +1;
END;

select * from PHONGBAN
BEGIN TRY
	insert into PHONGBAN(TENPHG,MAPHG,TRPHG, NG_NHANCHUC)
	values (N'Sản Xuất',7, '009','2020/03/02');
	print N'thêm dữ liệu thành công'
END TRY

BEGIN CATCH
	print N'failure : chèn dữ  liệu không thành công'
END CATCH