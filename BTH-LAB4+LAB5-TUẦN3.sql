create database QuanLyDeAn
use QuanLyDeAn
create	table NHANVIEN
(
	HONV	nvarchar(15),
	TENLOT	nvarchar(15),
	TENNV	nvarchar(15) not null,
	MANV	char	(9) not null,
	NGSINH	Datetime,
	DCHI	nvarchar(30),
	PHAI	nvarchar(3),
	LUONG	float,
	MA_NQL	char(9),
	PHG	int,
	constraint PK_NHANVIEN primary key(MANV),
	
)

create	table PHONGBAN
(
	TENPHG	nvarchar(15),
	MAPHG	int not null,
	TRPHG	char(9),
	NG_NHANCHUC Datetime
	constraint PK_PHONGBAN primary key(MAPHG)
)


create table DIADIEM_PHG
(
	MAPHG	int,
	DIADIEM nvarchar(50)
	constraint PK_DIADIEM_PHG primary key (MAPHG, DIADIEM)
)

create table DEAN
(
	TENDA	nvarchar(15),
	MADA	int,
	DDIEM_DA nvarchar(50),
	PHONG	int,
	constraint PK_DEAN primary key(MADA)
)

create table CONGVIEC
(
	MADA int,
	STT  int,
	TEN_CONG_VIEC nvarchar(50),
	constraint PK_CONGVIEC primary key (MADA, STT)
	
)

create table PHANCONG
(
	MA_NVIEN char(9),
	MADA	 int,
	THOIGIAN float,
	constraint PK_PHANCONG primary key (MA_NVIEN, MADA)
)

create	table THANNHAN
(
	MA_NVIEN char(9),
	TENTN	 nvarchar(15),
	PHAI	 nvarchar(3),
	NGSINH	Datetime,
	QUANHE 	nvarchar(15),
	constraint PK_THANNHAN primary key (MA_NVIEN, TENTN) 
)

alter table NHANVIEN
add 
constraint FK_NHANVIEN_NHANVIEN foreign key(MA_NQL) references NHANVIEN(MANV),
constraint FK_NHANVIEN_PHONGBAN foreign key(PHG) references PHONGBAN(MAPHG)


alter table PHONGBAN
add
constraint FK_PHONGBAN_NHANVIEN foreign key(TRPHG) references NHANVIEN(MANV)


alter table DIADIEM_PHG
add
constraint FK_DIADIEMPHG_PHONGBAN foreign key(MAPHG) references PHONGBAN(MAPHG)


alter table DEAN
add
constraint FK_DEAN_PHONGBAN foreign key(PHONG) references PHONGBAN(MAPHG)

/*alter table CONGVIEC
add
constraint FK_CONGVIEC_DEAN foreign key(MADA) references DEAN(MADA)


alter table PHANCONG
add
constraint FK_PHANCONG_CONGVIEC foreign key(MADA, STT) references CONGVIEC(MADA, STT)


alter table THANNHAN
add*/

alter table PHANCONG
add
constraint FK_PHANCONG_DEAN foreign key(MADA) references DEAN(MADA),
constraint FK_PHANCONG_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
alter table THANNHAN
add constraint FK_THANNHAN_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
--------------------------Chèn dữ liệu -------------------------------------------
set dateformat dmy
select * from nhanvien
delete  nhanvien
insert into NHANVIEN values(N'Vương', N'Ngọc', N'Quyền', 
'006', '01/01/1965', N'45 Trưng Vương Hà Nội', N'Nữ', 55000, null, null)

insert into NHANVIEN values(N'Nguyễn', N'Thanh', N'Tùng',
'005', '20/08/1962', N'222 Nguyễn Văn Cừ TPHCM', N'Nam', 40000, NULL, null) /*006*/
insert into NHANVIEN values(N'Lê', N'Thị', N'Nhàn', 
'001', '01/02/1967', N'291 Hồ Văn Huê TPHCM', N'Nữ', 43000, NULL, null)/*006*/

