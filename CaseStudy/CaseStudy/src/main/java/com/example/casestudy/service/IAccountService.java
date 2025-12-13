package com.example.casestudy.service;

import com.example.casestudy.entity.Account;

import java.util.List;

public interface IAccountService {
    List<Account> findAll();
    boolean add(Account account);
    boolean deleteById(int id);
    Account findById(int id);
    boolean update(Account account);
}
