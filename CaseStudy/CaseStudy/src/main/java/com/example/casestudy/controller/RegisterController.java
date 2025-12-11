package com.example.casestudy.controller;

import com.example.casestudy.dao.TaiKhoanDao;
import com.example.casestudy.entity.TaiKhoan;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "RegisterController",value = "/register")
public class RegisterController extends HttpServlet {
private TaiKhoanDao taiKhoanDAO = new TaiKhoanDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirm = req.getParameter("confirm");

        if (!password.equals(confirm)) {
            req.setAttribute("message", "Mật khẩu không trùng khớp!");
            req.getRequestDispatcher("/view/register.jsp").forward(req, resp);
            return;
        }
        TaiKhoan taiKhoan = new TaiKhoan(username, email, password, "user");
        boolean ok = taiKhoanDAO.insertTaiKhoan(taiKhoan);
        if (ok) {
            resp.sendRedirect("view/login.jsp");
        } else {
            req.setAttribute("message", "Lỗi tạo tài khoản!");
            req.getRequestDispatcher("/view/register.jsp").forward(req, resp);
        }
    }
}
