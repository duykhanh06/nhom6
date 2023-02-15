/**CÂU1**/
EXEC sp_addtype 'Mota', 'nvarchar(40)', 'Null'
EXEC sp_addtype 'IDKH', 'char(10)', 'Not null'
EXEC sp_addtype 'DT', 'char(12)', 'Null'

/**CÂU2**/
CREATE TABLE dbo.SanPham(
Masp char(6) primary key NOT NULL,
Tensp varchar(20) NOT NULL,
NgayNhap date,
DVT char(10),
SoLuongTon int,
DonGiaNhap money,
)

CREATE TABLE dbo.HoaDon(
MaHD char (10) primary key,
NgayLap date,
NgayGiao date,
MaKH IDKH,
DienGiai Mota,
)
CREATE TABLE KhachHang (
MaKH IDKH,
TenKH NVARCHAR(30),
DiaCHi NVARCHAR(40),
DienThoai DT,
)
CREATE TABLE ChiTietHD (
MaHD CHAR(10) NOT NULL,
MaSP CHAR(6) NOT NULL,
SoLuong INT
)

/**CÂU3**/
ALTER TABLE HoaDon
ALTER COLUMN DienGiai nvarchar(100)
/**CÂU4**/
ALTER TABLE SanPham
ADD TiLeHoaHong float
/**CÂU5**/
ALTER TABLE SanPham
DROP COLUMN NgayNhap
/**CÂU6**/
ALTER TABLE SanPham
ADD CONSTRAINT pk_sp PRIMARY KEY(MaSP)
GO
ALTER TABLE HoaDon
ADD CONSTRAINT pk_hd PRIMARY KEY(MaHD)
GO
ALTER TABLE KhachHang
ADD CONSTRAINT pk_khachhang PRIMARY KEY(MaKH)
GO 
ALTER TABLE HoaDon
ADD CONSTRAINT fk_khachhang_hoadon FOREIGN KEY(MaKH) REFERENCES KhachHang(MaKH)
GO
ALTER TABLE ChiTietHD
ADD CONSTRAINT fk_hoadon_chitiethd FOREIGN KEY(MaHD) REFERENCES HoaDon(MaHD)
GO
ALTER TABLE ChiTietHD
ADD CONSTRAINT fk_sanpham_chitiethd FOREIGN KEY(MaSP) REFERENCES SanPham(MaSP)

/**CÂU7**/
ALTER TABLE HoaDon
ADD CHECK (NgayGiao>NgayLap)
GO
ALTER TABLE HoaDon 
ADD CHECK (MaHD like '[A-Z][A-Z][0-9][0-9][0-9][0-9]')
GO
ALTER TABLE HoaDon
ADD CONSTRAINT df_ngaylap
DEFAULT GETDATE() FOR NgayLap

/**CÂU8**/
ALTER TABLE SanPham
ADD CHECK (SoLuongTon>0 and SoLuongTon<500)
GO
ALTER TABLE SanPham
ADD CHECK (DonGiaNhap>0)
GO
ALTER TABLE SanPham
ADD CONSTRAINT df_ngaynhap
DEFAULT GETDATE() FOR NgayNhap
GO
ALTER TABLE SanPham
ADD CHECK (DVT like 'KG''Thùng''Hộp''Cái')

/**CÂU9**/
INSERT INTO SanPham (Masp, Tensp, NgayNhap, DVT, SoLuongTon, DonGiaNhap)
VALUES ('SP01','Áo thun', '21/12/2020','Cái', 100, 70000),
       ('SP02','Bánh quy','21/12/2020','Hộp',150,15000),
	   ('SP03','Sữa Vinamilk','29/12/2020','Thùng',100, 155000),
	   ('SP04','Gạo','29/12/2020','KG',100, 20000);
GO
INSERT INTO KhachHang (MaKH, TenKH, DiaCHi, DienThoai)
VALUES ('KH01', 'Nguyễn Hoài Bảo','341 Lạc Long Quân, Quận 11','0989345654'),
       ('KH02','Nguyễn Lê Chí Tôn', '60 Hoà Bình, Quận 11', '0967786889'),
       ('KH03', 'Trần Thanh Tâm', '30 Âu Cơ, Quận Tân Bình', '0909565678'),
       ('KH04', 'Lê Chí Thiện', '243 Lê Văn Sỹ, Quận Tân Bình', '0908790897'),
       ('KH05', 'Nguyễn Lê Bảo An', '600 Bình Long, Quận Bình Tân', '0998067056');
GO
INSERT INTO HoaDon (MaHD, NgayLap, NgayGiao, MaKH, DienGiai)
VALUES ('HD01','2/3/2021','10/3/2021', 'KH01'),
       ('HD02','5/3/2021','7/3/2021','KH02'),
       ('HD03','10/3/2021','15/3/2021','KH04');
GO
INSERT INTO ChiTietHD (MaHD, MaSP, SoLuong)
VALUES ('HD01','SP02',10),
       ('HD02','SP01',15),
       ('HD03','SP03',20);
