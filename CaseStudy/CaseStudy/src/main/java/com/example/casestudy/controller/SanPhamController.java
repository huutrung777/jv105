package com.example.casestudy.controller;

import com.example.casestudy.entity.SanPham;
import com.example.casestudy.service.ISanPhamService;
import com.example.casestudy.service.SanPhamService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "sanphamcontroller", value = "/san-pham")
public class SanPhamController extends HttpServlet {

    private ISanPhamService sanPhamService = new SanPhamService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "home"; 
        }

        switch (action) {
            case "home":
                req.setAttribute("sanPhamList", sanPhamService.findAll());
                req.getRequestDispatcher("/view/user/trangchu.jsp").forward(req, resp);
                break;

            case "admin":
                req.setAttribute("sanPhamList", sanPhamService.findAll());
                req.getRequestDispatcher("/view/admin/sanpham.jsp").forward(req, resp);
                break;

            case "add":
                req.getRequestDispatcher("/view/admin/add_sanpham.jsp").forward(req, resp);
                break;

            default:
                resp.sendRedirect("/san-pham?action=home");
                break;
        }
    }


    private void showFormAdd(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setAttribute("sanPhamList",sanPhamService.findAll());
            req.getRequestDispatcher("/view/admin/add_sanpham.jsp").forward(req,resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        String tenSp = req.getParameter("tenSp");
        String moTa = req.getParameter("moTa");
        Double gia = Double.parseDouble(req.getParameter("gia"));
        int soLuong = Integer.parseInt(req.getParameter("soLuong"));
        String anh = req.getParameter("anh");
        SanPham sanPham = new SanPham(tenSp,moTa,gia,soLuong,anh);
        boolean isSucces = sanPhamService.add(sanPham);
        String mess = isSucces?"Them moi thanh cong":"Them moi that bai";
        try {
            resp.sendRedirect("/san-pham?action=admin&mess=" + mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "add":
                save(req,resp);
        }
    }
}
