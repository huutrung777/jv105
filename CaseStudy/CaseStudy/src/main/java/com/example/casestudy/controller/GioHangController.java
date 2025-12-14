package com.example.casestudy.controller;

import com.example.casestudy.entity.GioHang;
import com.example.casestudy.entity.SanPham;
import com.example.casestudy.entity.TaiKhoan;
import com.example.casestudy.service.GioHangService;
import com.example.casestudy.service.SanPhamService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "gioHangController", value = "/giohang")
public class GioHangController extends HttpServlet {
    private GioHangService gioHangService = new GioHangService();
    private SanPhamService sanPhamService = new SanPhamService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("user");

        if (taiKhoan == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if (action == null || action.equals("view")) {
            viewCart(request, response, taiKhoan.getId());
        } else if (action.equals("remove")) {
            removeFromCart(request, response, taiKhoan.getId());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("user");

        if (taiKhoan == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if (action.equals("add")) {
            addToCart(request, response, taiKhoan.getId());
        } else if (action.equals("update")) {
            updateCart(request, response, taiKhoan.getId());
        }
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response, int maTaiKhoan) 
            throws ServletException, IOException {
        request.setAttribute("gioHangList", gioHangService.getByMaTaiKhoan(maTaiKhoan));
        request.setAttribute("tongTien", gioHangService.getTongTienGioHang(maTaiKhoan));
        request.getRequestDispatcher("view/giohang.jsp").forward(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response, int maTaiKhoan) 
            throws IOException {
        int maSanPham = Integer.parseInt(request.getParameter("maSanPham"));
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));

        SanPham sanPham = sanPhamService.getSanPhamById(maSanPham);
        if (sanPham != null) {
            GioHang gioHang = new GioHang(maTaiKhoan, maSanPham, soLuong, sanPham.getGia());
            gioHangService.addToCart(gioHang);
        }

        response.sendRedirect("giohang?action=view");
    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response, int maTaiKhoan) 
            throws IOException {
        int maGioHang = Integer.parseInt(request.getParameter("maGioHang"));
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));

        GioHang gioHang = gioHangService.getById(maGioHang);
        if (gioHang != null) {
            gioHang.setSoLuong(soLuong);
            gioHangService.updateCart(gioHang);
        }

        response.sendRedirect("giohang?action=view");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response, int maTaiKhoan) 
            throws IOException {
        int maGioHang = Integer.parseInt(request.getParameter("maGioHang"));
        gioHangService.removeFromCart(maGioHang);
        response.sendRedirect("giohang?action=view");
    }
}
