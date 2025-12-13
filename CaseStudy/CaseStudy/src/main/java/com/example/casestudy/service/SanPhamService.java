package com.example.casestudy.service;

import com.example.casestudy.entity.SanPham;
import com.example.casestudy.repository.ISanPhamRepository;
import com.example.casestudy.repository.SanPhamRepository;

import java.util.List;

public class SanPhamService implements ISanPhamService{
    ISanPhamRepository sanPhamRepository = new SanPhamRepository();
    @Override
    public List<SanPham> findAll() {
        return sanPhamRepository.findAll();
    }

    @Override
    public SanPham findById(int maSp) {
        return sanPhamRepository.findById(maSp);
    }

    @Override
    public boolean add(SanPham sanPham) {
        return sanPhamRepository.add(sanPham);
    }

    @Override
    public boolean update(SanPham sanPham) {
        return sanPhamRepository.update(sanPham);
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}
