<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/12/2025
  Time: 6:52 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng nhập & Đăng ký - Cửa hàng điện thoại</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background: linear-gradient(135deg, #0a0a0a 0%, #1a0505 50%, #0a0a0a 100%);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: 'Poppins', sans-serif;
      padding: 40px 20px;
      position: relative;
      overflow: hidden;
    }

    body::before {
      content: '';
      position: absolute;
      width: 800px;
      height: 800px;
      background: radial-gradient(circle, rgba(220, 38, 38, 0.2) 0%, transparent 70%);
      top: -400px;
      right: -200px;
      border-radius: 50%;
      animation: pulse 10s ease-in-out infinite;
    }

    body::after {
      content: '';
      position: absolute;
      width: 600px;
      height: 600px;
      background: radial-gradient(circle, rgba(153, 27, 27, 0.15) 0%, transparent 70%);
      bottom: -300px;
      left: -200px;
      border-radius: 50%;
      animation: pulse 12s ease-in-out infinite reverse;
    }

    @keyframes pulse {
      0%, 100% { transform: scale(1); opacity: 0.5; }
      50% { transform: scale(1.2); opacity: 0.8; }
    }

    /* iPhone Frame */
    .iphone-frame {
      width: 420px;
      height: 860px;
      background: linear-gradient(145deg, #1c1c1e 0%, #000000 100%);
      border-radius: 55px;
      padding: 12px;
      box-shadow:
              0 30px 80px rgba(0, 0, 0, 0.9),
              0 0 0 2px #2c2c2e,
              inset 0 0 0 1px rgba(255, 255, 255, 0.1);
      position: relative;
      z-index: 1;
    }

    /* Dynamic Island */
    .dynamic-island {
      position: absolute;
      top: 18px;
      left: 50%;
      transform: translateX(-50%);
      width: 120px;
      height: 37px;
      background: #000000;
      border-radius: 20px;
      z-index: 100;
      box-shadow:
              0 4px 10px rgba(0, 0, 0, 0.5),
              inset 0 1px 2px rgba(255, 255, 255, 0.05);
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .camera-dot {
      width: 8px;
      height: 8px;
      background: radial-gradient(circle, #1a1a2e 0%, #000 100%);
      border-radius: 50%;
      margin: 0 8px;
      box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.8);
    }

    .camera-lens {
      width: 12px;
      height: 12px;
      background: radial-gradient(circle, #0f3460 0%, #000 100%);
      border-radius: 50%;
      margin: 0 4px;
      box-shadow:
              inset 0 0 5px rgba(0, 0, 0, 0.8),
              0 0 3px rgba(16, 52, 96, 0.3);
    }

    /* Screen */
    .iphone-screen {
      width: 100%;
      height: 100%;
      background: linear-gradient(180deg, #000000 0%, #0a0a0a 100%);
      border-radius: 45px;
      overflow-y: auto;
      overflow-x: hidden;
      position: relative;
      box-shadow: inset 0 0 20px rgba(0, 0, 0, 0.5);
    }

    .iphone-screen::-webkit-scrollbar {
      width: 3px;
    }

    .iphone-screen::-webkit-scrollbar-track {
      background: transparent;
    }

    .iphone-screen::-webkit-scrollbar-thumb {
      background: rgba(220, 38, 38, 0.3);
      border-radius: 10px;
    }

    /* Content */
    .screen-content {
      padding: 70px 30px 40px;
      min-height: 100%;
    }

    .logo-section {
      text-align: center;
      margin-bottom: 40px;
    }

    .logo-icon {
      width: 80px;
      height: 80px;
      background: linear-gradient(135deg, #dc2626 0%, #991b1b 100%);
      border-radius: 20px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      font-size: 2.5rem;
      color: white;
      margin-bottom: 15px;
      box-shadow:
              0 10px 30px rgba(220, 38, 38, 0.5),
              inset 0 1px 0 rgba(255, 255, 255, 0.2);
      animation: float 3s ease-in-out infinite;
    }

    @keyframes float {
      0%, 100% { transform: translateY(0px); }
      50% { transform: translateY(-10px); }
    }

    .logo-text {
      color: white;
      font-size: 1.8rem;
      font-weight: 700;
      margin: 0;
      letter-spacing: 1px;
    }

    .logo-subtitle {
      color: rgba(255, 255, 255, 0.6);
      font-size: 0.85rem;
      margin-top: 5px;
    }

    /* Tabs */
    .auth-tabs {
      display: flex;
      background: rgba(30, 30, 30, 0.5);
      border-radius: 15px;
      padding: 5px;
      margin-bottom: 30px;
    }

    .tab-btn {
      flex: 1;
      padding: 12px;
      border: none;
      background: transparent;
      color: rgba(255, 255, 255, 0.5);
      font-weight: 600;
      font-size: 0.9rem;
      border-radius: 12px;
      cursor: pointer;
      transition: all 0.3s ease;
      letter-spacing: 0.5px;
    }

    .tab-btn.active {
      background: linear-gradient(135deg, #dc2626 0%, #991b1b 100%);
      color: white;
      box-shadow: 0 5px 15px rgba(220, 38, 38, 0.4);
    }

    /* Forms */
    .form-section {
      display: none;
    }

    .form-section.active {
      display: block;
      animation: slideIn 0.4s ease;
    }

    @keyframes slideIn {
      from {
        opacity: 0;
        transform: translateX(20px);
      }
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-label {
      color: rgba(255, 255, 255, 0.8);
      font-size: 0.85rem;
      font-weight: 500;
      margin-bottom: 8px;
      display: block;
      letter-spacing: 0.3px;
    }

    .input-wrapper {
      position: relative;
    }

    .input-icon {
      position: absolute;
      left: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #dc2626;
      font-size: 1rem;
      z-index: 1;
    }

    .form-control {
      width: 100%;
      padding: 14px 15px 14px 45px;
      background: rgba(30, 30, 30, 0.6);
      border: 1px solid rgba(220, 38, 38, 0.3);
      border-radius: 12px;
      color: white;
      font-size: 0.9rem;
      transition: all 0.3s ease;
    }

    .form-control::placeholder {
      color: rgba(255, 255, 255, 0.3);
    }

    .form-control:focus {
      outline: none;
      background: rgba(30, 30, 30, 0.8);
      border-color: #dc2626;
      box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.15);
    }

    .form-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
    }

    .remember-forgot {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin: 15px 0 25px;
      font-size: 0.85rem;
    }

    .custom-checkbox {
      display: flex;
      align-items: center;
      color: rgba(255, 255, 255, 0.7);
      cursor: pointer;
    }

    .custom-checkbox input {
      width: 18px;
      height: 18px;
      margin-right: 8px;
      accent-color: #dc2626;
    }

    .forgot-link {
      color: #dc2626;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .forgot-link:hover {
      color: #ef4444;
    }

    .btn-submit {
      width: 100%;
      padding: 15px;
      background: linear-gradient(135deg, #dc2626 0%, #991b1b 100%);
      border: none;
      border-radius: 12px;
      color: white;
      font-weight: 600;
      font-size: 0.95rem;
      letter-spacing: 1px;
      text-transform: uppercase;
      cursor: pointer;
      transition: all 0.4s ease;
      box-shadow: 0 8px 20px rgba(220, 38, 38, 0.4);
      position: relative;
      overflow: hidden;
    }

    .btn-submit::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
      transition: left 0.6s;
    }

    .btn-submit:hover::before {
      left: 100%;
    }

    .btn-submit:active {
      transform: scale(0.98);
    }

    .divider {
      display: flex;
      align-items: center;
      margin: 25px 0;
    }

    .divider::before,
    .divider::after {
      content: '';
      flex: 1;
      height: 1px;
      background: rgba(220, 38, 38, 0.2);
    }

    .divider span {
      padding: 0 15px;
      color: rgba(255, 255, 255, 0.5);
      font-size: 0.8rem;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .social-login {
      display: flex;
      gap: 15px;
      justify-content: center;
    }

    .social-btn {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      border: 1px solid rgba(220, 38, 38, 0.3);
      background: rgba(30, 30, 30, 0.6);
      color: #dc2626;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.2rem;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }

    .social-btn:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(220, 38, 38, 0.4);
    }

    .social-btn.facebook:hover {
      background: #3b5998;
      border-color: #3b5998;
      color: white;
    }

    .social-btn.google:hover {
      background: #dc2626;
      border-color: #dc2626;
      color: white;
    }

    .terms-text {
      text-align: center;
      color: rgba(255, 255, 255, 0.5);
      font-size: 0.75rem;
      margin-top: 20px;
      line-height: 1.5;
    }

    .terms-text a {
      color: #dc2626;
      text-decoration: none;
    }

    /* Side buttons */
    .side-button {
      position: absolute;
      background: linear-gradient(90deg, #2c2c2e 0%, #1c1c1e 100%);
      border-radius: 3px;
    }

    .power-button {
      right: -3px;
      top: 200px;
      width: 3px;
      height: 80px;
    }

    .volume-up {
      left: -3px;
      top: 180px;
      width: 3px;
      height: 50px;
    }

    .volume-down {
      left: -3px;
      top: 240px;
      width: 3px;
      height: 50px;
    }

    .action-button {
      left: -3px;
      top: 300px;
      width: 3px;
      height: 50px;
    }

    /* Responsive */
    @media (max-width: 500px) {
      .iphone-frame {
        width: 360px;
        height: 780px;
      }

      .screen-content {
        padding: 60px 25px 30px;
      }

      .logo-icon {
        width: 70px;
        height: 70px;
        font-size: 2rem;
      }

      .logo-text {
        font-size: 1.5rem;
      }
    }
    .logo-icon {
      width: 80px;
      height: 80px;
      background: none; /* Bỏ nền đỏ nếu không cần */
      border-radius: 20px;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 0;
    }

    .logo-icon img.logo-img {
      width: 100%;
      height: 100%;
      object-fit: cover; /* Cắt ảnh cho đầy khung */
      border-radius: 20px;
    }
    .logo-icon {
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .logo-icon img.logo-img {
      width: 65px;
      height: 65px;
      border-radius: 15px;
      object-fit: cover;
    }


  </style>
</head>
<body>
<!-- iPhone 17 Pro Max Frame -->
<div class="iphone-frame">
  <!-- Dynamic Island -->
  <div class="dynamic-island">
    <div class="camera-dot"></div>
    <div class="camera-lens"></div>
  </div>

  <!-- Side Buttons -->
  <div class="side-button power-button"></div>
  <div class="side-button volume-up"></div>
  <div class="side-button volume-down"></div>
  <div class="side-button action-button"></div>

  <!-- Screen -->
  <div class="iphone-screen">
    <div class="screen-content">
      <!-- Logo -->
      <div class="logo-section">
        <div class="logo-icon">
          <img src="https://cdn.tgdd.vn/Files/2023/06/21/1535189/1-210623-125514-800-resize.jpg" class="logo-img">
        </div>

        <!--                <div class="logo-icon">-->
        <!--                    <img src="https://cdn.tgdd.vn/Files/2023/06/21/1535189/1-210623-125514-800-resize.jpg">-->
        <!--                    <i class="fas fa-mobile-alt"></i>-->
        <!--                </div>-->
        <h1 class="logo-text">Nhất Trung Hưng Store</h1>
        <p class="logo-subtitle">Premium Mobile Shop</p>
      </div>

      <!-- Tabs -->
      <div class="auth-tabs">
        <button class="tab-btn active" onclick="showLogin()">Đăng nhập</button>
        <button class="tab-btn" onclick="">Đăng ký</button>
      </div>

      <!-- Login Form -->
      <div id="loginForm" class="form-section active">
        <form onsubmit="handleLogin(event)">
          <div class="form-group">
            <label class="form-label">Email hoặc Số điện thoại</label>
            <div class="input-wrapper">
              <i class="fas fa-user input-icon"></i>
              <input type="text" class="form-control" placeholder="Nhập email hoặc số điện thoại" required>
            </div>
          </div>

          <div class="form-group">
            <label class="form-label">Mật khẩu</label>
            <div class="input-wrapper">
              <i class="fas fa-lock input-icon"></i>
              <input type="password" class="form-control" placeholder="Nhập mật khẩu" required>
            </div>
          </div>

          <div class="remember-forgot">
            <label class="custom-checkbox">
              <input type="checkbox" id="remember">
              <span>Ghi nhớ</span>
            </label>
            <a href="#" class="forgot-link">Quên mật khẩu?</a>
          </div>

          <button type="submit" class="btn-submit">
            <i class="fas fa-sign-in-alt"></i> Đăng nhập
          </button>

          <div class="divider">
            <span>Hoặc</span>
          </div>

          <div class="social-login">
            <button type="button" class="social-btn facebook">
              <i class="fab fa-facebook-f"></i>
            </button>
            <button type="button" class="social-btn google">
              <i class="fab fa-google"></i>
            </button>
          </div>
        </form>
      </div>

      <!-- Register Form -->
      <div id="registerForm" class="form-section">
        <form onsubmit="handleRegister(event)">
          <div class="form-row">
            <div class="form-group">
              <label class="form-label">Họ và tên</label>
              <div class="input-wrapper">
                <i class="fas fa-user input-icon"></i>
                <input type="text" class="form-control" placeholder="Họ tên" required>
              </div>
            </div>

            <div class="form-group">
              <label class="form-label">Số điện thoại</label>
              <div class="input-wrapper">
                <i class="fas fa-phone input-icon"></i>
                <input type="tel" class="form-control" placeholder="Số ĐT" required>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="form-label">Email</label>
            <div class="input-wrapper">
              <i class="fas fa-envelope input-icon"></i>
              <input type="email" class="form-control" placeholder="Nhập email" required>
            </div>
          </div>

          <div class="form-group">
            <label class="form-label">Mật khẩu</label>
            <div class="input-wrapper">
              <i class="fas fa-lock input-icon"></i>
              <input type="password" class="form-control" placeholder="Nhập mật khẩu" required>
            </div>
          </div>

          <div class="form-group">
            <label class="form-label">Xác nhận mật khẩu</label>
            <div class="input-wrapper">
              <i class="fas fa-lock input-icon"></i>
              <input type="password" class="form-control" placeholder="Nhập lại mật khẩu" required>
            </div>
          </div>

          <div class="remember-forgot" style="justify-content: flex-start;">
            <label class="custom-checkbox">
              <input type="checkbox" required>
              <span style="font-size: 0.8rem;">Tôi đồng ý với điều khoản dịch vụ</span>
            </label>
          </div>

          <button type="submit" class="btn-submit">
            <i class="fas fa-user-plus"></i> Đăng ký
          </button>

          <div class="divider">
            <span>Hoặc</span>
          </div>

          <div class="social-login">
            <button type="button" class="social-btn facebook">
              <i class="fab fa-facebook-f"></i>
            </button>
            <button type="button" class="social-btn google">
              <i class="fab fa-google"></i>
            </button>
          </div>

          <div class="terms-text">
            Bằng việc đăng ký, bạn đồng ý với<br>
            <a href="#">Điều khoản dịch vụ</a> và <a href="#">Chính sách bảo mật</a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
<script>
  function showLogin() {
    document.getElementById('loginForm').classList.add('active');
    document.getElementById('registerForm').classList.remove('active');

    const tabs = document.querySelectorAll('.tab-btn');
    tabs[0].classList.add('active');
    tabs[1].classList.remove('active');
  }

  function showRegister() {
    document.getElementById('registerForm').classList.add('active');
    document.getElementById('loginForm').classList.remove('active');

    const tabs = document.querySelectorAll('.tab-btn');
    tabs[1].classList.add('active');
    tabs[0].classList.remove('active');
  }

  function handleLogin(event) {
    event.preventDefault();
    alert('Đăng nhập thành công! 🎉');
  }

  function handleRegister(event) {
    event.preventDefault();
    alert('Đăng ký thành công! 🎉');
  }
</script>
</body>
</html>
