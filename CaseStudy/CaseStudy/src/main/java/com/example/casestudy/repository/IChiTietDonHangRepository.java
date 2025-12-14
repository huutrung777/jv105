package com.example.casestudy.repository;

import com.example.casestudy.entity.ChiTietDonHang;
import java.util.List;

public interface IChiTietDonHangRepository {
    List<ChiTietDonHang> findByMaDonHang(int maDonHang);
    ChiTietDonHang findById(int maChiTiet);
    void add(ChiTietDonHang chiTiet);
    void delete(int maChiTiet);
}
