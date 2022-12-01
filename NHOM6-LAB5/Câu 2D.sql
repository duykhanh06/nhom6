create proc cau2_d @Trphg nvarchar(10) as
begin
select  * from NHANVIEN inner join PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG
where TRPHG = @Trphg
end
go
exec cau2_d '006' 