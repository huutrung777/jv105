<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký Quản Trị</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            background: linear-gradient(135deg, #7d0a0a, #b51212);
            font-family: "Poppins", sans-serif;
        }

        .container-register {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .register-box {
            width: 450px;
            background: #ffffff;
            padding: 35px 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        }

        .register-header {
            text-align: center;
            margin-bottom: 15px;
        }

        .tag {
            display: inline-block;
            padding: 6px 18px;
            border-radius: 25px;
            background: #b51212;
            color: white;
            font-size: 13px;
            margin-bottom: 12px;
            font-weight: 600;
        }

        h2 {
            font-size: 24px;
            color: #9b0d0d;
            margin-bottom: 8px;
        }

        p {
            font-size: 14px;
            color: #555;
            margin-bottom: 18px;
        }

        .form label {
            font-size: 15px;
            font-weight: 600;
            margin: 10px 0 5px;
            color: #7f0a0a;
            display: block;
        }

        .form input {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 15px;
            outline: none;
            margin-bottom: 15px;
        }

        .form input:focus {
            border-color: #d62828;
            box-shadow: 0 0 5px rgba(214, 40, 40, 0.5);
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
            transition: 0.2s;
            font-weight: 600;
            margin-top: 10px;
        }

        button:hover {
            background: #b51212;
        }

        .error {
            background: #ffd1d1;
            border: 1px solid #ffb2b2;
            padding: 10px;
            border-radius: 10px;
            color: #b10000;
            margin-bottom: 12px;
            text-align: center;
            font-size: 14px;
        }

        .login-link {
            margin-top: 12px;
            text-align: center;
            font-size: 14px;
        }

        .login-link a {
            color: #b51212;
            font-weight: 600;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

<div class="container-register">
    <div class="register-box">

        <div class="register-header">
            <div class="tag">ADMINISTRATOR</div>
            <h2>Đăng Ký Tài Khoản</h2>
            <p>Chỉ dành cho quản trị viên hệ thống</p>
        </div>
        <form action="/register" method="post" class="form">
            <label>Tên đăng nhập</label>
            <input type="text" name="username" placeholder="Nhập tên đăng nhập" required>
            <label>Email</label>
            <input type="email" name="email" placeholder="Nhập Email" required>
            <label>Mật khẩu</label>
            <input type="password" name="password" placeholder="Nhập mật khẩu" required>
            <label>Nhập lại mật khẩu</label>
            <input type="password" name="confirm" placeholder="Nhập lại mật khẩu" required>
            <button type="submit">Đăng ký</button>
        </form>

        <div class="login-link">
            Đã có tài khoản?
            <a href="/view/admin/login_admin.jsp">Đăng nhập ngay</a>
        </div>

    </div>
</div>

</body>
</html>
