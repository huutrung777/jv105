package com.example.casestudy.controller;

import com.example.casestudy.entity.DonHang;
import com.example.casestudy.entity.TaiKhoan;
import com.example.casestudy.service.DonHangService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "donHangController", value = "/donhang")
public class DonHangController extends HttpServlet {
    private DonHangService donHangService = new DonHangService();

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

        if (action == null || action.equals("list")) {
            listDonHang(request, response, taiKhoan.getId());
        } else if (action.equals("detail")) {
            detailDonHang(request, response);
        } else if (action.equals("thanhtoan")) {
            pageThanhToan(request, response);
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

        if (action.equals("create")) {
            createDonHang(request, response, taiKhoan.getId());
        } else if (action.equals("huy")) {
            cancelDonHang(request, response);
        }
    }

    private void listDonHang(HttpServletRequest request, HttpServletResponse response, int maTaiKhoan) 
            throws ServletException, IOException {
        request.setAttribute("donHangList", donHangService.getDonHangByMaTaiKhoan(maTaiKhoan));
        request.getRequestDispatcher("view/donhang.jsp").forward(request, response);
    }

    private void detailDonHang(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int maDonHang = Integer.parseInt(request.getParameter("maDonHang"));
        DonHang donHang = donHangService.getDonHangById(maDonHang);
        request.setAttribute("donHang", donHang);
        request.setAttribute("chiTietList", donHangService.getChiTietByMaDonHang(maDonHang));
        request.getRequestDispatcher("view/donhang-detail.jsp").forward(request, response);
    }

    private void pageThanhToan(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("view/donhang-checkout.jsp").forward(request, response);
    }

    private void createDonHang(HttpServletRequest request, HttpServletResponse response, int maTaiKhoan) 
            throws IOException {
        String diaChiGiao = request.getParameter("diaChiGiao");
        String phuongThuc = request.getParameter("phuongThuc");
        String ghiChu = request.getParameter("ghiChu");

        donHangService.createDonHangFromCart(maTaiKhoan, diaChiGiao, phuongThuc, ghiChu);
        response.sendRedirect("donhang?action=list");
    }

    private void cancelDonHang(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        int maDonHang = Integer.parseInt(request.getParameter("maDonHang"));
        donHangService.updateTrangThai(maDonHang, "CANCELLED");
        response.sendRedirect("donhang?action=list");
    }
}
