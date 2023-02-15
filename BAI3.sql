/**PHẦN B**/
CREATE TABLE SINHVIEN
(
MaSV nvarchar(12) PRIMARY KEY,
TenSV nvarchar(25) NOT NULL,
NgaySinh datetime NOT NULL,
Email nvarchar(40),
DienThoai nvarchar(12),
Lop nvarchar(10),
)
GO
CREATE TABLE MONHOC
(
MaMH nvarchar(10) PRIMARY KEY,
TenMH nvarchar(25) NOT NULL,
)
GO
CREATE TABLE DIEM
(
MaSV nvarchar(12),
MaMH nvarchar(25),
Ngay datetime NOT NULL,
Lythuyet tinyint,
Thuchanh tinyint,
PRIMARY KEY(MaSV,MaMH),
)
/**PHẦN C**/
INSERT INTO SINHVIEN (MaSV, TenSV, NgaySinh, Email, DienThoai, Lop)
VALUES ('AV0807005','Mail Trung Hiếu','11/10/1989','trunghieu@yahoo.com','0904115116','AV1'),
       ('AV0807007', 'Đỗ Đắc Huỳnh', '2/1/1990', 'dachuynh@yahoo.com', '0988574747', 'AV2'),
       ('AV0807009', 'An Đăng Khuê', '6/3/1986', 'dangkhue@yahoo.com', '0986757463', 'AV1'),
       ('AV0807010', 'Nguyễn T.Tuyết Lan', '12/7/1989', 'tuyetlan@gmail.com', '0983310342', 'AV2');
       ('AV0807011', 'Đinh Phụng Long', '2/12/1990', 'phunglong@yahoo.com', 'AV1'),
       ('AV0807012', 'Nguyễn Tuấn Nam', '2/3/1990', 'tuannam@yahoo.com', 'AV1');
GO
INSERT INTO MONHOC (MaMH, TenMH)
VALUES ('S001', 'SQL'),
       ('S002', 'Java Simplefield'),
       ('S003', 'Active Server Page');
GO
INSERT INTO DIEM (MaSV, MaMH, Ngay, Lythuyet, Thuchanh)
VALUES ('AV0807005', 'S001', 8, 25, '6/5/2008'),
       ('AV0807006', 'S002', 16, 30, '6/5/2008'),
       ('AV0807007', 'S001', 10, 25, '6/5/2008'),
       ('AV0807009', 'S003', 7, 13, '6/5/2008'),
       ('AV0807010', 'S003', 9, 16, '6/5/2008'),
       ('AV0807011', 'S002', 8, 30, '6/5/2008'),
       ('AV0807012', 'S001', 7, 31, '6/5/2008'),
       ('AV0807005', 'S002', 12, 11, '6/6/2008'),
       ('AV0807009', 'S003', 11, 20, '6/6/2008'),
       ('AV0807010', 'S001', 7, 6, '6/6/2008');
/**PHẦN D**/
/--CÂU1--/
SELECT *FROM SINHVIEN
/--CÂU2--/
SELECT *
FROM SINHVIEN
WHERE Lop='AV1';
/--CÂU3--/
AV0807012 sang lớp AV2
UPDATE SINHVIEN
SET Lop = 'AV2'
WHERE MaSV='AVAV0807012' ;
/--CÂU4--/
SELECT  Lop, COUNT(MaSV) AS 'Số sinh viên'
FROM SINHVIEN
GROUP BY  Lop;
/--CÂU5--/
SELECT TenSV 
FROM SINHVIEN
WHERE Lop = 'AV2'
ORDER BY TenSV ASC;
/--CÂU6--/
SELECT TenSV 
FROM SINHVIEN S INNER JOIN DIEM M 
ON S.MaSV = M.MaSV 
WHERE M.MaMH = 'S001' AND  M.Lythuyet < 10 AND M.Ngay = '2008/5/6'
ORDER BY TenSV ASC;
/--CÂU7--/
SELECT COUNT(*) 
FROM SINHVIEN S INNER JOIN DIEM M
ON S.MaSV = M.MaSV
WHERE M.MaMH = 'S001' AND  M.Lythuyet < 10 
/--CÂU8--/
SELECT * 
FROM SINHVIEN 
WHERE Lop = 'AV1' AND NgaySinh > '1980/1/1';
/--CÂU9--/
DELETE 
FROM SINHVIEN 
WHERE MaSV = 'AV0807011';
/--CÂU10--/
SELECT SINHVIEN.MaSV, TenSV, TenMH, Lythuyet, Thuchanh, Ngay 
FROM DIEM 
INNER JOIN MONHOC ON DIEM.MaMH = MONHOC.MaMH 
INNER JOIN SINHVIEN ON DIEM.MaSV = SINHVIEN.MaSV 
WHERE MONHOC.MaMH = 'S001' AND Ngay = '2008/05/06';