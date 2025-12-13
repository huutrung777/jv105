package com.example.casestudy.service;

import com.example.casestudy.entity.SanPham;

import java.util.List;

public interface ISanPhamService {
    List<SanPham> findAll();
    boolean add(SanPham sanPham);
    boolean update(SanPham sanPham);
    boolean delete(int id);
}
