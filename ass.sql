CREATE DATABASE ASS_QLTV
GO

USE ASS_QLTV
GO

CREATE TABLE SINHVIEN
(
MaSV varchar(10) not null primary key,
Hoten nvarchar(50) not null,
Ngayhehan date not null,
Chuyennganh nvarchar(50) not null,
Email varchar(50) not null,
SDT bigint not null,
)

CREATE TABLE LOAISACH
(
Maloaisach varchar(10) not null primary key,
Tenloaisach nvarchar(50) not null
)

CREATE TABLE SACH
(
Masach varchar(10) not null primary key,
Tensach nvarchar(50) not null,
Nxb nvarchar(50) not null,
Tacgia nvarchar(50) not null,
Sotrang int not null,
Soluongbansao int not null,
Giatien int not null,
Ngaynhap date not null,
Maloaisach varchar(10) foreign key references LOAISACH(Maloaisach)
)

CREATE TABLE PHIEUMUON
(
MaPM varchar(10) not null primary key,
Ngaymuon date not null,
Ngaytra date not null,
MaSV varchar(10) not null foreign key references SINHVIEN(MaSV),
Trangthai nvarchar(30) not null
)

CREATE TABLE CHITIETPM
(
MaPM varchar(10) not null foreign key references PHIEUMUON(MaPM),
Masach varchar(10) not null foreign key references SACH(Masach),
Ghichu nvarchar(50) not null
)

INSERT INTO SINHVIEN
VALUES
('PH40387', N'Nguyễn Hồng Ánh', '01/01/2025', N'Phát triển phần mềm', 'anhnhph40387@gmail.com', 0862282194),
('PH40388', N'Vũ Huy Hoàng', '01/01/2025', N'Lập Trình Web','hoangvh40388@gmail.com', 0862282195),
('PH40389', N'Nguyễn Mạnh Hà ', '01/01/2024', N'Phát triển phần mềm', 'hanmph30389@gmail.com', 0862282196),
('PH40390', N'Nguyễn Hữu Bình', '01/01/2024', N'Phát triển phần mềm', 'binhnhph40390@gmail.com', 0862282197),
('PH40391', N'Phan Huy', '01/01/2025', N'Phát triển phần mềm', 'huypvph40387@gmail.com', 0862282198)

insert into LOAISACH
VALUES
('IT', N'Công nghệ thông tin'),
('KT', N'Kinh tế'),
('KS', N'Khách sạn'),
('DL', N'Du lịch'),
('NN', N'Ngoại ngữ')

INSERT INTO SACH
VALUES
('S001', 'Nhập môn lập trình C', 'NXB FPT', 'Dennis Ritchie', 200, 100, 150000, '2010/12/10', 'IT'), 
('S002', ' Lập trình Java', 'NXB FPT', 'James Arthur Gosling ', 250, 150, 170000, '2017/01/01', 'IT'), 
('S003', 'Cơ sở dữ liệu SQL SEVER', 'NXB FPT', 'Microsoft', 100, 100, 160000, '2009/10/10', 'IT'), 
('S004', 'Lễ tân công cụ giao tiếp', 'NXB FPT', 'Louis Dussault', 200, 100, 150000, '2011/03/13', 'KS'), 
('S005', 'Bí kíp sử dụng khách sạn', 'NXB FPT', 'Bao Tri', 50, 100, 100000, '2014/05/19', 'KS'), 
('S006', 'Những Mảng Màu Du Lịch Việt Nam', 'NXB FPT', 'Phan Huy Xu', 200, 100, 110000, '2010/12/10', 'DL'), 
('S007', 'Cẩm Nang Du Lịch Văn Hóa Tâm Linh Việt Nam', 'NXB FPT', 'Nguyễn Trường Tân', 200, 100, 130000, '2015/08/21', 'DL'), 
('S008', 'Tiếng anh không khó', 'NXB FPT','GD', 200, 100, 150000, '2010/04/04', 'NN')