insert into NHANVIEN values(N'Nguyễn', N'Mạnh', N'Hùng', 
'004', '04/03/1967', N'95 Bà Rịa Vũng Tàu', N'Nam', 38000, NULL, null)/*005*/

insert into NHANVIEN values(N'Trần', N'Thanh', N'Tâm', 
'003', '04/05/1957', N'34 Mai Thị Lựu TPHCM', N'Nam', 25000, NULL, null) /*005*/

insert into NHANVIEN values(N'Bùi', N'Thúy', N'Bư', 
'007', '11/03/1954', N'332 Nguyễn Thái Học TPHCM', N'Nam', 25000, NULL, null)/*001*/

insert into NHANVIEN values(N'Trần', N'Hồng', N'Quang', 
'008', '01/09/1967', N'80 Lê Hồng Phong TPHCM', N'Nam', 25000, NULL, null) /*001*/

insert into NHANVIEN values(N'Đinh', N'Bá', N'Tiến', 
'009', '12/01/1960', N'119 Cống Quỳnh TPHCM', N'Nam', 30000, NULL, null) /*005*/

--update cho nhan vien Dinh Ba tien
/*book online :
	UPDATE titles
    SET ytd_sales = t.ytd_sales + s.qty
    FROM titles t, sales s
    WHERE t.title_id = s.title_id
*/
select *
from NHANVIEN

-- Nhập dữ liệu cho PHONGBAN--

insert into PHONGBAN values(N'Nghiên Cứu', 5, '005', '22/05/1987')
insert into PHONGBAN values(N'Diều Hành', 4, '008', '01/01/1985')
insert into PHONGBAN values(N'Quản Lý', 1, '006', '19/06/1971')
SELECT * FROM PHONGBAN
--Cập nhật lại dữ liệu PHONG cho nhân viên--

update NHANVIEN
set    PHG = 5
where  MANV = '009'

update NHANVIEN
set    PHG = 5
where  MANV = '005'

update NHANVIEN
set    PHG = 4
where  MANV = '007'

update NHANVIEN
set    PHG = 4
where  MANV = '001'

update NHANVIEN
set    PHG = 5
where  MANV = '003'

update NHANVIEN
set    PHG = 5
where  MANV = '004'

update NHANVIEN
set    PHG = 4
where  MANV = '008'

update NHANVIEN
set    PHG = 1
where  MANV = '006'

update NHANVIEN
set    PHG = 5
where  MANV = '009'

select *
from NHANVIEN

--Cập nhật dữ liệu cho bảng DIADIEM_PHG--

insert into DIADIEM_PHG values(1, 'TP HCM')
insert into DIADIEM_PHG values(4, 'HA NOI')
insert into DIADIEM_PHG values(5, 'VUNG TAU')

select *
from DIADIEM_PHG

--Cập nhật dữ liệu cho bảng DEAN--
insert into DEAN values(N'Sản phẩm X', 1, 'VUNG TAU', 5)
insert into DEAN values(N'Sản phẩm Y', 2, 'NHA TRANG', 5)
insert into DEAN values(N'Sản phẩm Z', 3, 'TP HCM', 5)
insert into DEAN values(N'Tin học hóa', 10, 'HA NOI', 4)
insert into DEAN values(N'Cap Quang', 20, 'TP HCM', 1)
insert into DEAN values(N'Đào Tạo', 30, 'HA NOI', 4)

select *
from DEAN

--Cập nhật dữ liệu cho bảng CONGVIEC--

insert into CONGVIEC values(1, 1, N'Thiết kế sản phẩm X')
insert into CONGVIEC values(1, 2, N'Thử nghiệm sản phẩm X')
insert into CONGVIEC values(2, 1, N'Sản xuất sản phẩm Y')
insert into CONGVIEC values(2, 2, N'Quảng cáo sản phẩm Y')
insert into CONGVIEC values(3, 1, N'Khuyến mãi sản phẩm Z')
insert into CONGVIEC values(10, 1, N'Tin học hóa nhân sự tiền lương')
insert into CONGVIEC values(10, 2, N'Tin học hóa phòng kinh doanh')
insert into CONGVIEC values(20, 1, N'lắp đặt cáp quang')
insert into CONGVIEC values(30, 1, N'Đào tạo nhân viên maketing')
insert into CONGVIEC values(30, 2, N'Đào tạo chuyên viên thiết kế')

