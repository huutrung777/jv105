package com.example.casestudy.repository;

import com.example.casestudy.entity.GioHang;
import java.util.List;

public interface IGioHangRepository {
    List<GioHang> findByMaTaiKhoan(int maTaiKhoan);
    GioHang findById(int maGioHang);
    void add(GioHang gioHang);
    void update(GioHang gioHang);
    void delete(int maGioHang);
    void deleteByMaTaiKhoan(int maTaiKhoan);
}
