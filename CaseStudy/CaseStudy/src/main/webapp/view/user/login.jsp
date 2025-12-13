<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng Nhập - Cửa Hàng Điện Thoại</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      display: flex;
      align-items: center;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .login-container {
      max-width: 450px;
      margin: 50px auto;
    }

    .login-card {
      background: white;
      border-radius: 20px;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
      overflow: hidden;
    }

    .login-header {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      padding: 40px;
      text-align: center;
    }

    .login-header h2 {
      margin: 0;
      font-size: 32px;
      font-weight: 600;
    }

    .login-header p {
      margin: 10px 0 0 0;
      opacity: 0.9;
      font-size: 15px;
    }

    .login-body {
      padding: 40px;
    }

    .form-group {
      margin-bottom: 25px;
    }

    .form-label {
      font-weight: 600;
      color: #333;
      margin-bottom: 8px;
    }

    .form-control {
      border: 2px solid #e0e0e0;
      border-radius: 10px;
      padding: 12px 15px;
      font-size: 15px;
      transition: all 0.3s ease;
    }

    .form-control:focus {
      border-color: #667eea;
      box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
    }

    .input-group-text {
      background: white;
      border: 2px solid #e0e0e0;
      border-right: none;
      border-radius: 10px 0 0 10px;
      color: #667eea;
    }

    .input-group .form-control {
      border-left: none;
      border-radius: 0 10px 10px 0;
    }

    .password-toggle {
      cursor: pointer;
      padding: 12px 15px;
      background: white;
      border: 2px solid #e0e0e0;
      border-left: none;
      border-radius: 0 10px 10px 0;
      color: #667eea;
    }

    .btn-login {
      width: 100%;
      padding: 14px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      border: none;
      border-radius: 10px;
      color: white;
      font-size: 16px;
      font-weight: 600;
      transition: transform 0.2s ease;
    }

    .btn-login:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
    }

    .remember-forgot {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
    }

    .form-check-label {
      color: #666;
      font-size: 14px;
    }

    .forgot-link {
      color: #667eea;
      text-decoration: none;
      font-size: 14px;
      font-weight: 600;
    }

    .forgot-link:hover {
      text-decoration: underline;
    }

    .register-link {
      text-align: center;
      margin-top: 25px;
      padding-top: 25px;
      border-top: 1px solid #e0e0e0;
      color: #666;
    }

    .register-link a {
      color: #667eea;
      text-decoration: none;
      font-weight: 600;
    }

    .register-link a:hover {
      text-decoration: underline;
    }

    .divider {
      display: flex;
      align-items: center;
      margin: 25px 0;
      color: #999;
      font-size: 14px;
    }

    .divider::before,
    .divider::after {
      content: '';
      flex: 1;
      height: 1px;
      background: #e0e0e0;
    }

    .divider span {
      padding: 0 15px;
    }

    .social-login {
      display: flex;
      gap: 10px;
    }

    .btn-social {
      flex: 1;
      padding: 12px;
      border: 2px solid #e0e0e0;
      border-radius: 10px;
      background: white;
      color: #666;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .btn-social:hover {
      border-color: #667eea;
      color: #667eea;
      transform: translateY(-2px);
    }
  </style>
</head>
<body>
<div class="container">
  <div class="login-container">
    <div class="login-card">
      <div class="login-header">
        <i class="fas fa-mobile-alt fa-4x mb-3"></i>
        <h2>Đăng Nhập</h2>
        <p>Chào mừng trở lại! Đăng nhập để tiếp tục</p>
      </div>

      <div class="login-body">
        <form id="loginForm">
          <div class="form-group">
            <label class="form-label">Tên đăng nhập</label>
            <div class="input-group">
              <span class="input-group-text">
                <i class="fas fa-user"></i>
              </span>
              <input type="text" class="form-control" placeholder="Nhập tên đăng nhập" required>
            </div>
          </div>

          <div class="form-group">
            <label class="form-label">Mật khẩu</label>
            <div class="input-group">
              <span class="input-group-text">
                <i class="fas fa-lock"></i>
              </span>
              <input type="password" class="form-control" placeholder="Nhập mật khẩu" required>
              <span class="password-toggle">
                <i class="fas fa-eye"></i>
              </span>
            </div>
          </div>

          <div class="remember-forgot">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="remember">
              <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
            </div>
            <a href="#" class="forgot-link">Quên mật khẩu?</a>
          </div>

          <button type="submit" class="btn btn-login">
            <i class="fas fa-sign-in-alt me-2"></i>Đăng Nhập
          </button>

          <div class="divider"><span>Hoặc đăng nhập với</span></div>

          <div class="social-login">
            <button type="button" class="btn btn-social">
              <i class="fab fa-google"></i>Google
            </button>
            <button type="button" class="btn btn-social">
              <i class="fab fa-facebook-f"></i>Facebook
            </button>
          </div>

          <div class="register-link">
            Chưa có tài khoản? <a href="register.html">Đăng ký ngay</a>
          </div>
        </form>
      </div>

    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