select *
from CONGVIEC

--Cập nhật dữ liệu cho bảng THANNHAN--
insert into THANNHAN values('005', N'Quang', N'Nữ', '05/04/1976', N'Con gái')
insert into THANNHAN values('005', N'Khang', N'Nam', '25/10/1973', N'Con trai')
insert into THANNHAN values('005', N'Dương', N'Nữ', '03/05/1948', N'Vợ chồng')
insert into THANNHAN values('001', N'Đăng', N'Nam', '19/02/1932', N'Vợ chồng')
insert into THANNHAN values('009', N'Duy', N'Nam', '01/01/1978', N'Con trai')
insert into THANNHAN values('009', N'Châu', N'Nữ', '30/12/1978', N'Con gái')
insert into THANNHAN values('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')

select *
from THANNHAN

--Chèn dữ liệu cho bảng PHANCONG--
insert into PHANCONG values('009', 1, 32)
insert into PHANCONG values('009', 2, 8)
insert into PHANCONG values('004', 3, 40)
insert into PHANCONG values('003', 1, 20)
insert into PHANCONG values('003', 2, 20)
insert into PHANCONG values('008', 10,35)
insert into PHANCONG values('008', 30,5)
insert into PHANCONG values('001', 30,20)
insert into PHANCONG values('001', 20,15)
insert into PHANCONG values('006', 20,30)
insert into PHANCONG values('005', 3, 10)
insert into PHANCONG values('005', 10,10)
insert into PHANCONG values('005', 20,10)
insert into PHANCONG values('007', 30,30)
insert into PHANCONG values('007', 10,10)

select *
from	PHANCONG

--Câu 1. Liệt kê danh sách tất cả các nhân viên
select *
from NHANVIEN

--Câu 2. Tìm các nhân viên làm việc ở phòng số 5
select MANV, HONV, TENLOT, TENNV
from NHANVIEN 
where PHG = 5

--Câu 3. Liệt kê họ tên và phòng làm việc các nhân viên có mức lương trên 6.000.000 đồng
select MANV, HONV, TENLOT, TENNV, LUONG, PHG
from NHANVIEN 
where LUONG > 6000000

--Câu 4. Tìm các nhân viên có mức lương trên 6.500.000 ở phòng 1 hoặc các nhân viên có mức lương trên 5.000.000 ở phòng 4
select MANV, HONV, TENLOT, TENNV, LUONG, PHG
from NHANVIEN 
where LUONG > 6500000 and PHG = 1 or LUONG > 5000000 and PHG = 4

--Câu 5. Cho biết họ tên đầy đủ của các nhân viên ở TP Quảng Ngãi
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên'
	from NHANVIEN 
	where Nhanvien.DCHI like N'%TP Quảng Ngãi'

	select *
	from NHANVIEN

--Câu 6. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'
select HONV + ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên'
from NHANVIEN
where NHANVIEN.HONV like N'N%'

--Câu 7. Cho biết ngày sinh và địa chỉ của nhân viên Cao Thanh Huyền
SELECT NHANVIEN.NGSINH, NHANVIEN.DCHI
FROM NHANVIEN
WHERE NHANVIEN.HONV = N'Cao' AND NHANVIEN.TENLOT = N'Thanh' AND NHANVIEN.TENNV = N'Huyền'

--Câu 8: Cho biết các nhân viên có năm sinh trong khoảng 1955 đến 1975
SELECT * FROM NHANVIEN
WHERE YEAR(NGSINH) BETWEEN 1955 AND 1975

