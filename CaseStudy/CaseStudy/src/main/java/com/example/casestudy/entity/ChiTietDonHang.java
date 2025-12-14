package com.example.casestudy.entity;

public class ChiTietDonHang {
    private int maChiTiet;
    private int maDonHang;
    private int maSanPham;
    private int soLuong;
    private double gia;
    private double thanhTien;

    public ChiTietDonHang() {
    }

    public ChiTietDonHang(int maChiTiet, int maDonHang, int maSanPham, 
                          int soLuong, double gia, double thanhTien) {
        this.maChiTiet = maChiTiet;
        this.maDonHang = maDonHang;
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
        this.gia = gia;
        this.thanhTien = thanhTien;
    }

    public ChiTietDonHang(int maDonHang, int maSanPham, 
                          int soLuong, double gia, double thanhTien) {
        this.maDonHang = maDonHang;
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
        this.gia = gia;
        this.thanhTien = thanhTien;
    }

    public int getMaChiTiet() {
        return maChiTiet;
    }

    public void setMaChiTiet(int maChiTiet) {
        this.maChiTiet = maChiTiet;
    }

    public int getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
        this.maDonHang = maDonHang;
    }

    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public double getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(double thanhTien) {
        this.thanhTien = thanhTien;
    }

    @Override
    public String toString() {
        return "ChiTietDonHang{" +
                "maChiTiet=" + maChiTiet +
                ", maDonHang=" + maDonHang +
                ", maSanPham=" + maSanPham +
                ", soLuong=" + soLuong +
                ", gia=" + gia +
                ", thanhTien=" + thanhTien +
                '}';
    }
}
