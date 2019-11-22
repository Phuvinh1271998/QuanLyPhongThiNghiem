create database DAMH
go
use DAMH
go
SET DATEFORMAT dmy;
go
create login khoa with password = 'sa2017',
default_database  = DAMH
use DAMH
create user khoa for login khoa
go
grant insert,select,delete,update,alter on DangKyHC to Khoa
go
grant insert,select,delete,update,alter on DangKyDC to Khoa
go
grant insert,select,delete,update,alter on DangKyTN to Khoa
go
grant insert,select,delete,update,alter on DangKyTapSDTB to Khoa
go
grant insert,select,delete,update,alter on DeAn to Khoa
go
grant insert,select,delete,update,alter on HoaChat to Khoa
go
grant insert,select,delete,update,alter on DungCu to Khoa
go
grant insert,select,delete,update,alter on GiaoVienHD to Khoa
go
grant insert,select,delete,update,alter on GiaoVienQLPTN to Khoa
go
grant insert,select,delete,update,alter on Khoa to Khoa
go
grant insert,select,delete,update,alter on NhomSV to Khoa
go
grant insert,select,delete,update,alter on PhanThietBi to Khoa
go
grant insert,select,delete,update,alter on PhanThietBi_LT to Khoa
go
grant insert,select,delete,update,alter on PhongThiNghiem to Khoa
go
grant insert,select,delete,update,alter on SinhVien to Khoa
go
grant insert,select,delete,update,alter on ThietBi to Khoa
go
grant execute on DK_HC to Khoa
go
grant execute on DK_DC to Khoa
go
grant execute on DK_TN to Khoa
go
grant execute on DK_TapSD to Khoa
go
grant execute on DSNhom_GVHD to Khoa


