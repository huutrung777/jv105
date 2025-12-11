package com.example.casestudy.service;

import com.example.casestudy.entity.TaiKhoan;
import com.example.casestudy.repository.ITaiKhoanRepository;
import com.example.casestudy.repository.TaiKhoanRepository;

import java.util.List;

public class TaiKhoanService implements ITaiKhoanService{
    ITaiKhoanRepository taiKhoanRepository=new TaiKhoanRepository();
    @Override
    public List<TaiKhoan> findAll() {
        return taiKhoanRepository.findAll();
    }

    @Override
    public boolean add(TaiKhoan taiKhoan) {
        return taiKhoanRepository.add(taiKhoan);
    }

    @Override
    public boolean deleteById(int id) {
        return taiKhoanRepository.deleteById(id);
    }

    @Override
    public TaiKhoan findById(int id) {
        return taiKhoanRepository.findById(id);
    }

    @Override
    public boolean update(TaiKhoan taiKhoan) {
        return taiKhoanRepository.update(taiKhoan);
    }
}