--Câu 9. Cho biết các nhân viên và năm sinh của nhân viên
SELECT * ,YEAR(NGSINH) AS NAMSINH FROM NHANVIEN

--Câu 10: Cho biết họ tên và tuổi của tất cả các nhân viên
SELECT * ,DATEDIFF(YYYY,NGSINH, GETDATE()) AS TUOI FROM NHANVIEN

--Câu 11: Tìm tên những người trưởng phòng của từng phòng ban
SELECT  HONV+ ' ' +TENLOT+ ' ' +TENNV AS 'Họ và tên Trưởng Phòng' FROM PHONGBAN,NHANVIEN
WHERE PHONGBAN.TRPHG = NHANVIEN.MANV

--Câu 12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Điều hành"
SELECT HONV+ ' ' +TENLOT+ ' ' +TENNV AS 'Họ và tên', DCHI FROM NHANVIEN inner join PHONGBAN on NHANVIEN.PHG = PHONGBAN.MAPHG
WHERE PHONGBAN.MAPHG = 4

--Câu 13: Với mỗi đề án ở Tp Quảng Ngãi, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó
SELECT TENDA, TENPHG, HONV+ ' ' +TENLOT+ ' ' +TENNV AS 'Họ và tên', NG_NHANCHUC 
FROM NHANVIEN inner join PHONGBAN 
ON NHANVIEN.PHG = PHONGBAN.MAPHG 
inner join DEAN ON DEAN.PHONG = PHONGBAN.MAPHG
WHERE PHONGBAN.TRPHG = NHANVIEN.MANV and DCHI like '%Tp Quảng Ngãi'

--Câu 14. Tìm tên những nữ nhân viên và tên người thân của họ
SELECT HONV+ ' ' +TENLOT+ ' ' +TENNV AS 'Họ và tên', TENTN AS 'Tên người thân' 
FROM NHANVIEN inner join THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
WHERE NHANVIEN.PHAI = N'Nữ'

--Câu 15: Với mỗi nhân viên, cho biết họ tên của nhân viên, họ tên trưởng phòng của phòng ban mà nhân viên đó đang làm việc.
SELECT NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV AS 'Họ và tên nhân viên', QL.HONV+ ' ' + QL.TENLOT + ' ' + QL.TENNV AS 'Họ và tên quản lí'
	FROM NHANVIEN NV,NHANVIEN QL
	WHERE NV.MA_NQL = QL.MANV

--Câu 16: Tên những nhân viên phòng Nghiên cứu có tham gia vào đề án "Xây dựng nhà máy chế biến thủy sản";
SELECT HONV+ ' ' + TENLOT + ' ' + TENNV AS 'Họ và tên' 
FROM NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
WHERE DEAN.TENDA= 'Xây dựng nhà máy chế biến thủy sản'

--Câu 17: Cho biết tên các đề án mà nhân viên Trần Thanh Tâm đã tham gia.
SELECT TENDA AS 'Tên đề án'
FROM NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
WHERE NHANVIEN.HONV = N'Trần' and NHANVIEN.TENLOT = N'Thanh' and NHANVIEN.TENNV = N'Tâm'

--Câu 18: Cho biết số lượng đề án của công ty
SELECT count(*)
FROM dean

--Câu 19: Liệt kê danh sách các phòng ban có tham gia chủ trì các đề án
SELECT TENPHG,count(*)
FROM PHONGBAN,DEAN
WHERE maphg=phong
GROUP BY TENPHG

SELECT*
FROM DEAN

--Câu 20. Cho biết số lượng các phòng ban có tham gia chủ trì các đề án
SELECT count(*) 
AS 'Số lượng các phòng ban tham gia chủ trì đề án' 
FROM DEAN,PHONGBAN
WHERE DEAN.PHONG = PHONGBAN.MAPHG

--Câu 21. Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì
SELECT count(*)
FROM PHONGBAN,DEAN
WHERE PHONG=MAPHG and TENPHG like N'Nghiên cứu'
	--dean--