go
create login gvql with password = 'sa2017',
default_database  = DAMH
use DAMH
create user gvql for login gvql
go
grant insert,select,delete,update on HoaChat to GVQL
go
grant insert,select,delete,update on DangKyHC to GVQL
go
grant insert,select,delete,update on DungCu to GVQL
go
grant insert,select,delete,update on DangKyDC to GVQL
go
grant insert,select,delete,update on PhanThietBi to GVQL
go
grant insert,select,delete,update on ThietBi to GVQL
go
grant insert,select,delete,update on DangKyTN to GVQL
go
grant insert,select,delete,update on DangKyTapSDTB to GVQL
go
grant execute on DK_HC to gvql
go
grant execute on DK_DC to gvql
go
grant execute on DK_TN to gvql
go
grant execute on DK_TapSD to gvql
go
grant execute on DSNhom_GVHD to gvql
go
create table Khoa
(
	MaKhoa nchar(10) not NULL primary key,
	TenKhoa nvarchar(30) not NULL unique,
	DiaChiKhoa nvarchar(50) not NULL,
)
go
create table SinhVien
(
	MaSV nchar(10) not NULL primary key,
	TenSV nvarchar(30) not NULL,
	MaKhoa nchar(10) not NULL,
	Nganh nvarchar(30) not NULL,
	Lop nvarchar(10) not NULL,
	HocKy int,
	NamHoc int not NULL,
	MaNhom nchar(10),
)
go
create table GiaoVienHD
(
	MaGVHD nchar(10) not NULL primary key,
	TenGVHD nvarchar(30) not NULL,
	SDT_GVHD nchar(11) not NULL,
)
go
create table GiaoVienQLPTN
(
	MaGVQLPTN nchar(10) not NULL primary key,
	TenGVQLPTN nvarchar(30) not NULL,
	SDT_GVQLPTN nchar(11) not NULL,
)
go
create table PhongThiNghiem
(
	MaPTN nchar(10) not NULL primary key,
	TenPTN nvarchar(20),
	DiaChiPTN nvarchar(50),
	MaGVQLPTN nchar(10) not NULL,
)
go
create table HoaChat
(
	MaHC nchar(10) not NULL primary key,
	TenHC nvarchar(100) not NULL,
	QuyCach_HC nvarchar(20),
	DonViTinh_HC nvarchar(20) default('Ống'),
	SoLuong_HC int check(SoLuong_HC >= 0),
)
go
create table DungCu
(
	MaDC nchar(10) not NULL primary key,
	TenDC nvarchar(100) not NULL,
	QuyCach_DC nvarchar(20),
	DonViTinh_DC nvarchar(20) default('Cái'),
	SoLuong_DC int check(SoLuong_DC >= 0),
)
go
create table ThietBi
(
	MaTB nchar(10) not NULL primary key,
	TenTB nvarchar(100) not NULL,
	SoLuong_TB int check(SoLuong_TB >= 0),
)
go
create table DeAn
(
	MaDA nchar(10) not NULL primary key,
	TenDA nvarchar(150) not NULL,
	MaGVHD nchar(10),
	MaNhom nchar(10),
)
go
create table NhomSV
(
	MaNhom nchar(10) not NULL primary key,
	TenNhom nvarchar(30) not NULL,
)
go
create table PhanThietBi
(
	NgayPhan date not null,
	MaPTN nchar(10) not NULL,
	MaTB nchar(10) not NULL,
	SoLuongPhan_TB int check(SoLuongPhan_TB >= 0),
	constraint pk_PhanTB primary key (MaPTN,MaTB,NgayPhan)
)
go
create table PhanThietBi_LT
(
	NgayPhan date not null,
	MaPTN nchar(10) not NULL,
	MaTB nchar(10) not NULL,
	SoLuongPhan_TB int check(SoLuongPhan_TB >= 0),
	constraint pk_PhanTB_LT primary key (MaPTN,MaTB,NgayPhan)
)
go
create table DangKyTN
(
	MaPTN nchar(10) not NULL,
	MaNhom nchar(10) not NULL,
	NgayTN date,
	ThoiGianBD time,
	ThoiGianKT time,
	constraint pk_DangKyPhong primary key (MaPTN,MaNhom,NgayTN)
)
go
create table DangKyTapSDTB
(
	MaPTN nchar(10) not NULL,
	MaNhom nchar(10) not NULL,
	NgayTN date,
	ThoiGianBD time,
	ThoiGianKT time,
	constraint pk_DangKyTapSDTB primary key (MaPTN,MaNhom,NgayTN)
)
go
create table DangKyHC
(
	MaNhom nchar(10) not NULL,
	MaHC nchar(10) not NULL,
	SoLuongHC_DK int check(SoLuongHC_DK >= 0),
	constraint pk_DangKyHC primary key (MaHC,MaNhom)
)
go
create table DangKyDC
(
	MaNhom nchar(10) not NULL,
	MaDC nchar(10) not NULL,
	SoLuongDC_DK int check(SoLuongDC_DK >= 0),
	constraint pk_DangKyDC primary key (MaDC,MaNhom)
)
/*Khóa Ngoại Bảng SinhVien*/
go
alter table SinhVien
add  constraint SV_Khoa foreign key (MaKhoa) references Khoa(MaKhoa)
go
alter table SinhVien
add  constraint SV_Nhom foreign key (MaNhom) references NhomSV(MaNhom)
/*Khóa Ngoại Bảng GiaoVienHD*/
/*Khóa Ngoại Bảng GiaoVienQLPTN*/
/*Khóa Ngoại Bảng PhongThiNghiem*/
go
alter table PhongThiNghiem
add constraint PTN_GVQL foreign key (MaGVQLPTN) references GiaoVienQLPTN(MaGVQLPTN)
/*Khóa Ngoại Bảng ThietBi*/

/*Khóa Ngoại Bảng DeAn*/
go
alter table DeAn
add constraint DeAn_Nhom foreign key (MaNhom) references NhomSV(MaNhom)
go
alter table DeAn
add constraint DeAn_GVHD foreign key (MaGVHD) references GiaoVienHD(MaGVHD)
/*Khóa Ngoại Bảng NhomSV*/
/*Khóa Ngoại Bảng PhanTHietBi*/
go
alter table PhanThietBi
add constraint PhanTB_PTN foreign key (MaPTN) references PhongThiNghiem(MaPTN)
go
alter table PhanThietBi
add constraint PhanTB_ThietBi foreign key (MaTB) references ThietBi(MaTB)
/*Khóa Ngoại Bảng PhanTHietBi_LT*/
go
alter table PhanThietBi_LT
add constraint PhanTB_LT_PTN foreign key (MaPTN) references PhongThiNghiem(MaPTN)
go
alter table PhanThietBi_LT
add constraint PhanTB_LT_ThietBi foreign key (MaTB) references ThietBi(MaTB)
/*Khóa Ngoại Bảng DangKyTN*/
go
alter table DangKyTN
add constraint DangKyTN_PTN foreign key (MaPTN) references PhongThiNghiem(MaPTN)
go
alter table DangKyTN
add constraint DangKyTN_Nhom foreign key (MaNhom) references NhomSV(MaNhom)
/*Khóa Ngoại Bảng DangKyTapSDTB*/
go
alter table DangKyTapSDTB
add constraint DangKyTapSDTB_PTN foreign key (MaPTN) references PhongThiNghiem(MaPTN)
go
alter table DangKyTapSDTB
add constraint DangKyTapSDTB_Nhom foreign key (MaNhom) references NhomSV(MaNhom)
/*Khóa Ngoại Bảng DangKyHC*/
go
alter table DangKyHC
add constraint DangKyHC_Nhom foreign key (MaNhom) references NhomSV(MaNhom)
go
alter table DangKyHC
add constraint DangKyHC_HC foreign key (MaHC) references HoaChat(MaHC)
/*Khóa Ngoại Bảng DangKyDC*/
go
alter table DangKyDC
add constraint DangKyDC_Nhom foreign key (MaNhom) references NhomSV(MaNhom)
go
alter table DangKyDC
add constraint DangKyDC_DC foreign key (MaDC) references DungCu(MaDC)
/**/
/*TRIGGER*/
go
CREATE TRIGGER trg_PhanTB on PhanThietBi after insert AS
BEGIN
	update ThietBi
	set ThietBi.SoLuong_TB = ThietBi.SoLuong_TB - (select SoLuongPhan_TB
	from inserted
	where MaTB = ThietBi.MaTB)
	WHERE ThietBi.MaTB = (select MaTB
	from inserted)
