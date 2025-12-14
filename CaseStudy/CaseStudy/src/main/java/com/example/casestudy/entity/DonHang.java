package com.example.casestudy.entity;

import java.util.Date;

public class DonHang {
    private int maDonHang;
    private int maTaiKhoan;
    private Date ngayDat;
    private String diaChiGiao;
    private double tongTien;
    private String trangThai; // PENDING, CONFIRMED, SHIPPING, DELIVERED, CANCELLED
    private String phuongThucThanhToan; // COD, ONLINE
    private String ghiChu;

    public DonHang() {
    }

    public DonHang(int maDonHang, int maTaiKhoan, Date ngayDat, String diaChiGiao, 
                   double tongTien, String trangThai, String phuongThucThanhToan, String ghiChu) {
        this.maDonHang = maDonHang;
        this.maTaiKhoan = maTaiKhoan;
        this.ngayDat = ngayDat;
        this.diaChiGiao = diaChiGiao;
        this.tongTien = tongTien;
        this.trangThai = trangThai;
        this.phuongThucThanhToan = phuongThucThanhToan;
        this.ghiChu = ghiChu;
    }

    public DonHang(int maTaiKhoan, Date ngayDat, String diaChiGiao, 
                   double tongTien, String trangThai, String phuongThucThanhToan, String ghiChu) {
        this.maTaiKhoan = maTaiKhoan;
        this.ngayDat = ngayDat;
        this.diaChiGiao = diaChiGiao;
        this.tongTien = tongTien;
        this.trangThai = trangThai;
        this.phuongThucThanhToan = phuongThucThanhToan;
        this.ghiChu = ghiChu;
    }

    public int getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
        this.maDonHang = maDonHang;
    }

    public int getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(int maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public Date getNgayDat() {
        return ngayDat;
    }

    public void setNgayDat(Date ngayDat) {
        this.ngayDat = ngayDat;
    }

    public String getDiaChiGiao() {
        return diaChiGiao;
    }

    public void setDiaChiGiao(String diaChiGiao) {
        this.diaChiGiao = diaChiGiao;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getPhuongThucThanhToan() {
        return phuongThucThanhToan;
    }

    public void setPhuongThucThanhToan(String phuongThucThanhToan) {
        this.phuongThucThanhToan = phuongThucThanhToan;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    @Override
    public String toString() {
        return "DonHang{" +
                "maDonHang=" + maDonHang +
                ", maTaiKhoan=" + maTaiKhoan +
                ", ngayDat=" + ngayDat +
                ", diaChiGiao='" + diaChiGiao + '\'' +
                ", tongTien=" + tongTien +
                ", trangThai='" + trangThai + '\'' +
                ", phuongThucThanhToan='" + phuongThucThanhToan + '\'' +
                ", ghiChu='" + ghiChu + '\'' +
                '}';
    }
}