INSERT INTO PHIEUMUON
VALUES
('PM01','2021/02/02', '2021/02/09', 'PH40387', N'Đã trả'),
('PM02','2020/01/12', '2020/01/19', 'PH40387', N'Đã trả'),
('PM03','2019/09/02', '2019/09/09', 'PH40388', N'Chưa trả'),
('PM04','2017/08/21', '2017/08/14', 'PH40389', N'Đã trả'),
('PM05','2020/09/02', '2020/11/09', 'PH40388', N'Đã trả'),
('PM06','2018/04/04', '2018/04/11', 'PH40389', N'Chưa trả'),
('PM07','2022/07/08', '2022/07/15', 'PH40390',  N'Chưa trả'),
('PM08','2023/01/01', '2023/01/08', 'PH40391', N'Đã trả'),
('PM09','2020/06/27', '2020/06/04', 'PH40391', N'Chưa trả'),
('PM10','2021/02/02', '2021/02/09', 'PH40390', N'Đã trả')

INSERT INTO CHITIETPM
VALUES
('PM01', 'S001', N'Sách mới'),
('PM02', 'S002', N'Sách mới'),
('PM03', 'S003', N'Sách cũ'),
('PM04', 'S004', N'Sách mới'),
('PM05', 'S005', N'Sách mới'),
('PM06', 'S006', N'Sách cũ'),
('PM07', 'S007', N'Sách mới'),
('PM08', 'S008', N'Chưa trả'),
('PM09', 'S002', N'Sách cũ'),
('PM10', 'S003', N'Sách mới')

SELECT * FROM SINHVIEN
SELECT * FROM LOAISACH
SELECT * FROM SACH
SELECT * FROM PHIEUMUON
SELECT * FROM CHITIETPM


--6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả
--thuộc loại sách có mã “IT”.

SELECT Masach AS N'Mã sách', Tensach AS N'Tên sách', Giatien AS 'Giá Tiền', Tacgia AS N'Tác giả'  FROM SACH WHERE Maloaisach LIKE 'IT'

--6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã
--sinh viên có ngày mượn trong tháng 01/2017.

SELECT PM.MaPM AS N'Mã phiếu mượn', CT.Masach AS N'Mã sách', Ngaymuon AS N'Ngày mượn', MaSV AS N'Mã sinh viên' from PHIEUMUON AS PM join CHITIETPM AS CT ON PM.MaPM = CT.MaPM WHERE PM.Ngaymuon LIKE '2021-02%'

--6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày mượn sách.

SELECT *  FROM  PHIEUMUON where Trangthai like N'Chưa trả' order  by Ngaymuon

--6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số
--lượng sách mỗi loại).

SELECT S.Maloaisach, LS.Tenloaisach, COUNT(LS.Maloaisach) AS 'SỐ ĐẦU SÁCH'
FROM SACH as S
JOIN LOAISACH as LS
ON S.Maloaisach = LS.Maloaisach
GROUP BY S.Maloaisach, LS.Tenloaisach

--6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.

SELECT MaSV, COUNT(MaSV) AS 'SỐ LƯỢNG MƯỢN' 
FROM PHIEUMUON
GROUP BY MaSV

--6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”.

SELECT * FROM SACH
WHERE Tensach LIKE N'%SQL%'

--6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã
--phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.

SELECT SV.Masv, Hoten, PM.MaPM, S.Tensach, NgayMuon, NgayTra
FROM SINHVIEN as SV
JOIN PHIEUMUON as PM
ON SV.Masv = PM.MaSV
JOIN CHITIETPM as CT
ON CT.MaPM = PM.MaPM
JOIN SACH as S
ON S.MaSach = CT.Masach
ORDER BY Ngaymuon

--6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm
--2014 giảm 30%.

UPDATE SACH SET Giatien = Giatien - Giatien*0.3
WHERE YEAR(Ngaynhap) < '2014'
SELECT Tensach, Giatien, Ngaynhap FROM SACH

--10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã
--sinh viên PD12301 (ví dụ).

UPDATE PHIEUMUON SET Trangthai = N'Đã trả'
WHERE MaSV = 'PH40389'
SELECT MaPM, MaSV, Trangthai FROM PHIEUMUON


--6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn,
--tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.
SELECT PM.MaPM, Hoten, Email, NgayMuon  
FROM PHIEUMUON AS PM
JOIN SINHVIEN AS SV
 ON PM.MaSV = SV.MaSV WHERE PM.Trangthai LIKE '%Chưa trả%'

 --6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước „1/1/2010‟
DELETE PHIEUMUON	
WHERE Ngaymuon <'2019-09-09'
SELECT Ngaymuon FROM PHIEUMUON