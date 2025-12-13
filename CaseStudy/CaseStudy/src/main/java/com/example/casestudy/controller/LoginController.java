package com.example.casestudy.controller;

import com.example.casestudy.dto.TaiKhoanDto;

import com.example.casestudy.entity.TaiKhoan;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private TaiKhoanDto taiKhoanDto = new TaiKhoanDto();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        TaiKhoan taiKhoan = taiKhoanDto.checkLogin(username, password);
        if (taiKhoan == null) {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
            return;
        }
        HttpSession session = request.getSession();
        session.setAttribute("khachhang", taiKhoan);
        if ("admin".equals(taiKhoan.getRole())) {
            session.setAttribute("admin", taiKhoan);
            response.sendRedirect(request.getContextPath() + "/view/admin/home.jsp");
        } else {
            session.setAttribute("khachhang", taiKhoan);
            response.sendRedirect(request.getContextPath() + "/view/user/home.jsp");
        }
    }
}

