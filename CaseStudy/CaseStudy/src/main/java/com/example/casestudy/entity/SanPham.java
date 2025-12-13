package com.example.casestudy.entity;

public class SanPham {
    private int maSp;
    private String tenSp;
    private String moTa;
    private double gia;
    private int soLuong;
    private String anh;

    public SanPham(int maSp, String tenSp, String moTa, double gia, int soLuong, String anh) {
        this.maSp = maSp;
        this.tenSp = tenSp;
        this.moTa = moTa;
        this.gia = gia;
        this.soLuong = soLuong;
        this.anh = anh;
    }

    public SanPham(String tenSp, String moTa, double gia, int soLuong, String anh) {
        this.tenSp = tenSp;
        this.moTa = moTa;
        this.gia = gia;
        this.soLuong = soLuong;
        this.anh = anh;
    }

    public SanPham() {
    }

    public int getMaSp() {
        return maSp;
    }

    public void setMaSp(int maSp) {
        this.maSp = maSp;
    }

    public String getTenSp() {
        return tenSp;
    }

    public void setTenSp(String tenSp) {
        this.tenSp = tenSp;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }
}
