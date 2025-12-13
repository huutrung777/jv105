package com.example.casestudy.repository;

import com.example.casestudy.entity.SanPham;
import com.example.casestudy.util.ConnectDB;

import java.sql.Connection;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SanPhamRepository implements ISanPhamRepository{
    @Override
    public List<SanPham> findAll() {
        List<SanPham> sanPhamList = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement =connection.prepareStatement("SELECT * FROM san_pham");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                SanPham sanPham = new SanPham();
                sanPham.setMaSp(resultSet.getInt("ma_sp"));
                sanPham.setTenSp(resultSet.getString("ten_sp"));
                sanPham.setMoTa(resultSet.getString("mo_ta"));
                sanPham.setGia(resultSet.getDouble("gia"));
                sanPham.setSoLuong(resultSet.getInt("so_luong"));
                sanPham.setAnh(resultSet.getString("img"));
                sanPhamList.add(sanPham);
            }
        } catch (Exception e) {
            System.out.println("Loi truy van csdl");
        }
        return sanPhamList;
    }

    @Override
    public boolean add(SanPham sanPham) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO san_pham (ten_sp, mo_ta, gia, so_luong, img) VALUES (?,?,?,?,?)");

            preparedStatement.setString(1, sanPham.getTenSp());
            preparedStatement.setString(2, sanPham.getMoTa());
            preparedStatement.setDouble(3, sanPham.getGia());
            preparedStatement.setInt(4, sanPham.getSoLuong());
            preparedStatement.setString(5, sanPham.getAnh());

            return preparedStatement.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Lỗi truy vấn dữ liệu (add)");
        }
        return false;
    }


    @Override
    public boolean update(SanPham sanPham) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }


}
