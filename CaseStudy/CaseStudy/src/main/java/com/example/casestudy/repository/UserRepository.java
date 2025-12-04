package com.example.casestudy.repository;

import com.example.casestudy.entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserRepository  implements IUserRepository{
private static List<User> users = new ArrayList<>();
static {

}
    @Override
    public List<User> findAll() {
        return List.of();
    }

    @Override
    public boolean add(User user) {
        return false;
    }

    @Override
    public boolean deleteById(int maNd) {
        return false;
    }

    @Override
    public User findById(int maNd) {
        return null;
    }

    @Override
    public boolean update(User user) {
        return false;
    }
}
