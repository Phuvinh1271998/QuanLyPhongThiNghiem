create database DAMH
go
use DAMH
go
SET DATEFORMAT dmy;
go
create table Khoa(
	MaKhoa nchar(10) not NULL primary key,
	TenKhoa nvarchar(30) not NULL unique,
	DiaChiKhoa nvarchar(50) not NULL,
)
go
create table SinhVien(
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
create table GiaoVienHD(
	MaGVHD nchar(10) not NULL primary key,
	TenGVHD nvarchar(30) not NULL,
	SDT_GVHD nchar(11) not NULL,
)
go
create table GiaoVienQLPTN(
	MaGVQLPTN nchar(10) not NULL primary key,
	TenGVQLPTN nvarchar(30) not NULL,
	SDT_GVQLPTN nchar(11) not NULL,
)
go
create table PhongThiNghiem(
	MaPTN nchar(10) not NULL primary key,
	TenPTN nvarchar(20),
	DiaChiPTN nvarchar(50),
	MaGVQLPTN nchar(10) not NULL,
)
go
create table HoaChat(
	MaHC nchar(10) not NULL primary key,
	TenHC nvarchar(30) not NULL,
	QuyCach nvarchar(20) not NULL default('Lọ 100g'),
	DonViTinh_HC nvarchar(20) not NULL default('Cái'),
	SoLuong_HC int check(SoLuong_HC >= 0),
)
go
create table DungCu(
	MaDC nchar(10) not NULL primary key,
	TenDC nvarchar(30) not NULL,
	DonViTinh_DC nvarchar(20) not NULL default('Cái'),
	SoLuong_DC int check(SoLuong_DC >= 0),
)
go
create table ThietBi(
	MaTB nchar(10) not NULL primary key,
	TenTB nvarchar(30) not NULL,
	SoLuong_TB int check(SoLuong_TB >= 0),
)
go
create table DeAn(
	MaDA nchar(10) not NULL primary key,
	TenDA nvarchar(150) not NULL,
	NoiDungDA nvarchar(50),
	MaGVHD nchar(10),
	MaNhom nchar(10),
)
go
create table NhomSV(
	MaNhom nchar(10) not NULL primary key,
	TenNhom nvarchar(30) not NULL,
)
go
create table PhanThietBi(
	MaPTN nchar(10) not NULL,
	MaTB nchar(10) not NULL,
	SoLuongPhan_TB int check(SoLuongPhan_TB >= 0),
	constraint pk_PhanThietBi primary key (MaPTN,MaTB)
)
go
create table DangKyTN(
	MaPTN nchar(10) not NULL,
	MaNhom nchar(10) not NULL,
	NgayTN date not NULL,
	constraint pk_DangKyPhong primary key (MaPTN,MaNhom,NgayTN)
)
go
create table DangKyHC(
	MaNhom nchar(10) not NULL,
	MaHC nchar(10) not NULL,
	SoLuongHC_DK int check(SoLuongHC_DK >= 0),
	constraint pk_DangKyHC primary key (MaHC,MaNhom)
)
go
create table DangKyDC(
	MaNhom nchar(10) not NULL,
	MaDC nchar(10) not NULL,
	SoLuongDC_DK int check(SoLuongDC_DK >= 0),
	constraint pk_DangKyDC primary key (MaDC,MaNhom)
)
go
create table TaiKhoan(
	id nvarchar(20) not NULL primary key,
	MatKhau nvarchar(20),
	MaGVQLPTN nchar(10),
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
/*Khóa Ngoại Bảng DangKyTN*/
go
alter table DangKyTN
add constraint DangKyTN_PTN foreign key (MaPTN) references PhongThiNghiem(MaPTN)
go
alter table DangKyTN
add constraint DangKyTN_Nhom foreign key (MaNhom) references NhomSV(MaNhom)
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
go
alter table TaiKhoan
add constraint TaiKhoan_GVQL foreign key (MaGVQLPTN) references GiaoVienQLPTN(MaGVQLPTN)
/*TRIGGER*/
go
CREATE TRIGGER trg_PhanTB on PhanThietBi after insert,update AS
BEGIN
	update ThietBi
	set ThietBi.SoLuong_TB = ThietBi.SoLuong_TB - (select SoLuongPhan_TB
												from inserted
												where MaTB = ThietBi.MaTB)
end
go
CREATE TRIGGER trg_HuyPhanTB on PhanThietBi after delete AS
BEGIN
	update ThietBi
	set ThietBi.SoLuong_TB = ThietBi.SoLuong_TB + (select SoLuongPhan_TB
												from deleted
												where MaTB = ThietBi.MaTB)
end

go
CREATE TRIGGER trg_DKHC on DangKyHC after insert,update AS
BEGIN
	update HoaChat
	set HoaChat.SoLuong_HC = HoaChat.SoLuong_HC - (select SoLuongHC_DK
												from inserted
												where MaHC = HoaChat.MaHC)
end
go
CREATE TRIGGER trg_HuyDKHC on DangKyHC after delete AS
BEGIN
	update HoaChat
	set HoaChat.SoLuong_HC = HoaChat.SoLuong_HC + (select SoLuongHC_DK
												from deleted
												where MaHC = HoaChat.MaHC)
end

go
CREATE TRIGGER trg_DKDC on DangKyDC after insert,update AS
BEGIN
	update DungCu
	set DungCu.SoLuong_DC = DungCu.SoLuong_DC - (select SoLuongDC_DK
												from inserted
												where MaDC = DungCu.MaDC)
end
go
CREATE TRIGGER trg_HuyDKDC on DangKyDC after delete AS
BEGIN
	update DungCu
	set DungCu.SoLuong_DC = DungCu.SoLuong_DC + (select SoLuongDC_DK
												from deleted
												where MaDC = DungCu.MaDC)
end


/*		--------------------------------------Dữ liệu-------------------------------------------------		*/
go
insert into Khoa values(N'CNTT',N'Công nghệ thông tin',N'Tầng 3 nhà C');
go
insert into Khoa values(N'CKDT',N'Cơ khí điện tử',N'Tầng 2 nhà B');
go
insert into Khoa values(N'CNTP',N'Công nghệ thực phẩm',N'Tầng 1 nhà A');
go
insert into Khoa values(N'QTKD',N'Quản trị kinh doanh',N'Tầng 3 nhà D');
go
insert into NhomSV values(N'CNTT01',N'Công nghệ thông tin 01');
go
insert into NhomSV values(N'CNTT02',N'Công nghệ thông tin 02');
go
insert into NhomSV values(N'CNTP01',N'Công nghệ thực phẩm 01');
go
insert into NhomSV values(N'QTKD01',N'Quản trị kinh doanh 01');
go
insert into NhomSV values(N'QTKD08',N'Quản trị kinh doanh 08');
go
insert into SinhVien values('2001160180',N'Minh Khai Hoa',N'CNTT',N'Công nghệ phần mềm',N'07DHTH5',7,2019,N'CNTT01');
go
insert into SinhVien values('2001150120',N'Linh Thị Hoa',N'CNTT',N'Công nghệ phần mềm',N'07DHTH4',9,2019,N'CNTT01');
go
insert into SinhVien values('2001160220',N'Bông Thị Cúc',N'CNTT',N'Công nghệ phần mềm',N'07DHTH4',7,2019,N'CNTT02');
go
insert into SinhVien values('2001162150',N'Minh Ngộ Lý',N'CNTT',N'Mạng máy tính',N'07DHTH3',7,2019,N'CNTT02');
go
insert into SinhVien values('2001160080',N'Kinh Tại Tây',N'CNTP',N'Chế biến thủy sản',N'07DHTP2',7,2019,N'CNTP01');
go
insert into SinhVien values('2001160188',N'Kinh Hà Giang',N'CNTP',N'Chế biến thủy sản',N'07DHTP5',7,2019,N'CNTP01');
go
insert into SinhVien values('2001160178',N'Thủy Ngậm Tự',N'CNTP',N'Chế biến nông sản',N'07DHTP4',7,2019,N'CNTP01');
go
insert into SinhVien values('2001160191',N'Tự Từ Hối',N'CNTT',N'Kế Toán',N'07DHQTKD3',7,2019,N'QTKD01');
go
insert into SinhVien values('2001160345',N'Hối Vô Phương',N'CNTT',N'Kế Toán',N'07DHQTKD5',7,2019,N'QTKD01');
go
insert into SinhVien values('2001160678',N'Phương Tái Ngẫm',N'CNTT',N'Kế Toán',N'07DHQTKD5',7,2019,N'QTKD01');
go
insert into SinhVien values('2001160985',N'Ngẫm Vô Nghĩ',N'CNTT',N'Kế Toán',N'07DHQTKD2',7,2019,N'QTKD08');
go
insert into SinhVien values('2001160127',N'Nghĩ Tức Thông',N'CNTT',N'Kế Toán',N'07DHQTKD2',7,2019,N'QTKD08');
go
insert into GiaoVienHD values('GVHD01',N'Đinh Thị Mận','0123564789');
go
insert into GiaoVienHD values('GVHD02',N'Hoàng Văn Thụ','0123784249');
go
insert into GiaoVienHD values('GVHD03',N'Nguyện Hoài Hoa','0123027898');
go
insert into GiaoVienHD values('GVHD04',N'Hoa Định Thần','0254584789');
go
insert into GiaoVienHD values('GVHD05',N'Tâm Tướng Thiện','0123545789');
go
insert into DeAn values('DA01',N'Phần mềm bán quần áo online',N'Shop bán hàng online','GVHD01',N'CNTT01');
go
insert into DeAn values('DA02',N'Web chat online',N'Web','GVHD03',N'CNTT02');
go
insert into DeAn values('DA03',N'Quản lí an toàn vệ sinh thực phẩm',N'....','GVHD02',N'CNTP01');
go
insert into DeAn values('DA04',N'Ngân sách nhà nước. Thực trạng thu chi và giải pháp trong quá trình đổi mới',N'....','GVHD04',N'QTKD01');
go
insert into DeAn values('DA05',N'Những vấn đề cơ bản về chất lượng và quản trị chất lượng',N'....','GVHD05',N'QTKD08');
go
insert into HoaChat values('HC01',N'Chất điều chỉnh độ acid',N'Lọ 100g',N'Cái',50);
go
insert into HoaChat values('HC08',N'Chất điều vị',N'Lọ 100g',N'Cái',50);
go
insert into HoaChat values('HC02',N'Chất ổn định',N'Lọ 100g',N'Cái',50);
go
insert into HoaChat values('HC03',N'Chất bảo quản',N'Lọ 100g',N'Cái',50);
go
insert into HoaChat values('HC04',N'Chất chống oxy hóa',N'Lọ 100g',N'Cái',50);
go
insert into HoaChat values('HC05',N' Phẩm màu',N'Lọ 100g',N'Cái',50);
go
insert into HoaChat values('HC06',N'Hương liệu',N'Lọ 100g',N'Cái',50);
go
insert into HoaChat values('HC07',N' Chất làm dày',N'Lọ 100g',N'Cái',50);
go
insert into DangKyHC values('CNTP01','HC01',2);
go
insert into DangKyHC values('CNTP01','HC02',2);
go
insert into DangKyHC values('CNTP01','HC03',2);
go
insert into DangKyHC values('CNTP01','HC04',2);
go
insert into DangKyHC values('CNTP01','HC05',2);
go
insert into DangKyHC values('CNTP01','HC06',2);
go
insert into DangKyHC values('CNTP01','HC07',2);
go
insert into DangKyHC values('CNTP01','HC08',2);
go
insert into GiaoVienQLPTN values('GVQL01',N'Đinh Hoài Mẫn','0325641788')
go
insert into GiaoVienQLPTN values('GVQL02',N'Trần Thu Hà','0145648658')
go
insert into TaiKhoan values ('TK01',N'1','GVQL01')
go
insert into TaiKhoan values ('TK01',N'2','GVQL02')
go
insert into PhongThiNghiem values('PTN01',N'Phòng Thí Nghiệm 1',N'...','GVQL01')
go
insert into PhongThiNghiem values('PTN02',N'Phòng Thí Nghiệm 2',N'...','GVQL01')
go
insert into PhongThiNghiem values('PTN03',N'Phòng Thí Nghiệm 3',N'...','GVQL02')
go
insert into ThietBi values('TP01',N'Máy Đo A',5)
go
insert into ThietBi values('TP02',N'Máy Đo B',5)
go
insert into ThietBi values('TP03',N'Máy Đo C',5)
go
insert into ThietBi values('TP04',N'Máy Đo D',5)
go
insert into ThietBi values('TP05',N'Máy Đo E',5)
go
insert into ThietBi values('TT01',N'Máy Tính',5)




