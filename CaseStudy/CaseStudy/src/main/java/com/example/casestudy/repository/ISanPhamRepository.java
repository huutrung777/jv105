package com.example.casestudy.repository;

import com.example.casestudy.entity.SanPham;

import java.util.List;

public interface ISanPhamRepository {
    List<SanPham> findAll();
    boolean add(SanPham sanPham);
    boolean update(SanPham sanPham);
    boolean delete(int id);
}
