package com.example.casestudy.repository;

import com.example.casestudy.entity.ChiTietDonHang;
import com.example.casestudy.util.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChiTietDonHangRepository implements IChiTietDonHangRepository {

    @Override
    public List<ChiTietDonHang> findByMaDonHang(int maDonHang) {
        List<ChiTietDonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM chitietdonhang WHERE maDonHang = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, maDonHang);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ChiTietDonHang chiTiet = new ChiTietDonHang(
                    resultSet.getInt("maChiTiet"),
                    resultSet.getInt("maDonHang"),
                    resultSet.getInt("maSanPham"),
                    resultSet.getInt("soLuong"),
                    resultSet.getDouble("gia"),
                    resultSet.getDouble("thanhTien")
                );
                list.add(chiTiet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ChiTietDonHang findById(int maChiTiet) {
        String sql = "SELECT * FROM chitietdonhang WHERE maChiTiet = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, maChiTiet);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new ChiTietDonHang(
                    resultSet.getInt("maChiTiet"),
                    resultSet.getInt("maDonHang"),
                    resultSet.getInt("maSanPham"),
                    resultSet.getInt("soLuong"),
                    resultSet.getDouble("gia"),
                    resultSet.getDouble("thanhTien")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void add(ChiTietDonHang chiTiet) {
        String sql = "INSERT INTO chitietdonhang(maDonHang, maSanPham, soLuong, gia, thanhTien) VALUES(?, ?, ?, ?, ?)";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, chiTiet.getMaDonHang());
            preparedStatement.setInt(2, chiTiet.getMaSanPham());
            preparedStatement.setInt(3, chiTiet.getSoLuong());
            preparedStatement.setDouble(4, chiTiet.getGia());
            preparedStatement.setDouble(5, chiTiet.getThanhTien());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int maChiTiet) {
        String sql = "DELETE FROM chitietdonhang WHERE maChiTiet = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, maChiTiet);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
