package com.example.casestudy.service;


import com.example.casestudy.entity.TaiKhoan;

import java.util.List;

public interface ITaiKhoanService {
    List<TaiKhoan> findAll();
    boolean add(TaiKhoan taiKhoan);
    boolean deleteById(int id);
    TaiKhoan findById(int id);
    boolean update(TaiKhoan taiKhoan);
}
