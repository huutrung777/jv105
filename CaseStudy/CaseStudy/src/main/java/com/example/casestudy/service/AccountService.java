package com.example.casestudy.service;

import com.example.casestudy.entity.Account;
import com.example.casestudy.repository.IAccountRepository;
import com.example.casestudy.repository.AccountRepository;

import java.util.List;

public class AccountService implements IAccountService {
    IAccountRepository taiKhoanRepository=new AccountRepository();
    @Override
    public List<Account> findAll() {
        return taiKhoanRepository.findAll();
    }

    @Override
    public boolean add(Account account) {
        return taiKhoanRepository.add(account);
    }

    @Override
    public boolean deleteById(int id) {
        return taiKhoanRepository.deleteById(id);
    }

    @Override
    public Account findById(int id) {
        return taiKhoanRepository.findById(id);
    }

    @Override
    public boolean update(Account account) {
        return taiKhoanRepository.update(account);
    }
}
