<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="trangchu.jsp">
            <i class="bi bi-shop"></i> Cửa Hàng Online
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="trangchu.jsp">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="giohang?action=view">
                        <i class="bi bi-cart3"></i> Giỏ Hàng
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="donhang?action=list">
                        <i class="bi bi-box2-heart"></i> Đơn Hàng
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                        <i class="bi bi-person-circle"></i>
                        <c:if test="${not empty sessionScope.user}">
                            ${sessionScope.user.tenTaiKhoan}
                        </c:if>
                        <c:if test="${empty sessionScope.user}">
                            Tài Khoản
                        </c:if>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <c:if test="${not empty sessionScope.user}">
                            <li><a class="dropdown-item" href="taikhoan?action=profile">Hồ Sơ Cá Nhân</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="taikhoan?action=logout">Đăng Xuất</a></li>
                        </c:if>
                        <c:if test="${empty sessionScope.user}">
                            <li><a class="dropdown-item" href="login.jsp">Đăng Nhập</a></li>
                            <li><a class="dropdown-item" href="register.jsp">Đăng Ký</a></li>
                        </c:if>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<style>
    .navbar-brand {
        font-size: 1.5rem;
        letter-spacing: 0.5px;
    }
    .navbar-brand:hover {
        color: #ffc107 !important;
    }
    .nav-link {
        transition: color 0.3s ease;
        margin: 0 5px;
    }
    .nav-link:hover {
        color: #ffc107 !important;
    }
</style>
