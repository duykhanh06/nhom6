﻿/*Câu2a*/
CREATE VIEW VW_DD_NV AS 
SELECT HONV,TENNV,TENPHG,DIADIEM FROM PHONGBAN
INNER JOIN DIADIEM_PHG ON DIADIEM_PHG.MAPHG=PHONGBAN.MAPHG
INNER JOIN NHANVIEN ON NHANVIEN.PHG=PHONGBAN.MAPHG
SELECT * FROM VW_DD_NV
/*Câu2b*/
CREATE VIEW VW_TUOI_NV AS 
SELECT TENNV,LUONG,YEAR (GETDATE())-YEAR(NGSINH) AS 'TUỔI' FROM NHANVIEN
SELECT * FROM VW_TUOI_NV
/*Câu2c*/
IF OBJECT_ID('VW_PB') IS NOT NULL
DROP FUNCTION VW_PB
GO
CREATE VIEW VW_PB(TENPHONGBAN,HOTENTP,SLNV)
AS
SELECT  TENPHG, COUNT(NV.MANV),CONCAT(TP.HONV,'',TP.TENLOT, '',TP.TENNV)
FROM NHANVIEN AS NV INNER JOIN PHONGBAN  ON PHONGBAN.MAPHG=NV.PHG
INNER JOIN NHANVIEN AS TP ON TP.MANV=PHONGBAN.TRPHG
GROUP BY TENPHG,TP.TENNV,TP.HONV,TP.TENLOT
ORDER BY COUNT (NV.MANV) DESC

SELECT * FROM PHONGBAN 
SELECT * FROM NHANVIEN
SELECT * FROM VW_PB