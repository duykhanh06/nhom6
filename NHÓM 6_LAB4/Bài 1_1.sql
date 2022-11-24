SELECT IIF(LUONG>=LTB,'KHÔNG TĂNG LƯƠNG','Tăng lương')
as thuong,tennv,luong,ltb
from

(select TENNV,LUONG,ltb from NHANVIEN,
(select avg(LUONG) as 'ltb',PHG from NHANVIEN group by PHG) AS TAM
WHERE NHANVIEN.PHG = TAM.PHG) as abc

SELECT * FROM NHANVIEN
select avg(LUONG) as 'ltb',PHG from NHANVIEN group by PHG