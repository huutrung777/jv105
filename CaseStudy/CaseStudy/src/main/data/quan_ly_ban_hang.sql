create
database if not exists quan_ly_ban_hang;
use
quan_ly_ban_hang;
create table tai_khoan
(
    id       int auto_increment primary key,
    username varchar(50)  not null unique,
    password varchar(255) not null,
    email    varchar(100),
    role     enum('admin', 'khachhang') default 'khachhang'
);
create table nguoi_dung
(
    ma_nd         int auto_increment primary key,
    ma_tk         int not null,
    ho_ten        varchar(50),
    email         varchar(50),
    so_dien_thoai varchar(15),
    gioi_tinh     enum('nam', 'nu'),
    ngay_sinh     date,
    constraint fk_nguoi_dung_tai_khoan
        foreign key (ma_tk) references tai_khoan (id)
            on delete cascade
);
create table san_pham
(
    ma_sp    int auto_increment primary key,
    ten_sp   varchar(150)   not null,
    mo_ta    text,
    gia      decimal(12, 2) not null,
    so_luong int default 0,
    img      varchar(150)
);

create table don_hang
(
    ma_dh             int auto_increment primary key,
    ma_nd             int            not null,
    ngay_dat          datetime default current_timestamp,
    trang_thai        enum('cho_xac_nhan', 'dang_giao', 'hoan_thanh', 'da_huy')
        default 'cho_xac_nhan',
    tong_tien         decimal(12, 2) not null,
    dia_chi_giao_hang varchar(255),
    constraint fk_don_hang_nguoi_dung
        foreign key (ma_nd) references nguoi_dung (ma_nd)
            on delete cascade
);
INSERT INTO san_pham (ten_sp, mo_ta, gia, so_luong, img)
VALUES ('iPhone 15 Pro Max', 'Điện thoại cao cấp nhất của Apple, chip A17 Pro, camera 48MP.', 33990000, 20,
        'iphone15promax.jpg'),
       ('Samsung Galaxy S24 Ultra', 'Flagship Samsung 2024, bút S-Pen, màn hình Dynamic AMOLED.', 28990000, 15,
        's24ultra.jpg'),
       ('Xiaomi 14', 'Điện thoại hiệu năng cao, camera Leica, giá tốt.', 15990000, 30, 'xiaomi14.jpg'),
       ('OPPO Reno 11 Pro', 'Thiết kế đẹp, chụp chân dung xuất sắc.', 12990000, 25, 'reno11pro.jpg'),
       ('Vivo V30', 'Camera selfie mạnh, pin lớn, sạc nhanh.', 9990000, 40, 'v30.jpg'),
       ('iPhone 14', 'Mẫu iPhone phổ biến, chip A15, nhiều màu sắc.', 18990000, 50, 'iphone14.jpg'),
       ('Realme 11 Pro+', 'Màn hình cong 120Hz, camera 200MP.', 8990000, 35, 'realme11pro.jpg'),
       ('Samsung A55', 'Mẫu máy tầm trung 2024, hiệu năng ổn định.', 8990000, 60, 'a55.jpg'),
       ('Nokia G22', 'Máy bền, pin trâu, thích hợp cho người lớn tuổi.', 3990000, 20, 'nokiag22.jpg'),
       ('Asus ROG Phone 7', 'Điện thoại gaming mạnh nhất, tản nhiệt tốt.', 26990000, 10, 'rogphone7.jpg');



