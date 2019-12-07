create database DAMH
go
use DAMH
go
SET DATEFORMAT dmy;
go
create table Khoa
(
	MaKhoa nchar(10) not null primary key,
	TenKhoa nvarchar(50) unique
)
go
create table Lop
(
	Malop nchar(10) not null primary key,
	TenLop nvarchar(50) unique,
	MaKhoa nchar(10) not null
)
go
create table GVHD
(
	MaGVHD nchar(10) primary key,
	TenGVHD nvarchar(50) not NULL
)
go
create table DeAn
(
	MaDA nchar(10) not null primary key,
	TenDA nvarchar(250) unique,
	MaGVHD nchar(10) not null
)
go
create table NhomSV
(
	MaNhom nchar(10) not null primary key,
	TenNhom nvarchar(50) unique,
	MaDA nchar(10) not null
)
create table SinhVien
(
	MaSV nchar(10) not null primary key,
	TenSV nvarchar(50),
	NgaySinh date,
	HocKy int,
	NamHoc int,
	MaNhom nchar(10) not null,
	MaLop nchar(10) not null
)
go
create table NhanVien
(
	MaNV nchar(10) not null primary key,
	TenNV nvarchar(50)
)
go
create table Loai_TN
(
	MaloaiTN nchar(10) not null primary key,
	TenLoai nvarchar(50) unique
)
go
create table PhongThiNghiem
(
	MaPTN nchar(10) not null primary key,
	TenPTN nvarchar(50) unique
)
go
create table Buoi
(
	MaBuoi nchar(10) not null primary key,
	Mota nvarchar(50),
	Tiet nvarchar(50) unique,
)
go
create table ThietBi
(
	MaTB nchar(10) not null primary key,
	TenTB nvarchar(50) unique,
	SoLuong_TB int check(SoLuong_TB > 0)
)
go
create table HoaChat
(
	MaHC nchar(10) primary key,
	TenHC nvarchar(50) unique,
	SoLuong_HC int check(SoLuong_HC > 0)
)
go
create table DungCu
(
	MaDC nchar(10) not null primary key,
	TenDC nvarchar(50) unique,
	SoLuong_DC int check(SoLuong_DC > 0)
)
go
	create table DK_HCDC
	(
		MaDK_HCDC nchar(10) not null primary key,
		MaNhom nchar(10) not null,
		MaNV nchar(10) not null
	)
go
	create table DK_DungCu
	(
		MaDK_HCDC nchar(10) not null,
		MaDC nchar(10) not null,
		SoLuong_DKDC int check(SoLuong_DKDC > 0),
		constraint pk_DKDC primary key (MaDK_HCDC,MaDC)
	)
go
	create table DK_HoaChat
	(
		MaDK_HCDC nchar(10) not null,
		MaHC nchar(10) not null,
		SoLuong_DKHC int check(SoLuong_DKHC > 0),
		constraint pk_DKHC primary key (MaDK_HCDC,MaHC)
	)
go
	create table DK_PTN
	(
		NgayDK date not null check(getdate() < NgayDK),
		MaBuoi nchar(10) not null,
		MaNhom nchar(10) not null,
		MaNV nchar(10) not null,
		MaloaiTN nchar(10) not null,
		MaPTN nchar(10) not null,
		MaTB nchar(10) not null,
		SoLuong_DKTB int check(SoLuong_DKTB > 0),
		constraint pk_DK_PTN primary key (NgayDK,MaBuoi,MaNhom,MaloaiTN,MaPTN,MaTB)
	)
go
create table DangNhap
(
	MaNV nchar(10) primary key,
	MatKhau nchar(20)
)
/**************************************************************/
/*                         Khóa Ngoại                         */
/**************************************************************/

go
	alter table Lop
add  constraint Lop_Khoa foreign key (MaKhoa) references Khoa(MaKhoa)

go
	alter table DeAn
add  constraint DeAn_GVHD foreign key (MaGVHD) references GVHD(MaGVHD)

go
	alter table NhomSV
add  constraint DA_Nhom foreign key (MaDA) references DeAn(MaDA)

go
	alter table SinhVien
add  constraint SV_Lop foreign key (MaLop) references Lop(MaLop)

go
	alter table SinhVien
add  constraint SV_Nhom foreign key (MaNhom) references NhomSV(MaNhom)

