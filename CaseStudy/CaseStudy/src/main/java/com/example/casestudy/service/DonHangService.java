package com.example.casestudy.service;

import com.example.casestudy.entity.DonHang;
import com.example.casestudy.entity.ChiTietDonHang;
import com.example.casestudy.entity.GioHang;
import com.example.casestudy.repository.*;
import java.util.List;

public class DonHangService implements IDonHangService {
    private IDonHangRepository donHangRepository = new DonHangRepository();
    private IChiTietDonHangRepository chiTietRepository = new ChiTietDonHangRepository();
    private IGioHangRepository gioHangRepository = new GioHangRepository();

    @Override
    public List<DonHang> getAllDonHang() {
        return donHangRepository.findAll();
    }

    @Override
    public List<DonHang> getDonHangByMaTaiKhoan(int maTaiKhoan) {
        return donHangRepository.findByMaTaiKhoan(maTaiKhoan);
    }

    @Override
    public DonHang getDonHangById(int maDonHang) {
        return donHangRepository.findById(maDonHang);
    }

    @Override
    public int createDonHang(DonHang donHang) {
        donHangRepository.add(donHang);
        List<DonHang> orders = donHangRepository.findByMaTaiKhoan(donHang.getMaTaiKhoan());
        if (!orders.isEmpty()) {
            return orders.get(orders.size() - 1).getMaDonHang();
        }
        return -1;
    }

    @Override
    public void updateDonHang(DonHang donHang) {
        donHangRepository.update(donHang);
    }

    @Override
    public void deleteDonHang(int maDonHang) {
        donHangRepository.delete(maDonHang);
    }

    @Override
    public void updateTrangThai(int maDonHang, String trangThai) {
        DonHang donHang = donHangRepository.findById(maDonHang);
        if (donHang != null) {
            donHang.setTrangThai(trangThai);
            donHangRepository.update(donHang);
        }
    }

    @Override
    public List<ChiTietDonHang> getChiTietByMaDonHang(int maDonHang) {
        return chiTietRepository.findByMaDonHang(maDonHang);
    }

    public void createDonHangFromCart(int maTaiKhoan, String diaChiGiao, String phuongThuc, String ghiChu) {
        List<GioHang> gioHangList = gioHangRepository.findByMaTaiKhoan(maTaiKhoan);
        if (gioHangList.isEmpty()) {
            return;
        }

        double tongTien = 0;
        for (GioHang item : gioHangList) {
            tongTien += item.getTongTien();
        }

        DonHang donHang = new DonHang(maTaiKhoan, new java.util.Date(), diaChiGiao, 
                                       tongTien, "PENDING", phuongThuc, ghiChu);
        donHangRepository.add(donHang);

        List<DonHang> orders = donHangRepository.findByMaTaiKhoan(maTaiKhoan);
        int maDonHang = orders.get(orders.size() - 1).getMaDonHang();

        for (GioHang item : gioHangList) {
            ChiTietDonHang chiTiet = new ChiTietDonHang(
                maDonHang, 
                item.getMaSanPham(), 
                item.getSoLuong(), 
                item.getGia(), 
                item.getTongTien()
            );
            chiTietRepository.add(chiTiet);
        }

        gioHangRepository.deleteByMaTaiKhoan(maTaiKhoan);
    }
}
