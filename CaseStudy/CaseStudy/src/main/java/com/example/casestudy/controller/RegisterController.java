package com.example.casestudy.controller;

import com.example.casestudy.dto.AccountDto;
import com.example.casestudy.entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {

    private AccountDto accountDto = new AccountDto();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirm = req.getParameter("confirm");
        if (!password.equals(confirm)) {
            req.setAttribute("message", "Mật khẩu không trùng khớp!");
            req.getRequestDispatcher("/view/register.jsp").forward(req, resp);
            return;
        }
        if (accountDto.existsByUsername(username)) {
            req.setAttribute("message", "Tên đăng nhập đã tồn tại!");
            req.getRequestDispatcher("/view/register.jsp").forward(req, resp);
            return;
        }
        Account account = new Account(username, email, password, "khachhang");
        boolean ok = accountDto.insertTaiKhoan(account);
        if (ok) {
            resp.sendRedirect("/view/login.jsp");
        } else {
            req.setAttribute("message", "Lỗi tạo tài khoản!");
            req.getRequestDispatcher("/view/register.jsp").forward(req, resp);
        }
    }
}