go
	alter table DK_PTN
add  constraint DKPTN_Nhom foreign key (MaNhom) references NhomSV(MaNhom)

go
	alter table DK_PTN
add  constraint DKPTN_Buoi foreign key (MaBuoi) references Buoi(MaBuoi)

go
	alter table DK_PTN
add  constraint DKPTN_TB foreign key (MaTB) references ThietBi(MaTB)

go
	alter table DK_PTN
add  constraint DKPTN_PTN foreign key (MaPTN) references PhongThiNghiem(MaPTN)

go
	alter table DK_PTN
add  constraint DKPTN_LoaiTN foreign key (MaLoaiTN) references Loai_TN(MaLoaiTN)

go
	alter table DK_PTN
add  constraint DKPTN_NVQL foreign key (MaNV) references NhanVien(MaNV)

go
	alter table DK_HCDC
add  constraint DK_HCDC_NVQL foreign key (MaNV) references NhanVien(MaNV)

go
	alter table DK_HCDC
add  constraint DK_HCDC_Nhom foreign key (MaNhom) references NhomSV(MaNhom)

go
	alter table DK_DungCu
add constraint DKDungCu_DungCu foreign key (MaDC) references DungCu(MaDC)

go
	alter table DK_DungCu
add constraint DKDungCu_DK_HCDC foreign key (MaDK_HCDC) references DK_HCDC(MaDK_HCDC)

go
	alter table DK_HoaChat
add constraint DKHoaChat_HoaChat foreign key (MaHC) references HoaChat(MaHC)

go
	alter table DK_HoaChat
add constraint DKHoaChat_DK_HCDC foreign key (MaDK_HCDC) references DK_HCDC(MaDK_HCDC)
go
alter table DangNhap
add constraint DangNhap_NhanVien foreign key (MaNV) references NhanVien(MaNV)
/**************************************************************/
/*                         Thủ tục                            */
/**************************************************************/
go
	create procedure ThemSV
		(@ma nchar(10),
		@ten nvarchar(10),
		@sinh date,
		@hocky int,
		@namhoc int,
		@nhom nchar(10),
		@lop nchar(10))
	as
	begin
		if ((select count(*)
		from SinhVien
		where MaNhom=@nhom)>=2)
		rollback tran;
	else
		insert into SinhVien
		values(@ma, @ten, @sinh, @hocky, @namhoc, @nhom, @lop);
	end;
go
	create procedure DKPTN
		(@Ngaydk date,
		@Buoi nchar(10),
		@nhom nchar(10),
		@GVQL nchar(10),
		@loaiTN nchar(10),
		@ptn nchar(10),
		@Tb nchar(10),
		@SL int)
	as
	begin
		if ((select count(*)
		from DK_PTN
		where NgayDK=@Ngaydk and MaNhom=@nhom and MaBuoi=@Buoi) >= 1)
		rollback tran;
	else if (select count(*)
		from DK_PTN
		where MaPTN = @ptn and NgayDK=@Ngaydk and MaBuoi=@Buoi) >= 4
		rollback tran;
	else
		insert into DK_PTN
		values(@Ngaydk, @Buoi, @nhom, @GVQL, @loaiTN, @ptn, @tb, @SL);
	end;
/**************************************************************/
/*                           TRIGGER                          */
/**************************************************************/

go
CREATE TRIGGER trg_PhanTB on DK_PTN after insert AS
BEGIN
	if ((select SoLuong_DKTB from inserted,ThietBi where inserted.MaTB = ThietBi.MaTB) >= (select SoLuong_TB from ThietBi,inserted where ThietBi.MaTB=inserted.MaTB))
	begin
		print 'Kho không đủ !'
		rollback tran
	end
	update ThietBi
	set ThietBi.SoLuong_TB = ThietBi.SoLuong_TB - (select SoLuong_DKTB
	from inserted
	where MaTB = ThietBi.MaTB)
	WHERE ThietBi.MaTB = (select MaTB from inserted)
end

