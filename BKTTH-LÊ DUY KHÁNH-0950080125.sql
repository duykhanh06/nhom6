--Câu 1:
----1a. Tạo các login; tạo các user khai thác CSDL AdventureWorks2008R2 cho các nhân viên nêu trên (tên login trùng tên user).
-- Tạo login cho trưởng nhóm TN
CREATE LOGIN TN WITH PASSWORD = 'password';
GO

-- Tạo user cho trưởng nhóm TN
USE AdventureWorks2008R2;
CREATE USER TN FOR LOGIN TN;
GO

-- Tạo login cho nhân viên NV
CREATE LOGIN NV WITH PASSWORD = 'password';
GO

-- Tạo user cho nhân viên NV
USE AdventureWorks2008R2;
CREATE USER NV FOR LOGIN NV;
GO

-- Tạo login cho nhân viên QL
CREATE LOGIN QL WITH PASSWORD = 'password';
GO

-- Tạo user cho nhân viên QL
USE AdventureWorks2008R2;
CREATE USER QL FOR LOGIN QL;
GO

----1b. b. Phân quyền để các nhân viên hoàn thành nhiệm vụ được phân công.

-- Phân quyền cho trưởng nhóm TN
USE AdventureWorks2008R2;
GRANT SELECT, UPDATE, DELETE ON Production.ProductInventory TO TN;
GO

-- Phân quyền cho nhân viên NV
USE AdventureWorks2008R2;
GRANT SELECT, UPDATE, DELETE ON Production.ProductInventory TO NV;
GO

-- Phân quyền cho nhân viên QL
USE AdventureWorks2008R2;
GRANT SELECT, UPDATE, DELETE ON Production.ProductInventory TO QL;
GO

-- Admin phải có quyền CONTROL trên tất cả các đối tượng trong cơ sở dữ liệu
USE AdventureWorks2008R2;
GRANT CONTROL TO [Admin];
GO

----1c. Đăng nhập và thực hiện các yêu cầu:

-- Đăng nhập với tài khoản của trưởng nhóm TN
USE AdventureWorks2008R2;
EXECUTE AS USER = 'TN';

-- Sửa 1 dòng dữ liệu tùy ý trong bảng Production.ProductInventory
UPDATE Production.ProductInventory
SET Quantity = 20
WHERE ProductID = 1;

-- Kết thúc quyền của trưởng nhóm TN
REVERT;

-- Đăng nhập với tài khoản của nhân viên NV
USE AdventureWorks2008R2;
EXECUTE AS USER = 'NV';

-- Xóa 1 dòng dữ liệu tùy ý trong bảng Production.ProductInventory
DELETE FROM Production.ProductInventory
WHERE ProductID = 2;

-- Kết thúc quyền của nhân viên NV
REVERT;

-- Đăng nhập với tài khoản của nhân viên QL
USE AdventureWorks2008R2;
EXECUTE AS USER = 'QL';

-- Xem lại kết quả thực hiện của trưởng nhóm TN và nhân viên NV
SELECT * FROM Production.ProductInventory;

-- Kết thúc quyền của nhân viên QL
REVERT;

----1d. Ai có thể sửa được dữ liệu bảng Production.Product ?
    --Chỉ có trưởng nhóm TN và nhân viên QL có thể sửa được dữ liệu bảng Production.Product, vì họ được phân quyền SELECT và UPDATE trên bảng này.

----1e. Thu hồi quyền cấp cho nhân viên NV:
-- Thu hồi quyền của nhân viên NV
USE AdventureWorks2008R2;
REVOKE SELECT, DELETE ON Production.ProductInventory FROM NV;
GO

-- Xóa user của nhân viên NV
USE AdventureWorks2008R2;
DROP USER NV;
GO

----1f.Nhóm 1 hoàn thành dự án, admin hãy vô hiệu hóa các hoạt động của nhóm này trên CSDL
ALTER LOGIN TruongNhom DISABLE;
ALTER LOGIN NhanVien DISABLE
--Câu 2:
--T1
backup database AdventureWorks2008R2 to disk = 'D:\thu\Adven.bak'
--T3
backup database AdventureWorks2008R2 to disk = 'D\sql\Adven_Diff.bak' with differential
--T4
truncate table Person.Emailaddress;
--T7
backup log AdventureWorks2008R2 to disk = 'D:\sql\Adven.trn'
--T8
DROP DATABASE AdventureWorks2008R2;
--T9
restore log AdventureWorks2008R2 from disk = 'D:\sql\Adven.trn'