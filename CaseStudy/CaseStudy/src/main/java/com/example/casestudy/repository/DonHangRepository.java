package com.example.casestudy.repository;

import com.example.casestudy.entity.DonHang;
import com.example.casestudy.util.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DonHangRepository implements IDonHangRepository {

    @Override
    public List<DonHang> findAll() {
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM donhang ORDER BY ngayDat DESC";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                DonHang donHang = new DonHang(
                    resultSet.getInt("maDonHang"),
                    resultSet.getInt("maTaiKhoan"),
                    resultSet.getDate("ngayDat"),
                    resultSet.getString("diaChiGiao"),
                    resultSet.getDouble("tongTien"),
                    resultSet.getString("trangThai"),
                    resultSet.getString("phuongThucThanhToan"),
                    resultSet.getString("ghiChu")
                );
                list.add(donHang);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<DonHang> findByMaTaiKhoan(int maTaiKhoan) {
        List<DonHang> list = new ArrayList<>();
        String sql = "SELECT * FROM donhang WHERE maTaiKhoan = ? ORDER BY ngayDat DESC";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, maTaiKhoan);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                DonHang donHang = new DonHang(
                    resultSet.getInt("maDonHang"),
                    resultSet.getInt("maTaiKhoan"),
                    resultSet.getDate("ngayDat"),
                    resultSet.getString("diaChiGiao"),
                    resultSet.getDouble("tongTien"),
                    resultSet.getString("trangThai"),
                    resultSet.getString("phuongThucThanhToan"),
                    resultSet.getString("ghiChu")
                );
                list.add(donHang);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public DonHang findById(int maDonHang) {
        String sql = "SELECT * FROM donhang WHERE maDonHang = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, maDonHang);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new DonHang(
                    resultSet.getInt("maDonHang"),
                    resultSet.getInt("maTaiKhoan"),
                    resultSet.getDate("ngayDat"),
                    resultSet.getString("diaChiGiao"),
                    resultSet.getDouble("tongTien"),
                    resultSet.getString("trangThai"),
                    resultSet.getString("phuongThucThanhToan"),
                    resultSet.getString("ghiChu")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void add(DonHang donHang) {
        String sql = "INSERT INTO donhang(maTaiKhoan, ngayDat, diaChiGiao, tongTien, trangThai, phuongThucThanhToan, ghiChu) VALUES(?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, donHang.getMaTaiKhoan());
            preparedStatement.setDate(2, new java.sql.Date(donHang.getNgayDat().getTime()));
            preparedStatement.setString(3, donHang.getDiaChiGiao());
            preparedStatement.setDouble(4, donHang.getTongTien());
            preparedStatement.setString(5, donHang.getTrangThai());
            preparedStatement.setString(6, donHang.getPhuongThucThanhToan());
            preparedStatement.setString(7, donHang.getGhiChu());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(DonHang donHang) {
        String sql = "UPDATE donhang SET maTaiKhoan = ?, ngayDat = ?, diaChiGiao = ?, tongTien = ?, trangThai = ?, phuongThucThanhToan = ?, ghiChu = ? WHERE maDonHang = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, donHang.getMaTaiKhoan());
            preparedStatement.setDate(2, new java.sql.Date(donHang.getNgayDat().getTime()));
            preparedStatement.setString(3, donHang.getDiaChiGiao());
            preparedStatement.setDouble(4, donHang.getTongTien());
            preparedStatement.setString(5, donHang.getTrangThai());
            preparedStatement.setString(6, donHang.getPhuongThucThanhToan());
            preparedStatement.setString(7, donHang.getGhiChu());
            preparedStatement.setInt(8, donHang.getMaDonHang());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int maDonHang) {
        String sql = "DELETE FROM donhang WHERE maDonHang = ?";
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, maDonHang);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