go
CREATE TRIGGER trg_updateTB on DK_PTN for update AS
BEGIN
	if ((select SoLuong_DKTB from inserted,ThietBi where inserted.MaTB = ThietBi.MaTB) >= ((select SoLuong_TB from inserted,ThietBi where inserted.MaTB = ThietBi.MaTB)+(select SoLuong_DKTB from ThietBi,deleted where deleted.MaTB = ThietBi.MaTB)))
	begin	
		print N'Kho không đủ !'
		rollback tran
	end
	update ThietBi
	set ThietBi.SoLuong_TB = ThietBi.SoLuong_TB + (select SoLuong_DKTB
	from deleted
	where MaTB = ThietBi.MaTB) - (select SoLuong_DKTB
	from inserted
	where MaTB = ThietBi.MaTB)
	WHERE ThietBi.MaTB = (select MaTB from deleted) and ThietBi.MaTB = (select MaTB from inserted)
end

go
CREATE TRIGGER trg_HuyPhanTB on DK_PTN after delete AS
BEGIN
	update ThietBi
	set ThietBi.SoLuong_TB = ThietBi.SoLuong_TB + (select SoLuong_DKTB
	from deleted
	where MaTB = ThietBi.MaTB)
	WHERE ThietBi.MaTB = (select MaTB from deleted)
end

go
CREATE TRIGGER trg_PhanDC on DK_DungCu after insert AS
BEGIN
	if ((select SoLuong_DKDC from inserted,DungCu where inserted.MaDC = DungCu.MaDC) >= (select SoLuong_DC from DungCu,inserted where inserted.MaDC = DungCu.MaDC))
	begin
		print N'Kho không đủ !'
		rollback tran
	end
	update DungCu
	set DungCu.SoLuong_DC = DungCu.SoLuong_DC - (select SoLuong_DKDC
	from inserted
	where MaDC = DungCu.MaDC)
	WHERE DungCu.MaDC = (select MaDC from inserted)
end

go
CREATE TRIGGER trg_updateDC on DK_DungCu for update AS
BEGIN
	if ((select SoLuong_DKDC from inserted,DungCu where inserted.MaDC = DungCu.MaDC) >= ((select SoLuong_DC from DungCu,inserted where inserted.MaDC = DungCu.MaDC)+(select SoLuong_DKDC from DungCu,deleted where deleted.MaDC = DungCu.MaDC)))
	begin
		print N'Kho không đủ !'
		rollback tran
	end
	update DungCu
	set DungCu.SoLuong_DC = DungCu.SoLuong_DC + (select SoLuong_DKDC
	from deleted
	where MaDC = DungCu.MaDC) - (select SoLuong_DKDC
	from inserted
	where MaDC = DungCu.MaDC)
	WHERE DungCu.MaDC = (select MaDC from deleted) and DungCu.MaDC = (select MaDC from inserted)	
end

go
CREATE TRIGGER trg_HuyPhanDC on DK_DungCu after delete AS
BEGIN
	update DungCu
	set DungCu.SoLuong_DC = DungCu.SoLuong_DC + (select SoLuong_DKDC
	from deleted
	where MaDC = DungCu.MaDC)
	WHERE DungCu.MaDC = (select MaDC from deleted)
end

go
CREATE TRIGGER trg_PhanHC on DK_HoaChat after insert AS
BEGIN
if ((select SoLuong_DKHC from inserted,HoaChat where inserted.MaHC = HoaChat.MaHC) >= (select SoLuong_HC from HoaChat,inserted where inserted.MaHC = HoaChat.MaHC))
	begin
		print N'Kho không đủ !'
		rollback tran
	end
	update HoaChat
	set HoaChat.SoLuong_HC = HoaChat.SoLuong_HC - (select SoLuong_DKHC
	from inserted
	where MaHC = HoaChat.MaHC)
	WHERE HoaChat.MaHC = (select MaHC from inserted)
end

go
CREATE TRIGGER trg_updateHC on DK_HoaChat for update AS
BEGIN
	if ((select SoLuong_DKHC from inserted,HoaChat where inserted.MaHC = HoaChat.MaHC) >= ((select SoLuong_HC from HoaChat,inserted where inserted.MaHC=HoaChat.MaHC)+(select SoLuong_DKHC from HoaChat,deleted where deleted.MaHC = HoaChat.MaHC)))
	begin
		print N'Kho không đủ !'
		rollback tran
	end
	update HoaChat
	set HoaChat.SoLuong_HC = HoaChat.SoLuong_HC + (select SoLuong_DKHC
	from deleted
	where MaHC = HoaChat.MaHC) - (select SoLuong_DKHC
	from inserted
	where MaHC = HoaChat.MaHC)
	WHERE HoaChat.MaHC = (select MaHC from deleted) and HoaChat.MaHC = (select MaHC from inserted)	
