
create proc cau2_c @MaDa int,@Ddiem_DA nvarchar(15) 
as
begin
		select count(MANV) as 'Số lượng nhân viên' , MADA as 'Mã đề án', TENPHG as 'Mã đề án',DDIEM_DA as 'Địa điểm đề án'from PHONGBAN
		inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG
		inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
		where MADA = @MaDa  and  DDIEM_DA = @Ddiem_DA 
		group by TENPHG,MADA,DDIEM_DA
end
go