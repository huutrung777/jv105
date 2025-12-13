package com.example.casestudy.repository;

import com.example.casestudy.entity.Account;
import com.example.casestudy.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountRepository implements IAccountRepository {
    private final String SELECT_ALL = "select * from tai_khoan;";
    private final String INSERT_INTO = "insert into tai_khoan(username,password,email,role) values(?,?,?,?);";
    private final String DELETE_BY_ID = "delete from tai_khoan where id = ?;";
    private final String SELECT_BY_ID = "select * from tai_khoan where id = ?;";
    private final String UPDATE_TAIKHOAN = "update tai_khoan set username = ?, password = ?,email = ?,role= ? where id = ?;";


    @Override
    public List<Account> findAll() {
        List<Account> accountList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");
                Account account = new Account(id,username, password,email,role);
                accountList.add(account);
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truỳ vấn dữ liệu");
        }
        return accountList;
    }

    @Override
    public boolean add(Account account) {
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setString(3, account.getEmail());
            preparedStatement.setString(4, account.getRole());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow==1;
        } catch (SQLException e) {
            System.out.println("lỗi do truỳ vấn dữ liệu");
        }
        return false;
    }

    @Override
    public boolean deleteById(int id) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);

            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (deleteById)");
        }
        return false;
    }

    @Override
    public Account findById(int id) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");

                return new Account(id, username,password,email,role);
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (findById)");
        }
        return null;
    }

    @Override
    public boolean update(Account account) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TAIKHOAN);
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setString(3, account.getEmail());
            preparedStatement.setString(4, account.getRole());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (update)");
        }
        return false;
    }

}