end

go
CREATE TRIGGER trg_HuyPhanHC on DK_HoaChat after delete AS
BEGIN
	update HoaChat
	set HoaChat.SoLuong_HC = HoaChat.SoLuong_HC + (select SoLuong_DKHC
	from deleted
	where MaHC = HoaChat.MaHC)
	WHERE HoaChat.MaHC = (select MaHC from deleted)
end
/**************************************************************/
/*                        Phân quyền                          */
/**************************************************************/

--go
--	create login NVQL01 with password = 'sa2017',
--default_database  = DAMH
--	use DAMH
--	create user NVQL01 for login gvql
--go
--	grant select on Buoi to NVQL01
--go
--	grant select on Loai_TN to NVQL01
--go
--	grant insert,select,delete,update on DK_PTN to NVQL01
--go
--	grant select on PhongThiNghiem to NVQL01
--go
--	grant select on Khoa to NVQL01
--go
--	grant insert,select,delete,update on HoaChat to NVQL01
--go
--	grant insert,select,delete,update on DK_HoaChat to NVQL01
--go
--	grant insert,select,delete,update on DungCu to NVQL01
--go
--	grant insert,select,delete,update on DK_DungCu to NVQL01
--go
--	grant select on NhanVien to NVQL01
--go
--	grant select on Lop to NVQL01
--go
--	grant select on SinhVien to NVQL01
--go
--	grant select on GVHD to NVQL01
--go
--	grant insert,select,delete,update on NhomSV to NVQL01
--go
--	grant select,delete,update on DeAn to NVQL01
--go
--	grant insert,select,delete,update on ThietBi to NVQL01
--go
--	grant execute on DKPTN to NVQL01

/**/

--go
--	create login NVQL02 with password = 'sa2017',
--default_database  = DAMH
--	use DAMH
--	create user NVQL02 for login gvql
--go
--	grant select on Buoi to NVQL02
--go
--	grant select on Loai_TN to NVQL02
--go
--	grant insert,select,delete,update on DK_PTN to NVQL02
--go
--	grant select on PhongThiNghiem to NVQL02
--go
--	grant select on Khoa to NVQL02
--go
--	grant insert,select,delete,update on HoaChat to NVQL02
--go
--	grant insert,select,delete,update on DK_HoaChat to NVQL02
--go
--	grant insert,select,delete,update on DungCu to NVQL02
--go
--	grant insert,select,delete,update on DK_DungCu to NVQL02
--go
--	grant select on NhanVien to NVQL02
--go
--	grant select on Lop to NVQL02
--go
--	grant select on SinhVien to NVQL02
--go
--	grant select on GVHD to NVQL02
--go
--	grant insert,select,delete,update on NhomSV to NVQL02
--go
--	grant select,delete,update on DeAn to NVQL02
--go
--	grant insert,select,delete,update on ThietBi to NVQL02
--go
--	grant execute on DKPTN to NVQL02

/**************************************************************/
/*                         Dữ Liệu                            */
/**************************************************************/

go
	insert into Khoa
	values(N'CKDT', N'Cơ khí điện tử');
go
	insert into Khoa
	values(N'CNTP', N'Công nghệ thực phẩm');
go
	insert into Khoa
	values(N'CNHC', N'Công nghệ Hóa Chất');
go
	insert into Khoa
	values(N'CNSH', N'Công nghệ Sinh học');
go
	insert into lop
	values('CNTP01', N'Thực phẩm 01', 'CNTP')
go
	insert into lop
	values('CNTP02', N'Thực phẩm 02', 'CNTP')
go
	insert into lop
	values('CNTP03', N'Thực phẩm 03', 'CNTP')
go
	insert into lop
	values('CNHC01', N'Hóa Chất 01', 'CNTP')
go
	insert into lop
	values('CNHC02', N'Hóa Chất 02', 'CNTP')
go
	insert into GVHD
	values('GVHD01', N'Đinh Thị Mận');
go
	insert into GVHD
	values('GVHD02', N'Hoàng Văn Thụ');
