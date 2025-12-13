package com.example.casestudy.controller;

import com.example.casestudy.entity.TaiKhoan;
import com.example.casestudy.service.ITaiKhoanService;
import com.example.casestudy.service.TaiKhoantService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@WebServlet(name = "TaiKhoanController",value = "/taikhoans")
public class TaiKhoanController extends HttpServlet {
    private ITaiKhoanService taiKhoanService = new TaiKhoantService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showForAdd(req,resp);
                break;
            case "find":
                findById(req, resp);
                break;
            case "edit":
                showFormEdit(req, resp);
                break;
            default:
                showList(req,resp);
                break;
        }

    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<TaiKhoan> taiKhoanList = taiKhoanService.findAll();
        req.setAttribute("taiKhoanList", taiKhoanList);
        try {
            req.getRequestDispatcher("/view/taikhoan/action/list.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        TaiKhoan taiKhoan = taiKhoanService.findById(id);
        if (taiKhoan != null) {
            req.setAttribute("taiKhoan", taiKhoan);
            req.getRequestDispatcher("/view/taikhoan/action/edit.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/taikhoans?mess=" + URLEncoder.encode("Tài khoản không tồn tại", "UTF-8"));
        }

    }

    private void findById(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));

        TaiKhoan taiKhoan = taiKhoanService.findById(id);

        if (taiKhoan != null) {
            req.setAttribute("userList", java.util.List.of(taiKhoan));
            req.setAttribute("mess", "Tìm thấy sinh viên ID: " + id);
        } else {
            req.setAttribute("userList", java.util.List.of());
            req.setAttribute("mess", "Không tìm thấy sinh viên ID: " + id);
        }

        try {
            req.getRequestDispatcher("/view/taikhoan/action/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showForAdd(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("/view/taikhoan/action/add.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";

        }
        switch (action) {
            case "add":
                // lấy dữ liệu thêm và db
                save(req,resp);
                break;
            case "delete":
                // lấy dữ liệu thêm và db
                deleteById(req,resp);
                break;
            case "update":
                update(req, resp);
                break;
            default:
                resp.sendRedirect("/taikhoans");
                break;

        }

    }

    private void deleteById(HttpServletRequest req, HttpServletResponse resp) {
        int deleteId = Integer.parseInt(req.getParameter("deleteId"));
        boolean isSuccess = taiKhoanService.deleteById(deleteId);
        String mess=isSuccess?"success":"fail";
        try {
            resp.sendRedirect("/taikhoans?mess="+ mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        TaiKhoan taiKhoan = new TaiKhoan(username, email, password, role);
        boolean isSuccess = taiKhoanService.update(taiKhoan);
        String mess = isSuccess ? "Cập nhật thành công" : "Cập nhật thất bại";
        resp.sendRedirect("/users?mess=" + URLEncoder.encode(mess, "UTF-8"));
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        TaiKhoan taiKhoan = new TaiKhoan(username, email, password, role);
        boolean isSuccess = taiKhoanService.add(taiKhoan);
        String mess = isSuccess? "Them moi thanh cong":"Them moi that bai";
        try {
            resp.sendRedirect("/taikhoans?mess="+ mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
