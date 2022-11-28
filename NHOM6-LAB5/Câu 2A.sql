create proc lab5_cau2_a @MaNV varchar(20)
as
	begin
		select * from NHANVIEN where MANV = @MaNV
	end
exec lab5_cau2_a '003'
go