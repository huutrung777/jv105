package com.example.casestudy.repository;

import com.example.casestudy.entity.DonHang;
import java.util.List;

public interface IDonHangRepository {
    List<DonHang> findAll();
    List<DonHang> findByMaTaiKhoan(int maTaiKhoan);
    DonHang findById(int maDonHang);
    void add(DonHang donHang);
    void update(DonHang donHang);
    void delete(int maDonHang);
}