go
	insert into GVHD
	values('GVHD03', N'Nguyện Hoài Hoa');
go
	insert into GVHD
	values('GVHD04', N'Hoa Định Thần');
go
	insert into GVHD
	values('GVHD05', N'Tâm Tướng Thiện');
go
	insert into DeAn
	values('DA01', N'Nghiên cứu thu nhận bột màu thực phẩm từ cây chùm ngây', 'GVHD01');
go
	insert into DeAn
	values('DA02', N'Đánh giá sự ổn định chất lượng bia lon Sài Gòn về chỉ tiêu cảm quan', 'GVHD01');
go
	insert into DeAn
	values('DA03', N'Đánh giá sự ổn định chất lượng bia lon Sài Gòn về chỉ tiêu hóa lý', 'GVHD02');
go
	insert into DeAn
	values('DA04', N'Nghiên cứu sản xuất sản phẩm cà phê nấm linh chi', 'GVHD02');
go
	insert into DeAn
	values('DA05', N'Nghiên cứu sản xuất sản phẩm khô cá mối tẩm cốm xanh ăn liền', 'GVHD03');
go
	insert into DeAn
	values('DA06', N'Nghiên cứu công nghệ sản xuất bột chanh gia vị', 'GVHD03');
go
	insert into DeAn
	values('DA07', N'Nghiên cứu quy trình công nghệ sản  xuất sữa bí đỏ', 'GVHD04');
go
	insert into DeAn
	values('DA08', N'Nghiên cứu quy trình công nghệ sản xuất nước uống từ vỏ cà phê', 'GVHD04');
go
	insert into DeAn
	values('DA09', N'Nghiên cứu quy trình sản xuất chà bông gà', 'GVHD05');
go
	insert into DeAn
	values('DA10', N'Nghiên cứu quy trình sản xuất Jambon heo', 'GVHD05');
go
	insert into NhomSV
	values(N'TP02', N'Công nghệ thực phẩm 02', 'DA02');
go
	insert into NhomSV
	values(N'TP03', N'Công nghệ thực phẩm 03', 'DA03');
go
	insert into NhomSV
	values(N'TP04', N'Công nghệ thực phẩm 04', 'DA04');
go
	insert into NhomSV
	values(N'TP05', N'Công nghệ thực phẩm 05', 'DA05');
go
	insert into NhomSV
	values(N'TP06', N'Công nghệ thực phẩm 06', 'DA06');
go
	insert into NhomSV
	values(N'TP07', N'Công nghệ thực phẩm 07', 'DA07');
go
	insert into NhomSV
	values(N'TP08', N'Công nghệ thực phẩm 08', 'DA08');
go
	insert into NhomSV
	values(N'TP09', N'Công nghệ thực phẩm 09', 'DA03');
go
	insert into NhomSV
	values(N'TP10', N'Công nghệ thực phẩm 10', 'DA10');
go
	insert into NhomSV
	values(N'TP01', N'Công nghệ thực phẩm 01', 'DA01');
go
	insert into SinhVien
	values('2001160180', N'Minh Khai Hoa', '23/6/1998', 7, 2019, 'TP10', 'CNTP01');
go
	insert into SinhVien
	values('2001150120', N'Linh Thị Hoa', '12/2/1998', 7, 2019, 'TP10', 'CNTP01');
go
	insert into SinhVien
	values('2001160220', N'Bông Thị Cúc', '2/1/1998', 7, 2019, 'TP10', 'CNTP01');
go
	insert into SinhVien
	values('2001162150', N'Minh Ngộ Lý', '3/6/1998', 7, 2019, 'TP01', 'CNTP01');
go
	insert into SinhVien
	values('2001160080', N'Kinh Tại Tây', '11/6/1998', 7, 2019, 'TP02', 'CNTP02');
go
	insert into SinhVien
	values('2001160188', N'Kinh Hà Giang', '7/4/1998', 7, 2019, 'TP02', 'CNTP02');
go
	insert into SinhVien
	values('2001160178', N'Thủy Ngậm Tự', '1/6/1998', 7, 2019, 'TP03', 'CNTP02');
go
	insert into SinhVien
	values('2001160191', N'Tự Từ Hối', '22/6/1998', 7, 2019, 'TP03', 'CNTP02');
