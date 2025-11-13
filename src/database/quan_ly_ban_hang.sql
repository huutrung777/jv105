create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;
create table taikhoan (
    matk int auto_increment primary key,
    tendangnhap varchar(50) unique not null,
    matkhau varchar(255) not null,
    vaitro enum('admin', 'quanly', 'nhanvien', 'khachhang'),
    trangthai boolean default true
);

create table nguoidung (
    mand int auto_increment primary key,
    matk int not null,
    hoten varchar(100) not null,
    email varchar(100) unique,
    sodienthoai varchar(15),
    gioitinh enum('nam', 'nu', 'khac'),
    ngaysinh date,
    foreign key (matk) references taikhoan(matk) on delete cascade
);

create table diachi (
    madiachi int auto_increment primary key,
    mand int not null,
    diachi varchar(255) not null,
    phuongxa varchar(100),
    quanhuyen varchar(100),
    tinhthanh varchar(100),
    macdinh boolean default false,
    foreign key (mand) references nguoidung(mand) on delete cascade
);
create table danhmuc (
    madm int auto_increment primary key,
    tendm varchar(100) not null,
    mota text
);

create table sanpham (
    masp int auto_increment primary key,
    madm int not null,
    tensp varchar(150) not null,
    mota text,
    gia decimal(12,2) not null,
    soluong int default 0,
    trangthai enum('conhang', 'hethang', 'ngungkinhdoanh') default 'conhang',
    foreign key (madm) references danhmuc(madm) on delete cascade
);
create table hinhanh_sanpham (
    mahinh int auto_increment primary key,
    masp int not null,
    duongdan varchar(255) not null,
    foreign key (masp) references sanpham(masp) on delete cascade
);
create table thuoctinh_sanpham (
    mathuoctinh int auto_increment primary key,
    masp int not null,
    tenthuoctinh varchar(100) not null,
    giatri varchar(100),
    foreign key (masp) references sanpham(masp) on delete cascade
);

create table giohang (
    magiohang int auto_increment primary key,
    mand int not null,
    ngaycapnhat datetime default current_timestamp,
    foreign key (mand) references nguoidung(mand) on delete cascade
);

create table chitiet_giohang (
    mactgh int auto_increment primary key,
    magiohang int not null,
    masp int not null,
    soluong int default 1,
    foreign key (magiohang) references giohang(magiohang) on delete cascade,
    foreign key (masp) references sanpham(masp)
);
create table donhang (
    madh int auto_increment primary key,
    mand int not null,
    ngaydat datetime default current_timestamp,
    trangthai enum('choxacnhan', 'danggiao', 'hoanthanh', 'dahuy') default 'choxacnhan',
    tongtien decimal(12,2),
    diachigiaohang varchar(255),
    foreign key (mand) references nguoidung(mand) on delete cascade
);

create table chitiet_donhang (
    mactdh int auto_increment primary key,
    madh int not null,
    masp int not null,
    soluong int not null,
    dongia decimal(12,2) not null,
    foreign key (madh) references donhang(madh) on delete cascade,
    foreign key (masp) references sanpham(masp)
);

create table thanhtoan (
    matt int auto_increment primary key,
    madh int not null,
    phuongthuc enum('tienmat', 'chuyenkhoan', 'vidientu') default 'tienmat',
    sotien decimal(12,2) not null,
    ngaythanhtoan datetime default current_timestamp,
    trangthai enum('thanhcong', 'thatbai', 'choxuly') default 'choxuly',
    foreign key (madh) references donhang(madh) on delete cascade
);
insert into taikhoan (tendangnhap, matkhau, vaitro)
values
('admin', '123456', 'admin'),
('nhanvien1', '123456', 'nhanvien'),
('trung', '123456', 'khachhang'),
('hung', '123456', 'khachhang'),
('nhat', '123456', 'khachhang'),
('nhanvien2', '123456', 'nhanvien');


insert into nguoidung (matk, hoten, email, sodienthoai, gioitinh, ngaysinh)
values
(1, 'Nguyễn Văn Admin', 'admin@shop.com', '0905000000', 'nam', '1990-01-01'),
(2, 'Trần Thị Nhân Viên', 'nv1@shop.com', '0905111222', 'nu', '1995-05-05'),
(3, 'Nguyễn Hữu Trung', 'trungll60@gmail.com', '0703710434', 'nam', '2000-01-01'),
(4, 'Nguyễn Hữu Hưng', 'hung@gmail.com', '0905000002', 'nam', '2000-02-02'),
(5, 'Trần Lê Nhất', 'nhat@gmail.com', '0905000003', 'nam', '2000-03-03'),
(6, 'Nguyễn Thị Nhân Viên 2', 'nv2@shop.com', '0905333444', 'nu', '1996-06-06');