end
go
CREATE TRIGGER trg_HuyPhanTB on PhanThietBi after delete AS
BEGIN
	update ThietBi
	set ThietBi.SoLuong_TB = ThietBi.SoLuong_TB + (select SoLuongPhan_TB
	from deleted
	where MaTB = ThietBi.MaTB)
	WHERE ThietBi.MaTB = (select MaTB
	from inserted)
end

go
CREATE TRIGGER trg_DKHC on DangKyHC after insert AS
BEGIN
	declare @hc nvarchar(10)= (select MaHC
	from inserted)
	update HoaChat
	set SoLuong_HC = (select SoLuong_HC
	from HoaChat, inserted
	where HoaChat.MaHC=inserted.MaHC) - (select SoLuongHC_DK
	from inserted)
	where HoaChat.MaHC=@hc
end

go
CREATE TRIGGER trg_DKDC on DangKyDC after insert AS
BEGIN
	declare @dc nvarchar(10)= (select MaDC
	from inserted)
	update DungCu
	set SoLuong_DC = (select SoLuong_DC
	from DungCu, inserted
	where DungCu.MaDC=inserted.MaDC) - (select SoLuongDC_DK
	from inserted)
	where DungCu.MaDC=@dc
end
go
CREATE TRIGGER trg_HuyDKDC on DangKyDC after delete AS
BEGIN
	update DungCu
	set DungCu.SoLuong_DC = DungCu.SoLuong_DC + (select SoLuongDC_DK
	from deleted
	where MaDC = DungCu.MaDC)
	where DungCu.MaDC = (select MaDC
	from inserted)
end

/*		--------------------------------------Procedure-------------------------------------------------		*/
/*Lấy danh sách đề án*/
go
create procedure DSNhom_GVHD
as
begin
	select TenNhom, TenDA, TenGVHD
	from NhomSV, DeAn, GiaoVienHD
	where DeAn.MaGVHD = GiaoVienHD.MaGVHD and DeAn.MaNhom = NhomSV.MaNhom
	order by TenDA
end;
/*Đăng ký hóa chất vs dc*/
go
create procedure DK_HC
	@Nhom nchar(10),
	@HC nchar(10),
	@SoLuong int
as
begin
	declare @dem int = (select count(*)
	from DangKyHC
	where @Nhom=DangKyHC.MaNhom and @HC=DangKyHC.MaHC);
	if @dem > 0
		return;
	else
		insert into DangKyHC
	values(@Nhom, @HC, @SoLuong);
end;

go
create procedure DK_DC
	@Nhom nchar(10),
	@DC nchar(10),
	@SoLuong int
as
begin
	declare @dem int = (select count(*)
	from DangKyDC
	where @Nhom=DangKyDC.MaNhom and @DC=DangKyDC.MaDC);
	if @dem > 0
		return;
	else
		insert into DangKyDC
	values(@Nhom, @DC, @SoLuong);
end;


/*Đăng ký phòng tn & Tập sd TB vs thiết bị*/
go
create procedure DK_TN
	@Phong nchar(10),
	@Nhom nchar(10),
	@Ngay date,
	@BD time,
	@KT time
as
begin
	declare @ti time = (select ThoiGianKT
	from DangKyTN
	where NgayTN=@Ngay and MaPTN=@Phong);
	if @ti > @BD
		return;
	else
		insert into DangKyTN
	values(@Phong, @Nhom, @Ngay, @BD, @KT);
end;

go
create procedure DK_TapSD
	@Phong nchar(10),
	@Nhom nchar(10),
	@Ngay date,
	@BD time,
	@KT time
