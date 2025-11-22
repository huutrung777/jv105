create database if not exists quan_ly_ban_hang1;
use quan_ly_ban_hang1;
create table tai_khoan (
    ma_tk int auto_increment primary key,
    ten_dang_nhap varchar(50) unique not null,
    mat_khau varchar(255) not null,
    vai_tro enum('admin', 'khachhang'),
    trang_thai boolean default true
);
create table nguoi_dung (
    ma_nd int auto_increment primary key,
    ma_tk int,
    ho_ten varchar(50),
    email varchar(50),
    so_dien_thoai varchar(15),
    gioi_tinh enum('nam', 'nu', 'khac'),
    ngay_sinh date,
    foreign key (ma_tk) references tai_khoan(ma_tk) on delete cascade
);
create table dia_chi (
    ma_dia_chi int auto_increment primary key,
    ma_nd int not null,
    dia_chi varchar(255) not null,
    phuong_xa varchar(100),
    quan_huyen varchar(100),
    tinh_thanh varchar(100),
    mac_dinh boolean default false,
    foreign key (ma_nd) references nguoi_dung(ma_nd) on delete cascade
);
create table danh_muc (
    ma_dm int auto_increment primary key,
    ten_dm varchar(100) not null,
    mo_ta text
);
create table san_pham (
    ma_sp int auto_increment primary key,
    ma_dm int not null,
    ten_sp varchar(150) not null,
    mo_ta text,
    gia decimal(12,2) not null,
    so_luong int default 0,
    trang_thai enum('conhang', 'hethang', 'ngungkinhdoanh') default 'conhang',
    foreign key (ma_dm) references danh_muc(ma_dm) on delete cascade
);
create table hinh_anh_san_pham (
    ma_hinh int auto_increment primary key,
    ma_sp int not null,
    duong_dan varchar(255) not null,
    foreign key (ma_sp) references san_pham(ma_sp) on delete cascade
);
create table gio_hang (
    ma_gio_hang int auto_increment primary key,
    ma_nd int not null,
    ngay_cap_nhat datetime default current_timestamp,
    foreign key (ma_nd) references nguoi_dung(ma_nd) on delete cascade
);
create table chi_tiet_gio_hang (
    ma_ct_gh int auto_increment primary key,
    ma_gio_hang int not null,
    ma_sp int not null,
    so_luong int default 1,
    foreign key (ma_gio_hang) references gio_hang(ma_gio_hang) on delete cascade,
    foreign key (ma_sp) references san_pham(ma_sp)
);
create table don_hang (
    ma_dh int auto_increment primary key,
    ma_nd int not null,
    ngay_dat datetime default current_timestamp,
    trang_thai enum('cho_xac_nhan', 'dang_giao', 'hoan_thanh', 'da_huy') default 'cho_xac_nhan',
    tong_tien decimal(12,2),
    dia_chi_giao_hang varchar(255),
    foreign key (ma_nd) references nguoi_dung(ma_nd) on delete cascade
);
create table chi_tiet_don_hang (
    ma_ct_dh int auto_increment primary key,
    ma_dh int not null,
    ma_sp int not null,
    so_luong int not null,
    don_gia decimal(12,2) not null,
    foreign key (ma_dh) references don_hang(ma_dh) on delete cascade,
    foreign key (ma_sp) references san_pham(ma_sp)
);
create table thanh_toan (
    ma_tt int auto_increment primary key,
    ma_dh int not null,
    phuong_thuc enum('tien_mat', 'chuyen_khoan', 'vi_dien_tu') default 'tien_mat',
    so_tien decimal(12,2) not null,
    ngay_thanh_toan datetime default current_timestamp,
    trang_thai enum('thanh_cong', 'that_bai', 'cho_xu_ly') default 'cho_xu_ly',
    foreign key (ma_dh) references don_hang(ma_dh) on delete cascade
);
-- Tài khoản
insert into tai_khoan (ten_dang_nhap, mat_khau, vai_tro)
values
('admin', '123456', 'admin'),
('trung', '123456', 'khachhang'),
('hung', '123456', 'khachhang'),
('nhat', '123456', 'khachhang');
-- Người dùng
insert into nguoi_dung (ma_tk, ho_ten, email, so_dien_thoai, gioi_tinh, ngay_sinh)
values
(1, 'Nguyễn Văn Admin', 'admin@shop.com', '0905000000', 'nam', '1990-01-01'),
(2, 'Nguyễn Hữu Trung', 'trungll60@gmail.com', '0703710434', 'nam', '2000-01-01'),
(3, 'Nguyễn Hữu Hưng', 'hung@gmail.com', '0905000002', 'nam', '2000-02-02'),
(4, 'Trần Lê Nhất', 'nhat@gmail.com', '0905000003', 'nam', '2000-03-03');


-- Địa chỉ
insert into dia_chi (ma_nd, dia_chi, phuong_xa, quan_huyen, tinh_thanh, mac_dinh)
values
(3, '12 Lê Duẩn', 'Hải Châu 1', 'Hải Châu', 'Đà Nẵng', true),
(4, '100 Nguyễn Huệ', 'Bến Nghé', 'Quận 1', 'TP.HCM', true),
(5, '25 Nguyễn Văn Linh', 'Thanh Khê Đông', 'Thanh Khê', 'Đà Nẵng', true),
(1, '01 Trần Phú', 'Hải Châu 2', 'Hải Châu', 'Đà Nẵng', true),
(2, '99 Lý Thường Kiệt', 'Bến Nghé', 'Quận 1', 'TP.HCM', true),
(6, '123 Nguyễn Trãi', 'Hòa Cường Bắc', 'Hải Châu', 'Đà Nẵng', true);

-- Danh mục
insert into danh_muc (ten_dm, mo_ta)
values
('Điện thoại', 'Các sản phẩm điện thoại di động'),
('Laptop', 'Máy tính xách tay các loại'),
('Phụ kiện', 'Tai nghe, sạc, ốp lưng...');

-- Sản phẩm
insert into san_pham (ma_dm, ten_sp, mo_ta, gia, so_luong)
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

-- Hình ảnh sản phẩm
insert into hinh_anh_san_pham (ma_sp, duong_dan)
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

-- Giỏ hàng
insert into gio_hang (ma_nd)
values
(3),
(4);

-- Chi tiết giỏ hàng
insert into chi_tiet_gio_hang (ma_gio_hang, ma_sp, so_luong)
values
(1, 1, 1),
(1, 4, 2),
(2, 2, 1);

-- Đơn hàng
insert into don_hang (ma_nd, trang_thai, tong_tien, dia_chi_giao_hang)
values
(3, 'dang_giao', 39980000, '12 Lê Duẩn, Hải Châu, Đà Nẵng'),
(4, 'cho_xac_nhan', 28990000, '100 Nguyễn Huệ, Quận 1, TP.HCM');

-- Chi tiết đơn hàng
insert into chi_tiet_don_hang (ma_dh, ma_sp, so_luong, don_gia)
values
(1, 1, 1, 33990000),
(1, 4, 1, 5990000),
(2, 2, 1, 28990000);

-- Thanh toán
insert into thanh_toan (ma_dh, phuong_thuc, so_tien, trang_thai)
values
(1, 'chuyen_khoan', 39980000, 'thanh_cong'),
(2, 'tien_mat', 28990000, 'cho_xu_ly');