insert into diachi (mand, diachi, phuongxa, quanhuyen, tinhthanh, macdinh)
values
(3, '12 Lê Duẩn', 'Hải Châu 1', 'Hải Châu', 'Đà Nẵng', true),
(4, '100 Nguyễn Huệ', 'Bến Nghé', 'Quận 1', 'TP.HCM', true),
(5, '25 Nguyễn Văn Linh', 'Thanh Khê Đông', 'Thanh Khê', 'Đà Nẵng', true),
(1, '01 Trần Phú', 'Hải Châu 2', 'Hải Châu', 'Đà Nẵng', true),
(2, '99 Lý Thường Kiệt', 'Bến Nghé', 'Quận 1', 'TP.HCM', true),
(6, '123 Nguyễn Trãi', 'Hòa Cường Bắc', 'Hải Châu', 'Đà Nẵng', true);

insert into danhmuc (tendm, mota)
values
('Điện thoại', 'Các sản phẩm điện thoại di động'),
('Laptop', 'Máy tính xách tay các loại'),
('Phụ kiện', 'Tai nghe, sạc, ốp lưng...');

insert into sanpham (madm, tensp, mota, gia, soluong)
values
(1, 'iPhone 15 Pro Max', 'Điện thoại cao cấp của Apple', 33990000, 10),
(1, 'Samsung Galaxy S24 Ultra', 'Flagship Samsung 2025', 28990000, 15),
(1, 'Xiaomi 14', 'Điện thoại hiệu năng cao giá tốt', 17990000, 20),
(1, 'OPPO Find X7', 'Camera AI cực đỉnh', 18990000, 25),
(2, 'MacBook Air M3', 'Laptop Apple chip M3', 27990000, 8),
(2, 'ASUS ROG Zephyrus G14', 'Laptop gaming cao cấp', 32990000, 5),
(2, 'Dell XPS 13 Plus', 'Ultrabook mỏng nhẹ', 30990000, 7),
(3, 'Tai nghe AirPods Pro 2', 'Tai nghe chống ồn cao cấp', 5990000, 20),
(3, 'Sạc nhanh 65W Baseus', 'Sạc nhanh đa cổng USB-C', 799000, 50),
(3, 'Chuột Logitech MX Master 3S', 'Chuột không dây cao cấp', 2490000, 30);

insert into hinhanh_sanpham (masp, duongdan)
values
(1, 'iphone15pro.jpg'),
(2, 's24ultra.jpg'),
(3, 'xiaomi14.jpg'),
(4, 'findx7.jpg'),
(5, 'macbookairm3.jpg'),
(6, 'rog_g14.jpg'),
(7, 'dellxps13.jpg'),
(8, 'airpodspro2.jpg'),
(9, 'sac65w.jpg'),
(10, 'logitechmx3s.jpg');

insert into thuoctinh_sanpham (masp, tenthuoctinh, giatri)
values
(1, 'Màu sắc', 'Titan tự nhiên'),
(1, 'Dung lượng', '256GB'),
(2, 'Màu sắc', 'Đen Phantom'),
(2, 'Dung lượng', '512GB'),
(3, 'RAM', '12GB'),
(3, 'Dung lượng', '256GB'),
(4, 'Màu sắc', 'Xanh ngọc'),
(5, 'RAM', '16GB'),
(5, 'Ổ cứng', '512GB SSD'),
(6, 'RAM', '32GB'),
(6, 'Card đồ họa', 'RTX 4070'),
(7, 'RAM', '16GB'),
(8, 'Màu sắc', 'Trắng'),
(9, 'Công suất', '65W'),
(10, 'Kết nối', 'Bluetooth 5.3');
insert into giohang (mand)
values
(3),
(4);

insert into chitiet_giohang (magiohang, masp, soluong)
values
(1, 1, 1),
(1, 4, 2),
(2, 2, 1);
insert into donhang (mand, trangthai, tongtien, diachigiaohang)
values
(3, 'danggiao', 39980000, '12 Lê Duẩn, Hải Châu, Đà Nẵng'),
(4, 'choxacnhan', 28990000, '100 Nguyễn Huệ, Quận 1, TP.HCM');

insert into chitiet_donhang (madh, masp, soluong, dongia)
values
(1, 1, 1, 33990000),
(1, 4, 1, 5990000),
(2, 2, 1, 28990000);

insert into thanhtoan (madh, phuongthuc, sotien, trangthai)
values
(1, 'chuyenkhoan', 39980000, 'thanhcong'),
(2, 'tienmat', 28990000, 'choxuly');

