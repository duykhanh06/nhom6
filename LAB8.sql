--câu 1
CREATE PROCEDURE spTangLuong
AS
BEGIN
    UPDATE NhanVien
    SET LUONG = LUONG * 1.1
END;

EXEC spTangLuong

--câu 2

ALTER TABLE NHANVIEN
ADD NgayNghiHuu DATE;

CREATE PROCEDURE spNghiHuu
AS
BEGIN
    UPDATE NHANVIEN
    SET NgayNghiHuu = DATEADD(day, 100, GETDATE())
    WHERE (PHAI = 'Nam' AND DATEDIFF(year, NGSINH, GETDATE()) >= 60)
    OR (PHAI = 'Nu' AND DATEDIFF(year, NGSINH, GETDATE()) >= 55)
END;

EXEC spNghiHuu;

--câu3
CREATE PROCEDURE spXemDeAn @DDIEM_DA NVARCHAR(255)
AS
BEGIN
    SELECT * FROM DEAN
    WHERE DDIEM_DA = @DDIEM_DA
END;
EXEC spXemDeAn @DDIEM_DA = N'<địa điểm>';

--câu 4

CREATE PROCEDURE spCapNhatDeAn @diadiem_cu NVARCHAR(255), @diadiem_moi NVARCHAR(255)
AS
BEGIN
    UPDATE DeAn
    SET DDIEM_DA = @diadiem_moi
    WHERE DDIEM_DA = @diadiem_cu
END;

EXEC spCapNhatDeAn @diadiem_cu = N'<địa điểm cũ>', @diadiem_moi = N'<địa điểm mới>';

--câu 5

CREATE PROCEDURE spThemDA
   @TENDA NVARCHAR(15),
    @MADA int,
   @DDIEM_DA NVARCHAR(50),
   @MaPhongBan INT
 
AS
BEGIN
   SET NOCOUNT ON;
   INSERT INTO DEAN (TENDEAN, MADA,DDIEM_DA)
   VALUES (@TENDA,@MADA,@DDIEM_DA);
END;
--câu 6
    CREATE PROCEDURE spThemDeAn
    @MaDeAn INT,
    @TenDeAn NVARCHAR(50),
    @MoTa NVARCHAR(255)
	@MAPHG INT
AS
BEGIN
    IF EXISTS (SELECT * FROM DEAN WHERE MADA = @MADA)
    BEGIN
        RAISERROR ('Mã đề án đã tồn tại, đề nghị chọn mã đề án khác', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (SELECT * FROM PHONGBAN WHERE MAPHG = @MAPHG)
    BEGIN
        RAISERROR ('Mã phòng không tồn tại', 16, 1);
        RETURN;
    END

    INSERT INTO DEAN (MADA, TENDEAN,DDIEM_DA)
    VALUES (@MADA, @TENDA, @DDIEM_DA)
END
-- Trường hợp hợp lệ:
EXEC spThemDA'Đề án A', 22, 'châu thành';