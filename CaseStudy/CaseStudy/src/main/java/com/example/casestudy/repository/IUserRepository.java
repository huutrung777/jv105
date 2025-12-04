package com.example.casestudy.repository;

import com.example.casestudy.entity.User;

import java.util.List;

public interface IUserRepository {
    List<User> findAll();
    boolean add(User user);
    boolean deleteById(int maNd);
    User findById(int maNd);
    boolean update(User user);
}
