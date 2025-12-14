package com.example.casestudy.service;

import com.example.casestudy.entity.DonHang;
import com.example.casestudy.entity.ChiTietDonHang;
import java.util.List;

public interface IDonHangService {
    List<DonHang> getAllDonHang();
    List<DonHang> getDonHangByMaTaiKhoan(int maTaiKhoan);
    DonHang getDonHangById(int maDonHang);
    int createDonHang(DonHang donHang);
    void updateDonHang(DonHang donHang);
    void deleteDonHang(int maDonHang);
    void updateTrangThai(int maDonHang, String trangThai);
    List<ChiTietDonHang> getChiTietByMaDonHang(int maDonHang);
}