go
	insert into SinhVien
	values('2001160345', N'Hối Vô Phương', '24/5/1998', 7, 2019, 'TP04', 'CNTP01');
go
	insert into SinhVien
	values('2001160678', N'Phương Tái Ngẫm', '25/1/1998', 7, 2019, 'TP04', 'CNTP01');
go
	insert into SinhVien
	values('2001160985', N'Ngẫm Vô Nghĩ', '11/12/1998', 7, 2019, 'TP05', 'CNTP01');
go
	insert into SinhVien
	values('2001163557', N'Nghĩ Tức Thông', '1/10/1998', 7, 2019, 'TP05', 'CNTP01');
go
	insert into SinhVien
	values('2001163537', N'A B C', '20/11/1998', 7, 2019, 'TP06', 'CNTP01');
go
	insert into SinhVien
	values('2001163337', N'C S D', '3/1/1998', 7, 2019, 'TP06', 'CNTP02');
go
	insert into SinhVien
	values('2001161227', N'O A B', '3/3/1998', 7, 2019, 'TP07', 'CNTP02');
go
	insert into SinhVien
	values('2001161217', N'L O H', '10/3/1998', 7, 2019, 'TP07', 'CNTP01');
go
	insert into SinhVien
	values('2001161117', N'U I O', '4/1/1998', 7, 2019, 'TP08', 'CNTP02');
go
	insert into SinhVien
	values('2001162227', N'A W E', '1/4/1998', 7, 2019, 'TP08', 'CNTP01');
go
	insert into SinhVien
	values('2001162147', N'Q E D', '5/6/1998', 7, 2019, 'TP09', 'CNTP01');
go
	insert into SinhVien
	values('2001160777', N'Y I K', '12/5/1998', 7, 2019, 'TP09', 'CNTP02');
go
	insert into DungCu
	values('DC01', N'Bình tam giác nút mài', 100)
go
	insert into DungCu
	values('DC02', N'Bình tam giác', 100)
go
	insert into DungCu
	values('DC03', N'Ống nghiệm có nắp', 100)
go
	insert into DungCu
	values('DC04', N'Ống nghiệm có nhánh', 100)
go
	insert into DungCu
	values('DC05', N'Ống nghiệm chịu nhiệt ', 100)
go
	insert into DungCu
	values('DC06', N'Ống sinh hàn thẳng ', 100)
go
	insert into DungCu
	values('DC07', N'Ống nghiệm đáy bằng', 100)
go
	insert into DungCu
	values('DC08', N'Ống thủy tinh U', 100)
go
	insert into DungCu
	values('DC09', N'Ống nghiệm ', 100)
go
	insert into DungCu
	values('DC10', N'Bộ cất cồn', 100)
go
	insert into DungCu
	values('DC11', N'Bộ cất đạm', 100)
go
	insert into DungCu
	values('DC12', N'Pipet bầu', 100)
go
	insert into DungCu
	values('DC13', N'Pipet chữ V', 100)
go
	insert into DungCu
	values('DC14', N'Phễu chiết', 100)
go
	insert into DungCu
	values('DC15', N'Phễu thủy tinh', 100)
go
	insert into DungCu
	values('DC16', N'Rây inox lỗ', 100)
go
	insert into DungCu
	values('DC17', N'Rây inox lỗ 0.5', 100)
go
	insert into DungCu
	values('DC18', N'Bếp đun bình cầu', 100)
go
	insert into DungCu
	values('DC19', N'Lò nướng', 100)
go
	insert into DungCu
	values('DC20', N'Máy đánh trứng', 100)
go
	insert into ThietBi
	values('TB01', N'Van góc phải vô khuẩn', 10)
go
	insert into ThietBi
	values('TB02', N'Van thử nồng độ vô khuẩn loại N7', 10)
go
	insert into ThietBi
	values('TB03', N'Van thử nồng độ vô khuẩn loại N13', 10)
go
	insert into ThietBi
	values('TB04', N'Van thử nồng độ vệ sinh loại N1', 10)
go
	insert into ThietBi
	values('TB05', N'Van đóng đôi loại N4', 10)
go
	insert into ThietBi
	values('TB06', N'Nhiệt kế điện tử ', 10)
go
	insert into ThietBi
	values('TB07', N'Thiết bị ly tâm tách chất béo', 10)
go
	insert into ThietBi
	values('TB08', N'Tủ sấy chân không', 10)
