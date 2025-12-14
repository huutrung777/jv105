package com.example.casestudy.service;

import com.example.casestudy.entity.GioHang;
import java.util.List;

public interface IGioHangService {
    List<GioHang> getByMaTaiKhoan(int maTaiKhoan);
    GioHang getById(int maGioHang);
    void addToCart(GioHang gioHang);
    void updateCart(GioHang gioHang);
    void removeFromCart(int maGioHang);
    void clearCart(int maTaiKhoan);
    double getTongTienGioHang(int maTaiKhoan);
    int getSoSanPhamTrongGio(int maTaiKhoan);
}
