package com.example.casestudy.dao;

import com.example.casestudy.entity.TaiKhoan;
import com.example.casestudy.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TaiKhoanDao {
    public boolean insertTaiKhoan(TaiKhoan taiKhoan) {
        String sql = "INSERT INTO tai_khoan(username, email, password, role) VALUES (?,?,?,?)";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, taiKhoan.getUsername());
            ps.setString(2, taiKhoan.getEmail());
            ps.setString(3, taiKhoan.getPassword());
            ps.setString(4, taiKhoan.getRole());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
    public TaiKhoan login(String username, String password) {
        String sql = "SELECT * FROM tai_khoan WHERE username = ? AND password = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                TaiKhoan taiKhoan = new TaiKhoan();
                taiKhoan.setId(rs.getInt("id"));
                taiKhoan.setUsername(rs.getString("username"));
                taiKhoan.setEmail(rs.getString("email"));
                taiKhoan.setPassword(rs.getString("password"));
                taiKhoan.setRole(rs.getString("role"));
                return taiKhoan;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;


    }
    public TaiKhoan checkLogin(String username, String password) {
        String sql = "SELECT id, username, password, email, role FROM users WHERE username=? AND password=?";

        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                TaiKhoan taiKhoan = new TaiKhoan();
                taiKhoan.setId(rs.getInt("id"));
                taiKhoan.setUsername(rs.getString("username"));
                taiKhoan.setPassword(rs.getString("password"));
                taiKhoan.setEmail(rs.getString("email"));
                taiKhoan.setRole(rs.getString("role"));

                return taiKhoan;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
