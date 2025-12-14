package com.example.casestudy.service;

import com.example.casestudy.entity.GioHang;
import com.example.casestudy.repository.GioHangRepository;
import com.example.casestudy.repository.IGioHangRepository;
import java.util.List;

public class GioHangService implements IGioHangService {
    private IGioHangRepository gioHangRepository = new GioHangRepository();

    @Override
    public List<GioHang> getByMaTaiKhoan(int maTaiKhoan) {
        return gioHangRepository.findByMaTaiKhoan(maTaiKhoan);
    }

    @Override
    public GioHang getById(int maGioHang) {
        return gioHangRepository.findById(maGioHang);
    }

    @Override
    public void addToCart(GioHang gioHang) {
        gioHangRepository.add(gioHang);
    }

    @Override
    public void updateCart(GioHang gioHang) {
        gioHangRepository.update(gioHang);
    }

    @Override
    public void removeFromCart(int maGioHang) {
        gioHangRepository.delete(maGioHang);
    }

    @Override
    public void clearCart(int maTaiKhoan) {
        gioHangRepository.deleteByMaTaiKhoan(maTaiKhoan);
    }

    @Override
    public double getTongTienGioHang(int maTaiKhoan) {
        List<GioHang> list = gioHangRepository.findByMaTaiKhoan(maTaiKhoan);
        double total = 0;
        for (GioHang item : list) {
            total += item.getTongTien();
        }
        return total;
    }

    @Override
    public int getSoSanPhamTrongGio(int maTaiKhoan) {
        return gioHangRepository.findByMaTaiKhoan(maTaiKhoan).size();
    }
}
