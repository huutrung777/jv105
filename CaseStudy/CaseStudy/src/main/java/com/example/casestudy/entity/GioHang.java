package com.example.casestudy.entity;

public class GioHang {
    private int maGioHang;
    private int maTaiKhoan;
    private int maSanPham;
    private int soLuong;
    private double gia;

    public GioHang() {
    }

    public GioHang(int maGioHang, int maTaiKhoan, int maSanPham, int soLuong, double gia) {
        this.maGioHang = maGioHang;
        this.maTaiKhoan = maTaiKhoan;
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
        this.gia = gia;
    }

    public GioHang(int maTaiKhoan, int maSanPham, int soLuong, double gia) {
        this.maTaiKhoan = maTaiKhoan;
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
        this.gia = gia;
    }

    public int getMaGioHang() {
        return maGioHang;
    }

    public void setMaGioHang(int maGioHang) {
        this.maGioHang = maGioHang;
    }

    public int getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(int maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
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

    public double getTongTien() {
        return soLuong * gia;
    }

    @Override
    public String toString() {
        return "GioHang{" +
                "maGioHang=" + maGioHang +
                ", maTaiKhoan=" + maTaiKhoan +
                ", maSanPham=" + maSanPham +
                ", soLuong=" + soLuong +
                ", gia=" + gia +
                '}';
    }
}
