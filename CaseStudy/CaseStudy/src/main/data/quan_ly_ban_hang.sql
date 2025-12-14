create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;
create table tai_khoan (
    id int auto_increment primary key,
    username varchar(50) not null unique,
    password varchar(255) not null,
    email varchar(100),
    role enum('admin', 'khachhang') default 'khachhang'
);
create table nguoi_dung (
    ma_nd int auto_increment primary key,
    ma_tk int not null,
    ho_ten varchar(50),
    email varchar(50),
    so_dien_thoai varchar(15),
    gioi_tinh enum('nam', 'nu'),
    ngay_sinh date,
    constraint fk_nguoi_dung_tai_khoan
        foreign key (ma_tk) references tai_khoan(id)
        on delete cascade
);
create table san_pham (
    ma_sp int auto_increment primary key,
    ten_sp varchar(150) not null,
    mo_ta text,
    gia decimal(12,2) not null,
    so_luong int default 0,
    img varchar(150)
);

create table don_hang (
    ma_dh int auto_increment primary key,
    ma_nd int not null,
    ngay_dat datetime default current_timestamp,
    trang_thai enum('cho_xac_nhan', 'dang_giao', 'hoan_thanh', 'da_huy')
        default 'cho_xac_nhan',
    tong_tien decimal(12,2) not null,
    dia_chi_giao_hang varchar(255),
    constraint fk_don_hang_nguoi_dung
        foreign key (ma_nd) references nguoi_dung(ma_nd)
        on delete cascade
);

-- ======================================
-- DỮLIỆU SAMPLE ĐỂ TEST
-- ======================================

-- TÀI KHOẢN
INSERT INTO tai_khoan (username, password, email, role) VALUES
('user1', 'password123', 'user1@gmail.com', 'khachhang'),
('user2', 'password123', 'user2@gmail.com', 'khachhang'),
('user3', 'password123', 'user3@gmail.com', 'khachhang'),
('admin', 'admin123', 'admin@store.com', 'admin');

-- NGƯỜI DÙNG
INSERT INTO nguoi_dung (ma_tk, ho_ten, email, so_dien_thoai, gioi_tinh, ngay_sinh) VALUES
(1, 'Nguyễn Văn A', 'user1@gmail.com', '0912345678', 'nam', '1995-01-15'),
(2, 'Trần Thị B', 'user2@gmail.com', '0923456789', 'nu', '1998-03-20'),
(3, 'Phạm Văn C', 'user3@gmail.com', '0934567890', 'nam', '1997-05-10');

-- SẢN PHẨM
INSERT INTO san_pham (ten_sp, mo_ta, gia, so_luong, img) VALUES
('Laptop Dell XPS 13', 'Laptop nhẹ, hiệu năng cao, pin 10 giờ', 25000000, 15, 'dell-xps-13.jpg'),
('iPhone 15 Pro', 'Điện thoại Apple, camera 48MP, chip A17', 28000000, 20, 'iphone-15-pro.jpg'),
('Samsung Galaxy S24', 'Điện thoại Samsung flagship, 6.2 inch AMOLED', 22000000, 25, 'samsung-s24.jpg'),
('iPad Pro 12.9', 'Máy tính bảng 12.9 inch, 512GB storage', 18000000, 12, 'ipad-pro.jpg'),
('AirPods Pro', 'Tai nghe không dây, chống ồn chủ động', 5500000, 40, 'airpods-pro.jpg'),
('Sony WH-1000XM5', 'Tai nghe chụp tai, chống ồn tốt nhất', 8000000, 18, 'sony-headphones.jpg');

-- ĐƠN HÀNG
INSERT INTO don_hang (ma_nd, ngay_dat, trang_thai, tong_tien, dia_chi_giao_hang) VALUES
(1, '2025-12-10 14:30:00', 'hoan_thanh', 33000000, '123 Đường Nguyễn Trãi, Quận 1, TP.HCM'),
(1, '2025-12-12 09:15:00', 'dang_giao', 28000000, '456 Đường Lê Lợi, Quận 5, TP.HCM'),
(2, '2025-12-13 11:45:00', 'cho_xac_nhan', 28000000, '789 Đường Trần Hưng Đạo, Quận 3, TP.HCM'),
(3, '2025-12-08 16:20:00', 'da_huy', 8000000, '321 Đường Võ Văn Tần, Quận 3, TP.HCM');

-- ======================================
-- BỔ SUNG BẢNG GIỎ HÀNG CHO ỨNG DỤNG
-- (Không thay đổi các bảng hiện có)
-- ======================================

create table if not exists giohang (
    ma_gh int auto_increment primary key,
    ma_tk int not null,
    ma_sp int not null,
    so_luong int not null default 1,
    gia decimal(12,2) not null,
    constraint fk_giohang_tai_khoan foreign key (ma_tk) references tai_khoan(id) on delete cascade,
    constraint fk_giohang_san_pham foreign key (ma_sp) references san_pham(ma_sp) on delete cascade
);

-- DỮ LIỆU MẪU CHO GIỎ HÀNG
-- Giả định: user1 có id=1, user2 có id=2 theo thứ tự insert ở trên
-- Lưu ý: giá trong giỏ lấy theo giá sản phẩm tại thời điểm thêm

INSERT INTO giohang (ma_tk, ma_sp, so_luong, gia) VALUES
-- Giỏ hàng của user1
(1, 1, 1, 25000000.00),
(1, 5, 2, 5500000.00),
-- Giỏ hàng của user2
(2, 2, 1, 28000000.00),
(2, 6, 1, 8000000.00);

-- ======================================
-- CÂU LỆNH KIỂM TRA DỮ LIỆU
-- ======================================
select * from tai_khoan;
select * from nguoi_dung;
select * from san_pham;
select * from don_hang;
select * from giohang;


