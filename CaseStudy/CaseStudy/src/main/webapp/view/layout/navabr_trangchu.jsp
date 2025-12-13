<%--
  Created by IntelliJ IDEA.
  User: LE NHAT
  Date: 11/12/2025
  Time: 8:20 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Top Bar -->
<div class="top-bar">
  <div class="top-bar-container">
    <div>📞 Gọi mua hàng: 0985.732.619</div>
    <div>
      <a href="#">Tra cứu đơn hàng</a>
<%--      <a href="#">Tuyển dụng</a>--%>
      <a href="#">Hướng dẫn mua hàng</a>
    </div>
  </div>
</div>

<!-- Header -->
<header>
  <div class="header-container">
    <a href="index.html" class="logo">
      <span>Apple Store</span>
    </a>

    <div class="search-container">
      <div class="search-box">
        <input type="text" placeholder="Bạn cần tìm gì?">
        <button>Tìm kiếm</button>
      </div>
    </div>

    <div class="header-actions">
      <a href="/view/register.jsp" class="header-btn">
        <span class="header-btn-icon">📝<span class="cart-badge"></span></span>
        <span>Đăng ký</span>
      </a>
      <a href="/view/login.jsp" class="header-btn">
        <span class="header-btn-icon">👤</span>
        <span>Đăng nhập</span>
      </a>
    </div>
  </div>
</header>
