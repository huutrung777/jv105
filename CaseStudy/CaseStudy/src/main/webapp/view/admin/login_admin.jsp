<%--
  Created by IntelliJ IDEA.
  User: LE NHAT
  Date: 11/12/2025
  Time: 7:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập Admin - Quản Trị Hệ Thống</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #1e3c72 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.05" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,138.7C960,139,1056,117,1152,106.7C1248,96,1344,96,1392,96L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
            background-size: cover;
            background-position: bottom;
        }

        .admin-login-container {
            max-width: 480px;
            margin: 50px auto;
            position: relative;
            z-index: 1;
        }

        .admin-card {
            background: white;
            border-radius: 25px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }

        .admin-header {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            color: white;
            padding: 45px 40px;
            text-align: center;
        }

        .admin-badge {
            display: inline-block;
            background: rgba(255, 255, 255, 0.2);
            padding: 8px 20px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 1px;
            margin-bottom: 15px;
        }

        .admin-icon {
            width: 80px;
            height: 80px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
        }

        .admin-icon i {
            color: #1e3c72;
            font-size: 36px;
        }

        .admin-body {
            padding: 45px 40px;
            background: #f8f9fa;
        }

        .security-notice {
            background: linear-gradient(135deg, #fff3cd 0%, #ffeaa7 100%);
            border-left: 4px solid #ffc107;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 30px;
            font-size: 13px;
            color: #856404;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 700;
            color: #1e3c72;
            margin-bottom: 10px;
            font-size: 13px;
            text-transform: uppercase;
        }

        .form-control {
            border: 2px solid #dee2e6;
            border-radius: 12px;
            padding: 14px 18px;
            background: white;
            font-size: 15px;
        }

        .input-group-text {
            background: white;
            border: 2px solid #dee2e6;
            border-right: none;
            border-radius: 12px 0 0 12px;
            color: #2a5298;
            padding: 14px 18px;
        }

        .password-toggle {
            cursor: pointer;
            padding: 14px 18px;
            background: white;
            border: 2px solid #dee2e6;
            border-left: none;
            border-radius: 0 12px 12px 0;
            color: #2a5298;
        }

        .btn-admin-login {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            border: none;
            border-radius: 12px;
            color: white;
            font-size: 16px;
            font-weight: 700;
        }

        .remember-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding: 15px;
            background: white;
            border-radius: 10px;
        }

        .footer-links {
            text-align: center;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 2px solid #dee2e6;
        }

        .footer-links a {
            color: #6c757d;
            text-decoration: none;
            font-size: 13px;
            margin: 0 10px;
        }

        .back-to-site {
            text-align: center;
            margin-top: 20px;
        }

        .back-to-site a {
            color: white;
            text-decoration: none;
            font-size: 14px;
            padding: 10px 20px;
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.2);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="admin-login-container">
        <div class="admin-card">
            <div class="admin-header">
                <div class="admin-badge">
                    <i class="fas fa-shield-alt"></i> ADMINISTRATOR
                </div>
                <div class="admin-icon">
                    <i class="fas fa-user-shield"></i>
                </div>
                <h2>Đăng Nhập Quản Trị</h2>
                <p>Khu vực quản trị hệ thống</p>
            </div>

            <div class="admin-body">
                <div class="security-notice">
                    <i class="fas fa-exclamation-triangle"></i>
                    <strong>Lưu ý bảo mật:</strong> Đây là khu vực dành riêng cho quản trị viên.
                </div>

                <!-- FORM HTML THUẦN -->
                <form>
                    <div class="form-group">
                        <label class="form-label"><i class="fas fa-user-circle me-1"></i> Tên đăng nhập</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" class="form-control" placeholder="Nhập tên đăng nhập">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label"><i class="fas fa-key me-1"></i> Mật khẩu</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" class="form-control" placeholder="Nhập mật khẩu">
                            <span class="password-toggle"><i class="fas fa-eye"></i></span>
                        </div>
                    </div>

                    <div class="remember-section">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox">
                            <label class="form-check-label">Ghi nhớ đăng nhập</label>
                        </div>
                        <a href="#" class="forgot-link"><i class="fas fa-question-circle me-1"></i>Quên mật khẩu?</a>
                    </div>

                    <button type="submit" class="btn btn-admin-login">
                        <i class="fas fa-sign-in-alt me-2"></i>Đăng Nhập
                    </button>

                    <div class="footer-links">
                        <a href="#"><i class="fas fa-phone-alt me-1"></i>Hỗ trợ kỹ thuật</a>
                        <span>|</span>
                        <a href="#"><i class="fas fa-book me-1"></i>Hướng dẫn</a>
                    </div>
                </form>
            </div>
        </div>

        <div class="back-to-site">
            <a href="#"><i class="fas fa-arrow-left"></i> Quay lại trang chủ</a>
        </div>
    </div>
</div>
</body>
</html>
