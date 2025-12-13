package com.example.casestudy.controller;

import com.example.casestudy.dto.AccountDto;
import com.example.casestudy.entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private AccountDto accountDto = new AccountDto();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account account = accountDto.checkLogin(username, password);
        if (account == null) {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
            return;
        }
        HttpSession session = request.getSession();
        session.setAttribute("khachhang", account);
        if ("admin".equals(account.getRole())) {
            session.setAttribute("admin", account);
            response.sendRedirect(request.getContextPath() + "/view/admin/home.jsp");
        } else {
            session.setAttribute("khachhang", account);
            response.sendRedirect(request.getContextPath() + "/view/khachhang/home.jsp");
        }
    }
}