SELECT *
FROM dean
	--phancong--
SELECT *
FROM PHANCONG
	--nhanvien--
SELECT*
FROM NHANVIEN

--Câu 22: Cho biết lương trung bình của các nữ nhân viên
SELECT avg(LUONG)
AS 'Lương Trung Bình của các NV nữ'
FROM NHANVIEN
WHERE phai like N'Nữ'

--Câu 23.Cho biết số thân nhân của nhân viên 'Đinh Bá Tiến'
SELECT count(*)
AS 'Số thân nhân của tiến'
FROM NHANVIEN,THANNHAN
WHERE MANV=MA_NVIEN and HONV = N'Đinh' and TENLOT=N'Bá' and TENNV=N'Tiến'

--Câu 24. Liệt kê danh sách 3 nhân viên lớn tuổi nhất, danh sách bao gồm họ tên và năm sinh.

SELECT TOP 3 HONV + ' ' + TENLOT + ' ' + TENNV + ' ' 
AS 'Họ và tên',year(NGSINH)
AS 'Năm sinh' 
FROM NHANVIEN
ORDER BY year(NGSINH)


--Câu 25. Với mỗi đề án, liệt kê mã đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
	SELECT dean.MADA,sum(PHANCONG.THOIGIAN)
	AS 'Tổng giờ làm'
	FROM PHANCONG,DEAN
	WHERE PHANCONG.MADA = DEAN.MADA
	GROUP BY DEAN.MADA 


--Câu 26. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
	SELECT dean.TENDA,SUM(PHANCONG.THOIGIAN)
	AS 'Tổng giờ làm'
	FROM PHANCONG,DEAN
	WHERE PHANCONG.MADA = DEAN.MADA
	GROUP BY DEAN.TENDA 


--Câu 27. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó
	SELECT MADA, count(*)
	FROM PHANCONG,NHANVIEN
	WHERE MANV=MA_NVIEN
	GROUP BY MADA


--Câu 28. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
	SELECT HONV+' '+TENNV 
	AS 'Họ Và Tên',count(*)
	AS 'Số lượng thân nhân'
	FROM NHANVIEN,THANNHAN
	WHERE MANV = MA_NVIEN
	GROUP BY HONV,TENNV

--Câu 29. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
	SELECT honv,tennv,count(*)
	FROM NHANVIEN,PHANCONG
	WHERE MANV=MA_NVIEN
	GROUP BY honv,tennv

--Câu 30. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
	SELECT TENPHG,AVG(LUONG)
	FROM PHONGBAN,NHANVIEN
	WHERE maphg=PHG
	GROUP BY TENPHG

--Câu 31. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
SELECT TENPHG,COUNT(*)
AS 'Số lượng nhân viên làm việc'
FROM PHONGBAN,NHANVIEN
WHERE MAPHG=PHG
GROUP BY TENPHG
HAVING avg(LUONG)>5200000

-----32. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
	SELECT TENPHG,count(*)
	FROM PHONGBAN,DEAN
	WHERE maphg=phong
	GROUP BY TENPHG
	--dean--
	SELECT*
	FROM DEAN

--Câu 33. Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì.
SELECT PHONGBAN.TENPHG, (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) 
AS 'Họ tên trưởng phòng', COUNT(DEAN.PHONG) AS 'Số lượng đề án'
FROM NHANVIEN, PHONGBAN, DEAN
WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND PHONGBAN.MAPHG = DEAN.PHONG
GROUP BY PHONGBAN.TENPHG, (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)

--Câu 34. Với mỗi đề án, cho biết tên đề án và số lượng nhân viên tham gia đề án
SELECT DEAN.MADA, DEAN.TENDA, COUNT(DEAN.MADA) AS 'Số lượng công việc'
FROM DEAN, CONGVIEC
WHERE DEAN.MADA = CONGVIEC.MADA
GROUP BY DEAN.MADA, DEAN.TENDA
