package com.example.casestudy.repository;

import com.example.casestudy.entity.GioHang;
import com.example.casestudy.util.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GioHangRepository implements IGioHangRepository {

    @Override
    public List<GioHang> findByMaTaiKhoan(int maTaiKhoan) {
        List<GioHang> list = new ArrayList<>();
        String sql = "SELECT * FROM giohang WHERE maTaiKhoan = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, maTaiKhoan);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                GioHang gioHang = new GioHang(
                    resultSet.getInt("maGioHang"),
                    resultSet.getInt("maTaiKhoan"),
                    resultSet.getInt("maSanPham"),
                    resultSet.getInt("soLuong"),
                    resultSet.getDouble("gia")
                );
                list.add(gioHang);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public GioHang findById(int maGioHang) {
        String sql = "SELECT * FROM giohang WHERE maGioHang = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, maGioHang);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new GioHang(
                    resultSet.getInt("maGioHang"),
                    resultSet.getInt("maTaiKhoan"),
                    resultSet.getInt("maSanPham"),
                    resultSet.getInt("soLuong"),
                    resultSet.getDouble("gia")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void add(GioHang gioHang) {
        String sql = "INSERT INTO giohang(maTaiKhoan, maSanPham, soLuong, gia) VALUES(?, ?, ?, ?)";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, gioHang.getMaTaiKhoan());
            preparedStatement.setInt(2, gioHang.getMaSanPham());
            preparedStatement.setInt(3, gioHang.getSoLuong());
            preparedStatement.setDouble(4, gioHang.getGia());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(GioHang gioHang) {
        String sql = "UPDATE giohang SET maTaiKhoan = ?, maSanPham = ?, soLuong = ?, gia = ? WHERE maGioHang = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, gioHang.getMaTaiKhoan());
            preparedStatement.setInt(2, gioHang.getMaSanPham());
            preparedStatement.setInt(3, gioHang.getSoLuong());
            preparedStatement.setDouble(4, gioHang.getGia());
            preparedStatement.setInt(5, gioHang.getMaGioHang());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int maGioHang) {
        String sql = "DELETE FROM giohang WHERE maGioHang = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, maGioHang);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteByMaTaiKhoan(int maTaiKhoan) {
        String sql = "DELETE FROM giohang WHERE maTaiKhoan = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, maTaiKhoan);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
