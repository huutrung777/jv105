package com.example.casestudy.repository;

import com.example.casestudy.entity.TaiKhoan;
import com.example.casestudy.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaiKhoanRepository implements ITaiKhoanRepository{
    private final String SELECT_ALL = "select * from tai_khoan;";
    private final String INSERT_INTO = "insert into tai_khoan(username,password,email,role) values(?,?,?,?);";
    private final String DELETE_BY_ID = "delete from tai_khoan where id = ?;";
    private final String SELECT_BY_ID = "select * from tai_khoan where id = ?;";
    private final String UPDATE_TAIKHOAN = "update tai_khoan set username = ?, password = ?,email = ?,role= ? where id = ?;";


    @Override
    public List<TaiKhoan> findAll() {
        List<TaiKhoan> taiKhoanList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");
                TaiKhoan taiKhoan = new TaiKhoan(id,username, password,email,role);
                taiKhoanList.add(taiKhoan);
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truỳ vấn dữ liệu");
        }
        return taiKhoanList;
    }

    @Override
    public boolean add(TaiKhoan taiKhoan) {
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,taiKhoan.getUsername());
            preparedStatement.setString(2,taiKhoan.getPassword());
            preparedStatement.setString(3,taiKhoan.getEmail());
            preparedStatement.setString(4,taiKhoan.getRole());
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
    public TaiKhoan findById(int id) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");

                return new TaiKhoan(id, username,password,email,role);
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (findById)");
        }
        return null;
    }

    @Override
    public boolean update(TaiKhoan taiKhoan) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TAIKHOAN);
            preparedStatement.setString(1, taiKhoan.getUsername());
            preparedStatement.setString(2, taiKhoan.getPassword());
            preparedStatement.setString(3, taiKhoan.getEmail());
            preparedStatement.setString(4, taiKhoan.getRole());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (update)");
        }
        return false;
    }

}