go
	insert into ThietBi
	values('TB09', N'Brix kế  0-32', 10)
go
	insert into ThietBi
	values('TB10', N'Dụng cụ đo pH cầm tay', 10)
go
	insert into ThietBi
	values('TB11', N'Hệ thống phá mẫu Kjeldahl và xử lý khí độc', 10)
go
	insert into ThietBi
	values('TB12', N'Hệ thống thiết bị xưởng bia ', 10)
go
	insert into ThietBi
	values('TB13', N'Kính hiển vi sinh học, hai mắt', 10)
go
	insert into ThietBi
	values('TB14', N'Máy lắc ống nghiệm', 10)
go
	insert into ThietBi
	values('TB15', N'Máy làm kem tươi', 10)
go
	insert into ThietBi
	values('TB16', N'Máy li tâm ống', 10)
go
	insert into ThietBi
	values('TB17', N'Bộ cất cồn áp suất thấp', 10)
go
	insert into ThietBi
	values('TB18', N'WLL180T', 10)
go
	insert into ThietBi
	values('TB19', N'Máy đồng hóa', 10)
go
	insert into ThietBi
	values('TB20', N'Máy quang phổ khả biến', 10)
go
	insert into HoaChat
	values('HC01', N'Ống chuẩn Hydrochloric acid 0.1N', 100);
go
	insert into HoaChat
	values('HC08', N'Ống chuẩn Oxalic acid 0.1 N', 100);
go
	insert into HoaChat
	values('HC02', N'Ống chuẩn Potassium dichromate 0.1N ', 100);
go
	insert into HoaChat
	values('HC03', N'Ống chuẩn Potassium permanganeseate 0.1N', 100);
go
	insert into HoaChat
	values('HC04', N'Ống chuẩn silver nitrate 0.1N', 100);
go
	insert into HoaChat
	values('HC05', N'Ống chuẩn Sodium hydroxide 0.1N ', 100);
go
	insert into HoaChat
	values('HC06', N'Ống chuẩn Sodium thiosulfate 0.01N', 100);
go
	insert into HoaChat
	values('HC07', N'Ống chuẩn Sodium thiosulfate 0.1N', 100);
go
	insert into HoaChat
	values('HC09', N'Ống đựng mẫu có nắp Vial (màu trắng)', 100);
go
	insert into HoaChat
	values('HC10', N'Ống đựng mẫu có nắp Vial (màu đỏ)', 100);
go
	insert into NhanVien
	values('NVQL01', N'Đinh Hoài Mẫn')
go
	insert into NhanVien
	values('NVQL02', N'Trần Thu Hà')
go
	insert into DK_HCDC
	values('HCDC01', 'TP01', 'NVQL01');
go
	insert into DK_HCDC
	values('HCDC02', 'TP01', 'NVQL01');
go
	insert into DK_HCDC
	values('HCDC03', 'TP02', 'NVQL02');
go
	insert into DK_HCDC
	values('HCDC04', 'TP02', 'NVQL02');
go
	insert into DK_HCDC
	values('HCDC05', 'TP02', 'NVQL02');
go
	insert into DK_HCDC
	values('HCDC06', 'TP03', 'NVQL01');
go
	insert into DK_HCDC
	values('HCDC07', 'TP04', 'NVQL01');
go
	insert into DK_HCDC
	values('HCDC08', 'TP04', 'NVQL02');
go
	insert into DK_HCDC
	values('HCDC09', 'TP05', 'NVQL01');
go
	insert into DK_HCDC
	values('HCDC10', 'TP05', 'NVQL02');
go
	insert into DK_HCDC
	values('HCDC11', 'TP06', 'NVQL01');
go
	insert into DK_HCDC
	values('HCDC12', 'TP06', 'NVQL01');
go
	insert into DK_HCDC
	values('HCDC13', 'TP07', 'NVQL02');
go
	insert into DK_HCDC
	values('HCDC14', 'TP07', 'NVQL02');
go
	insert into DK_HCDC
	values('HCDC15', 'TP08', 'NVQL02');
go
	insert into DK_HCDC
	values('HCDC16', 'TP08', 'NVQL01');
go
	insert into DK_HCDC
	values('HCDC17', 'TP09', 'NVQL02');
