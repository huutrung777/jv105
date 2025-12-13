  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html lang="vi">
  <head>
    <meta charset="UTF-8">
    <title>Đăng Nhập Quản Trị</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body, html {
        height: 100%;
        width: 100%;
        background: linear-gradient(135deg, #7d0a0a, #b51212);
        font-family: "Poppins", sans-serif;
      }

      .container-login {
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
      }

      .login-box {
        width: 420px;
        background: #ffffff;
        padding: 30px 40px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
      }

      .login-header {
        text-align: center;
      }

      .tag {
        display: inline-block;
        padding: 6px 18px;
        border-radius: 25px;
        background: #b51212;
        color: white;
        font-size: 13px;
        margin-bottom: 15px;
        font-weight: 600;
      }

      .avatar img {
        width: 85px;
        margin-bottom: 10px;
        filter: hue-rotate(-20deg) saturate(2);
      }

      h2 {
        font-size: 24px;
        margin-bottom: 4px;
        color: #9b0d0d;
      }

      p {
        font-size: 14px;
        color: #444;
        margin-bottom: 18px;
      }
      .form label {
        font-size: 14px;
        font-weight: 600;
        margin: 10px 0 5px;
        display: block;
        color: #7f0a0a;
      }

      .form input {
        width: 100%;
        padding: 12px;
        font-size: 15px;
        border-radius: 10px;
        border: 1px solid #d0d0d0;
        outline: none;
        margin-bottom: 15px;
      }

      .form input:focus {
        border-color: #cc1b1b;
        box-shadow: 0 0 5px rgba(204, 27, 27, 0.5);
      }

      button {
        width: 100%;
        padding: 12px;
        background: #d62828;
        color: white;
        font-size: 16px;
        border-radius: 10px;
        border: none;
        cursor: pointer;
        transition: 0.25s;
        font-weight: 600;
        margin-bottom: 10px;
      }

      button:hover {
        background: #b51313;
      }

      .btn-register {
        background: #ffffff;
        color: #d62828;
        border: 2px solid #d62828;
        font-weight: 600;
      }

      .btn-register:hover {
        background: #ffe5e5;
      }

    </style>
  </head>
  <body>

  <div class="container-login">
    <div class="login-box">
      <div class="login-header">
        <div class="tag">ADMINISTRATOR</div>
        <div class="avatar">
          <img src="https://img.icons8.com/ios-filled/100/user-shield.png"/>
        </div>
        <h2>Đăng Nhập Quản Trị</h2>
        <p>Khu vực quản trị hệ thống</p>
      </div>

      <form action="/login" method="post" class="form">
        <label>Tên đăng nhập</label>
        <input type="text" name="username" placeholder="Nhập tên đăng nhập" required>
        <label>Mật khẩu</label>
        <input type="password" name="password" placeholder="Nhập mật khẩu" required>
        <button type="submit">Đăng nhập</button>
        <a href="/view/register.jsp">
          <button type="button" class="btn-register">Đăng ký</button>
        </a>
      </form>
    </div>
  </div>

  </body>
  </html>
