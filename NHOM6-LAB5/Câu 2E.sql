create proc cau2_e @Manv nvarchar(10),@Mapb nvarchar(10) as
begin
if exists (select * from NHANVIEN where MANV = @Manv and PHG = @Mapb)
	print' C�'
else
	print ' Kh�ng'
end
go
exec cau2_e '002','4'