package com.example.casestudy.repository;


import com.example.casestudy.entity.TaiKhoan;

import java.util.List;

public interface ITaiKhoanRepository {
    List<TaiKhoan> findAll();
    boolean add(TaiKhoan taiKhoan);
    boolean deleteById(int id);
    TaiKhoan findById(int id);
    boolean update(TaiKhoan taiKhoan);
}
