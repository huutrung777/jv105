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