as
begin
	declare @ti time = (select ThoiGianKT
	from DangKyTapSDTB
	where NgayTN=@Ngay and MaPTN=@Phong);
	if @ti > @BD
		return;
	else
		insert into DangKyTN
	values(@Phong, @Nhom, @Ngay, @BD, @KT);
end;
exec DK_TN 'PTN01','CNTP01','2/2/2020','8:00','11:00';
/*		--------------------------------------Dữ liệu-------------------------------------------------		*/
go
insert into Khoa
values(N'CNTT', N'Công nghệ thông tin', N'Tầng 3 nhà C');
go
insert into Khoa
values(N'CKDT', N'Cơ khí điện tử', N'Tầng 2 nhà B');
go
insert into Khoa
values(N'CNTP', N'Công nghệ thực phẩm', N'Tầng 1 nhà A');
go
insert into Khoa
values(N'QTKD', N'Quản trị kinh doanh', N'Tầng 3 nhà D');
go
insert into NhomSV
values(N'CNTP02', N'Công nghệ thực phẩm 02');
go
insert into NhomSV
values(N'CNTP03', N'Công nghệ thực phẩm 03');
go
insert into NhomSV
values(N'CNTP04', N'Công nghệ thực phẩm 04');
go
insert into NhomSV
values(N'CNTP05', N'Công nghệ thực phẩm 05');
go
insert into NhomSV
values(N'CNTP06', N'Công nghệ thực phẩm 06');
go
insert into NhomSV
values(N'CNTP07', N'Công nghệ thực phẩm 07');
go
insert into NhomSV
values(N'CNTP08', N'Công nghệ thực phẩm 08');
go
insert into NhomSV
values(N'CNTP09', N'Công nghệ thực phẩm 09');
go
insert into NhomSV
values(N'CNTP10', N'Công nghệ thực phẩm 10');
go
insert into NhomSV
values(N'CNTP01', N'Công nghệ thực phẩm 01');
go
insert into SinhVien
values('2001160180', N'Minh Khai Hoa', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP01');
go
insert into SinhVien
values('2001150120', N'Linh Thị Hoa', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP01');
go
insert into SinhVien
values('2001160220', N'Bông Thị Cúc', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP02');
go
insert into SinhVien
values('2001162150', N'Minh Ngộ Lý', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP02');
go
insert into SinhVien
values('2001160080', N'Kinh Tại Tây', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP03');
go
insert into SinhVien
values('2001160188', N'Kinh Hà Giang', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP03');
go
insert into SinhVien
values('2001160178', N'Thủy Ngậm Tự', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP04');
go
insert into SinhVien
values('2001160191', N'Tự Từ Hối', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP04');
go
insert into SinhVien
values('2001160345', N'Hối Vô Phương', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP05');
go
insert into SinhVien
values('2001160678', N'Phương Tái Ngẫm', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP05');
go
insert into SinhVien
values('2001160985', N'Ngẫm Vô Nghĩ', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP06');
go
insert into SinhVien
values('2001163557', N'Nghĩ Tức Thông', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP06');
go
insert into SinhVien
values('2001163537', N'A B C', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP07');
go
insert into SinhVien
values('2001163337', N'C S D', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP07');
go
insert into SinhVien
values('2001161227', N'O A B', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP08');
go
insert into SinhVien
values('2001161217', N'L O H', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP08');
go
insert into SinhVien
values('2001161117', N'U I O', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP09');
go
insert into SinhVien
values('2001162227', N'A W E', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP09');
go
insert into SinhVien
values('2001162147', N'Q E D', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP10');
go
insert into SinhVien
values('2001160777', N'Y I K', N'CNTP', N'Công nghệ thực phẩm', N'07DHTP1', 7, 2019, N'CNTP10');
go
insert into GiaoVienHD
values('GVHD01', N'Đinh Thị Mận', '0123564789');
go
insert into GiaoVienHD
values('GVHD02', N'Hoàng Văn Thụ', '0123784249');
go
insert into GiaoVienHD
values('GVHD03', N'Nguyện Hoài Hoa', '0123027898');
go
insert into GiaoVienHD
values('GVHD04', N'Hoa Định Thần', '0254584789');
go
insert into GiaoVienHD
values('GVHD05', N'Tâm Tướng Thiện', '0123545789');
go
insert into DeAn
values('DA01', N'Nghiên cứu thu nhận bột màu thực phẩm từ cây chùm ngây', 'GVHD01', N'CNTP01');
go
insert into DeAn
values('DA02', N'Đánh giá sự ổn định chất lượng bia lon Sài Gòn về chỉ tiêu cảm quan', 'GVHD01', N'CNTP02');
go
insert into DeAn
values('DA03', N'Đánh giá sự ổn định chất lượng bia lon Sài Gòn về chỉ tiêu hóa lý', 'GVHD02', N'CNTP03');
go
insert into DeAn
values('DA04', N'Nghiên cứu sản xuất sản phẩm cà phê nấm linh chi', 'GVHD02', N'CNTP04');
go
insert into DeAn
values('DA05', N'Nghiên cứu sản xuất sản phẩm khô cá mối tẩm cốm xanh ăn liền', 'GVHD03', N'CNTP05');
go
insert into DeAn
values('DA06', N'Nghiên cứu công nghệ sản xuất bột chanh gia vị', 'GVHD03', N'CNTP06');
go
insert into DeAn
values('DA07', N'Nghiên cứu quy trình công nghệ sản  xuất sữa bí đỏ', 'GVHD04', N'CNTP07');
go
insert into DeAn
values('DA08', N'Nghiên cứu quy trình công nghệ sản xuất nước uống từ vỏ cà phê', 'GVHD04', N'CNTP08');
go
insert into DeAn
values('DA09', N'Nghiên cứu quy trình sản xuất chà bông gà', 'GVHD05', N'CNTP09');
go
insert into DeAn
values('DA10', N'Nghiên cứu quy trình sản xuất Jambon heo', 'GVHD05', N'CNTP10');
go
insert into HoaChat
values('HC01', N'Ống chuẩn Hydrochloric acid 0.1N', '', N'Ống', 500);
go
insert into HoaChat
values('HC08', N'Ống chuẩn Oxalic acid 0.1 N', '', N'Ống', 500);
go
insert into HoaChat
values('HC02', N'Ống chuẩn Potassium dichromate 0.1N ', '', N'Ống', 500);
go
insert into HoaChat
values('HC03', N'Ống chuẩn Potassium permanganeseate 0.1N', '', N'Ống', 500);
go
insert into HoaChat
values('HC04', N'Ống chuẩn silver nitrate 0.1N', '', N'Ống', 500);
go
insert into HoaChat
values('HC05', N'Ống chuẩn Sodium hydroxide 0.1N ', '', N'Ống', 500);
go
insert into HoaChat
values('HC06', N'Ống chuẩn Sodium thiosulfate 0.01N', '', N'Ống', 500);
go
insert into HoaChat
values('HC07', N'Ống chuẩn Sodium thiosulfate 0.1N', '', N'Ống', 500);
go
insert into HoaChat
values('HC09', N'Ống đựng mẫu có nắp Vial (màu trắng)', '', N'Chai', 500);
go
insert into HoaChat
values('HC10', N'Ống đựng mẫu có nắp Vial (màu trắng)', '', N'Chai', 500);
go
insert into DangKyHC
values('CNTP01', 'HC01', 2);
go
insert into DangKyHC
values('CNTP01', 'HC02', 2);
go
insert into DangKyHC
values('CNTP02', 'HC03', 2);
go
insert into DangKyHC
values('CNTP02', 'HC04', 2);
go
insert into DangKyHC
values('CNTP03', 'HC05', 2);
go
insert into DangKyHC
values('CNTP03', 'HC06', 2);
go
insert into DangKyHC
values('CNTP04', 'HC07', 2);
go
insert into DangKyHC
values('CNTP04', 'HC08', 2);
go
insert into DangKyHC
values('CNTP05', 'HC09', 2);
go
insert into DangKyHC
values('CNTP05', 'HC10', 2);
go
insert into DangKyHC
values('CNTP06', 'HC01', 2);
go
insert into DangKyHC
values('CNTP06', 'HC10', 2);
go
insert into DangKyHC
values('CNTP07', 'HC02', 2);
go
insert into DangKyHC
values('CNTP07', 'HC08', 2);
go
insert into DangKyHC
values('CNTP08', 'HC04', 2);
go
insert into DangKyHC
values('CNTP08', 'HC07', 2);
go
insert into DangKyHC
values('CNTP09', 'HC04', 2);
go
insert into DangKyHC
values('CNTP09', 'HC06', 2);
go
insert into DangKyHC
values('CNTP10', 'HC04', 2);
go
insert into DangKyHC
values('CNTP10', 'HC05', 2);
go
insert into GiaoVienQLPTN
values('GVQL01', N'Đinh Hoài Mẫn', '0325641788')
go
insert into GiaoVienQLPTN
values('GVQL02', N'Trần Thu Hà', '0145648658')
go
insert into PhongThiNghiem
values('PTN01', N'Phòng Thí Nghiệm 1', N'...', 'GVQL01')
go
insert into PhongThiNghiem
values('PTN02', N'Phòng Thí Nghiệm 2', N'...', 'GVQL01')
go
insert into PhongThiNghiem
values('PTN03', N'Phòng Thí Nghiệm 3', N'...', 'GVQL02')
go
insert into PhongThiNghiem
values('PTN04', N'Phòng Thí Nghiệm 4', N'...', 'GVQL02')
go
insert into PhongThiNghiem
values('PTN05', N'Phòng Thí Nghiệm 5', N'...', 'GVQL02')
go
insert into PhongThiNghiem
values('PTN06', N'Phòng Thí Nghiệm 6', N'...', 'GVQL01')
go
insert into PhongThiNghiem
values('PTN07', N'Phòng Thí Nghiệm 7', N'...', 'GVQL01')
go
insert into PhongThiNghiem
values('PTN08', N'Phòng Thí Nghiệm 8', N'...', 'GVQL01')
go
insert into PhongThiNghiem
values('PTN09', N'Phòng Thí Nghiệm 9', N'...', 'GVQL02')
go
insert into PhongThiNghiem
values('PTN10', N'Phòng Thí Nghiệm 10', N'...', 'GVQL02')
go
insert into ThietBi
values('TB01', N'Van góc phải vô khuẩn', 5)
go
insert into ThietBi
values('TB02', N'Van thử nồng độ vô khuẩn loại N7', 5)
go
insert into ThietBi
values('TB03', N'Van thử nồng độ vô khuẩn loại N13', 5)
go
insert into ThietBi
values('TB04', N'Van thử nồng độ vệ sinh loại N1', 5)
go
insert into ThietBi
values('TB05', N'Van đóng đôi loại N4', 5)
go
insert into ThietBi
values('TB06', N'Nhiệt kế điện tử ', 5)
go
insert into ThietBi
values('TB07', N'Thiết bị ly tâm tách chất béo', 5)
go
insert into ThietBi
values('TB08', N'Tủ sấy chân không', 5)
go
insert into ThietBi
values('TB09', N'Brix kế  0-32', 5)
go
insert into ThietBi
values('TB10', N'Dụng cụ đo pH cầm tay', 5)
go
insert into ThietBi
values('TB11', N'Hệ thống phá mẫu Kjeldahl và xử lý khí độc', 5)
go
insert into ThietBi
values('TB12', N'Hệ thống thiết bị xưởng bia ', 5)
go
insert into ThietBi
values('TB13', N'Kính hiển vi sinh học, hai mắt', 5)
go
insert into ThietBi
values('TB14', N'Máy lắc ống nghiệm', 5)
go
insert into ThietBi
values('TB15', N'Máy làm kem tươi', 5)
go
insert into ThietBi
values('TB16', N'Máy li tâm ống', 5)
go
insert into ThietBi
values('TB17', N'Bộ cất cồn áp suất thấp', 5)
go
insert into ThietBi
values('TB18', N'WLL180T', 5)
go
insert into ThietBi
values('TB19', N'Máy đồng hóa', 5)
go
insert into ThietBi
values('TB20', N'Máy quang phổ khả biến', 5)
go
insert into PhanThietBi
values('1/1/2020', N'PTN01', N'TB01', 1)
go
insert into PhanThietBi
values('2/1/2020', N'PTN01', N'TB02', 1)
go
insert into PhanThietBi
values('3/1/2020', N'PTN02', N'TB03', 1)
go
insert into PhanThietBi
values('4/1/2020', N'PTN02', N'TB04', 1)
go
insert into PhanThietBi
values('5/1/2020', N'PTN03', N'TB05', 1)
go
insert into PhanThietBi
values('6/1/2020', N'PTN03', N'TB06', 1)
go
insert into PhanThietBi
values('7/1/2020', N'PTN04', N'TB07', 1)
go
insert into PhanThietBi
values('8/1/2020', N'PTN04', N'TB08', 1)
go
insert into PhanThietBi
values('9/1/2020', N'PTN05', N'TB09', 1)
go
insert into PhanThietBi
values('10/1/2020', N'PTN05', N'TB10', 1)
go
insert into PhanThietBi_LT
values('21/12/2019', N'PTN06', N'TB01', 1)
go
insert into PhanThietBi_LT
values('22/12/2019', N'PTN06', N'TB02', 1)
go
insert into PhanThietBi_LT
values('23/12/2019', N'PTN07', N'TB03', 1)
go
insert into PhanThietBi_LT
values('24/12/2019', N'PTN07', N'TB04', 1)
go
insert into PhanThietBi_LT
values('25/12/2019', N'PTN08', N'TB05', 1)
go
insert into PhanThietBi_LT
values('26/12/2019', N'PTN08', N'TB06', 1)
go
insert into PhanThietBi_LT
values('27/12/2019', N'PTN09', N'TB07', 1)
go
insert into PhanThietBi_LT
values('28/12/2019', N'PTN09', N'TB08', 1)
go
insert into PhanThietBi_LT
values('29/12/2019', N'PTN10', N'TB09', 1)
go
insert into PhanThietBi_LT
values('30/12/2019', N'PTN10', N'TB10', 1)
go
insert into DungCu
values('DC01', N'Bình tam giác nút mài', N'1000ml', N'Cái', 50)
go
insert into DungCu
values('DC02', N'Bình tam giác', N'1000ml', N'Cái', 50)
go
insert into DungCu
values('DC03', N'Ống nghiệm có nắp', N'Ф18', N'Cái', 50)
go
insert into DungCu
values('DC04', N'Ống nghiệm có nhánh', N'Ф18', N'Cái', 50)
go
insert into DungCu
values('DC05', N'Ống nghiệm chịu nhiệt ', N'Ф18', N'Cái', 50)
go
insert into DungCu
values('DC06', N'Ống sinh hàn thẳng ', N'không nhám', N'Cái', 50)
go
insert into DungCu
values('DC07', N'Ống nghiệm đáy bằng', N'25ml có nắp', N'Cái', 50)
go
insert into DungCu
values('DC08', N'Ống thủy tinh U', N' Ф20', N'Cái', 50)
go
insert into DungCu
values('DC09', N'Ống nghiệm có nắp ', N'Ф10', N'Cái', 50)
go
insert into DungCu
values('DC10', N'Bộ cất cồn', N'', N'Bộ', 50)
go
insert into DungCu
values('DC11', N'Bộ cất đạm', N'', N'Bộ', 50)
go
insert into DungCu
values('DC12', N'Pipet bầu ', N'10ml', N'Cái', 50)
go
insert into DungCu
values('DC13', N'Pipet chữ V', N'lớn', N'Cái', 50)
go
insert into DungCu
values('DC14', N'Phễu chiết ', N'1000ml', N'Cái', 50)
go
insert into DungCu
values('DC15', N'Phễu thủy tinh ', N'Ф60', N'Cái', 50)
go
insert into DungCu
values('DC16', N'Rây inox lỗ ', N'0.125mm', N'Cái', 50)
go
insert into DungCu
values('DC17', N'Rây inox lỗ ', N'0.3mm', N'Cái', 50)
go
insert into DungCu
values('DC18', N'Bếp đun bình cầu ', N'1000ml', N'Cái', 50)
go
insert into DungCu
values('DC19', N'Lò nướng', N'nhỏ', N'Cái', 50)
go
insert into DungCu
values('DC20', N'Máy đánh trứng', N'', N'Cái', 50)
go
insert into DangKyDC
values('CNTP01', 'DC01', 5)
go
insert into DangKyDC
values('CNTP01', 'DC02', 5)
go
insert into DangKyDC
values('CNTP02', 'DC03', 5)
go
insert into DangKyDC
values('CNTP02', 'DC04', 5)
go
insert into DangKyDC
values('CNTP03', 'DC05', 5)
go
insert into DangKyDC
values('CNTP03', 'DC06', 5)
go
insert into DangKyDC
values('CNTP04', 'DC07', 5)
go
insert into DangKyDC
values('CNTP04', 'DC08', 5)
go
insert into DangKyDC
values('CNTP05', 'DC09', 5)
go
insert into DangKyDC
values('CNTP05', 'DC10', 5)
go
insert into DangKyDC
values('CNTP06', 'DC01', 5)
go
insert into DangKyDC
values('CNTP06', 'DC03', 5)
go
insert into DangKyDC
values('CNTP07', 'DC04', 5)
go
insert into DangKyDC
values('CNTP07', 'DC08', 5)
go
insert into DangKyDC
values('CNTP08', 'DC15', 5)
go
insert into DangKyDC
values('CNTP08', 'DC14', 5)
go
insert into DangKyDC
values('CNTP09', 'DC12', 5)
go
insert into DangKyDC
values('CNTP09', 'DC09', 5)
go
insert into DangKyDC
values('CNTP10', 'DC03', 5)
go
insert into DangKyDC
values('CNTP10', 'DC17', 5)
go
insert into DangKyTN
values('PTN01', 'CNTP01', '1/1/2020', '06:00', '09:30')
go
insert into DangKyTN
values('PTN01', 'CNTP02', '1/1/2020', '13:00', '16:30')
go
insert into DangKyTN
values('PTN01', 'CNTP03', '2/1/2020', '07:00', '10:30')
go
insert into DangKyTN
values('PTN01', 'CNTP04', '2/1/2020', '14:00', '17:30')
go
insert into DangKyTN
values('PTN02', 'CNTP01', '3/1/2020', '06:00', '09:30')
go
insert into DangKyTN
values('PTN02', 'CNTP02', '3/1/2020', '13:00', '16:30')
go
insert into DangKyTN
values('PTN02', 'CNTP05', '4/1/2020', '07:00', '10:30')
go
insert into DangKyTN
values('PTN02', 'CNTP07', '4/1/2020', '14:00', '17:30')
go
insert into DangKyTN
values('PTN03', 'CNTP01', '5/1/2020', '06:00', '09:30')
go
insert into DangKyTN
values('PTN03', 'CNTP02', '5/1/2020', '13:00', '4:30')
go
insert into DangKyTN
values('PTN03', 'CNTP10', '5/1/2020', '07:00', '10:30')
go
insert into DangKyTN
values('PTN04', 'CNTP03', '6/1/2020', '14:00', '17:30')
go
insert into DangKyTN
values('PTN04', 'CNTP01', '6/1/2020', '06:00', '09:30')
go
insert into DangKyTN
values('PTN04', 'CNTP02', '6/1/2020', '13:00', '4:30')
go
insert into DangKyTN
values('PTN04', 'CNTP04', '7/1/2020', '07:00', '10:30')
go
insert into DangKyTN
values('PTN04', 'CNTP05', '7/1/2020', '14:00', '17:30')
go
insert into DangKyTN
values('PTN05', 'CNTP01', '6/1/2020', '06:00', '09:30')
go
insert into DangKyTN
values('PTN05', 'CNTP02', '6/1/2020', '13:00', '4:30')
go
insert into DangKyTN
values('PTN05', 'CNTP03', '7/1/2020', '07:00', '10:30')
go
insert into DangKyTN
values('PTN05', 'CNTP01', '7/1/2020', '14:00', '17:30')
go
insert into DangKyTapSDTB
values('PTN01', 'CNTP01', '21/12/2019', '06:00', '09:30')
go
insert into DangKyTapSDTB
values('PTN01', 'CNTP02', '21/12/2019', '13:00', '16:30')
go
insert into DangKyTapSDTB
values('PTN01', 'CNTP03', '22/12/2019', '07:00', '10:30')
go
insert into DangKyTapSDTB
values('PTN01', 'CNTP04', '22/12/2019', '14:00', '17:30')
go
insert into DangKyTapSDTB
values('PTN02', 'CNTP01', '23/12/2019', '06:00', '09:30')
go
insert into DangKyTapSDTB
values('PTN02', 'CNTP02', '23/12/2019', '13:00', '16:30')
go
insert into DangKyTapSDTB
values('PTN02', 'CNTP05', '24/12/2019', '07:00', '10:30')
go
insert into DangKyTapSDTB
values('PTN02', 'CNTP07', '24/12/2019', '14:00', '17:30')
go
insert into DangKyTapSDTB
values('PTN03', 'CNTP01', '25/12/2019', '06:00', '09:30')
go
insert into DangKyTapSDTB
values('PTN03', 'CNTP02', '25/12/2019', '13:00', '4:30')
go
insert into DangKyTapSDTB
values('PTN03', 'CNTP10', '25/12/2019', '07:00', '10:30')
go
insert into DangKyTapSDTB
values('PTN04', 'CNTP03', '26/12/2019', '14:00', '17:30')
go
insert into DangKyTapSDTB
values('PTN04', 'CNTP01', '26/12/2019', '06:00', '09:30')
go
insert into DangKyTapSDTB
values('PTN04', 'CNTP02', '26/12/2019', '13:00', '4:30')
go
insert into DangKyTapSDTB
values('PTN04', 'CNTP04', '27/12/2019', '07:00', '10:30')
go
insert into DangKyTapSDTB
values('PTN04', 'CNTP05', '27/12/2019', '14:00', '17:30')
go
insert into DangKyTapSDTB
values('PTN05', 'CNTP01', '26/12/2019', '06:00', '09:30')
go
insert into DangKyTapSDTB
values('PTN05', 'CNTP02', '26/12/2019', '13:00', '4:30')
go
insert into DangKyTapSDTB
values('PTN05', 'CNTP03', '27/12/2019', '07:00', '10:30')
go
insert into DangKyTapSDTB
values('PTN05', 'CNTP01', '27/12/2019', '14:00', '17:30')