go
	insert into DK_HCDC
	values('HCDC18', 'TP10', 'NVQL02');
go
	insert into DK_HCDC
	values('HCDC19', 'TP10', 'NVQL01');
go
	insert into DK_HCDC
	values('HCDC20', 'TP10', 'NVQL02');
go
	insert into DK_DungCu
	values('HCDC01', 'DC01', 5);
go
	insert into DK_DungCu
	values('HCDC02', 'DC05', 5);
go
	insert into DK_DungCu
	values('HCDC03', 'DC04', 5);
go
	insert into DK_DungCu
	values('HCDC04', 'DC09', 5);
go
	insert into DK_DungCu
	values('HCDC05', 'DC11', 5);
go
	insert into DK_DungCu
	values('HCDC06', 'DC10', 5);
go
	insert into DK_DungCu
	values('HCDC07', 'DC20', 5);
go
	insert into DK_DungCu
	values('HCDC08', 'DC17', 5);
go
	insert into DK_DungCu
	values('HCDC09', 'DC14', 5);
go
	insert into DK_DungCu
	values('HCDC10', 'DC05', 5);
go
	insert into DK_DungCu
	values('HCDC01', 'DC06', 5);
go
	insert into DK_HoaChat
	values('HCDC01', 'HC01', 5);
go
	insert into DK_HoaChat
	values('HCDC02', 'HC05', 5);
go
	insert into DK_HoaChat
	values('HCDC03', 'HC04', 5);
go
	insert into DK_HoaChat
	values('HCDC04', 'HC09', 5);
go
	insert into DK_HoaChat
	values('HCDC05', 'HC01', 5);
go
	insert into DK_HoaChat
	values('HCDC06', 'HC10', 5);
go
	insert into DK_HoaChat
	values('HCDC07', 'HC02', 5);
go
	insert into DK_HoaChat
	values('HCDC08', 'HC07', 5);
go
	insert into DK_HoaChat
	values('HCDC09', 'HC04', 5);
go
	insert into DK_HoaChat
	values('HCDC10', 'HC05', 5);
go
	insert into DK_HoaChat
	values('HCDC01', 'HC06', 5);
go
	insert into Loai_TN
	values('TNTH', N'Thực hành thí nghiệm');
go
	insert into Loai_TN
	values('THTH', N'Tập Huấn thí nghiệm');
go
	insert into Buoi
	values('B1', N'Sáng', N'ca 1');
go
	insert into Buoi
	values('B2', N'Chiều', N'ca 2');
go
	insert into Buoi
	values('B3', N'Tối', N'cả');
go
	insert into PhongThiNghiem
	values('PTN01', N'Phòng thí nghiệm 01');
go
	insert into PhongThiNghiem
	values('PTN02', N'Phòng thí nghiệm 02');
go
	insert into PhongThiNghiem
	values('PTN03', N'Phòng thí nghiệm 03');
go
	exec DKPTN '1/1/2020','B1','TP01','NVQL01','TNTH','PTN01','TB01',2;
go
	exec DKPTN '1/1/2020','B1','TP02','NVQL01','TNTH','PTN01','TB04',2;
go
	exec DKPTN '1/1/2020','B1','TP03','NVQL01','TNTH','PTN01','TB10',2;
go
	exec DKPTN '1/1/2020','B1','TP04','NVQL01','THTH','PTN01','TB05',2;
go
	exec DKPTN '1/1/2020','B1','TP05','NVQL01','TNTH','PTN02','TB08',2;
go
	exec DKPTN '1/1/2020','B2','TP06','NVQL01','THTH','PTN01','TB07',2;
go
	exec DKPTN '2/1/2020','B1','TP02','NVQL01','TNTH','PTN02','TB01',2;
go
	exec DKPTN '2/1/2020','B2','TP07','NVQL01','TNTH','PTN01','TB02',2;
go
	exec DKPTN '3/1/2020','B1','TP08','NVQL01','TNTH','PTN01','TB04',2;
go
	exec DKPTN '4/1/2020','B1','TP09','NVQL01','THTH','PTN01','TB04',2;
go
	exec DKPTN '4/1/2020','B1','TP10','NVQL01','THTH','PTN01','TB03',2;
go
insert into DangNhap values('NVQL01','sa2017');
go
insert into DangNhap values('NVQL02','sa2017');