<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        main {
            flex: 1;
        }
        .cart-container {
            background: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .cart-item {
            border-bottom: 1px solid #eee;
            padding: 15px 0;
        }
        .cart-item:last-child {
            border-bottom: none;
        }
        .product-name {
            font-weight: 500;
            color: #333;
        }
        .quantity-control {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .quantity-control input {
            width: 70px;
            text-align: center;
        }
        .summary-box {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-top: 30px;
            border: 2px solid #e0e0e0;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        .summary-row.total {
            font-weight: bold;
            font-size: 1.2rem;
            border-bottom: none;
            color: #ff6b6b;
        }
        .btn-checkout {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 40px;
            font-weight: 600;
            margin-top: 20px;
            width: 100%;
        }
        .btn-checkout:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .btn-update {
            padding: 5px 15px;
            font-size: 0.875rem;
        }
        .btn-remove {
            padding: 5px 15px;
            font-size: 0.875rem;
        }
        .empty-cart {
            text-align: center;
            padding: 60px 20px;
        }
        .empty-cart-icon {
            font-size: 4rem;
            color: #ccc;
            margin-bottom: 20px;
        }
        .table-responsive {
            border-radius: 8px;
            overflow: hidden;
        }
        .price {
            color: #ff6b6b;
            font-weight: 600;
        }
        footer {
            background-color: #343a40;
            color: #adb5bd;
            padding: 30px 0;
            text-align: center;
            margin-top: auto;
        }
    </style>
</head>
<body>
<jsp:include page="layout/navbar.jsp"/>

<main>
    <div class="container mt-5">
        <div class="cart-container">
            <div class="d-flex align-items-center mb-4">
                <h2 class="mb-0"><i class="bi bi-cart3"></i> Giỏ Hàng Của Bạn</h2>
                <c:if test="${not empty gioHangList}">
                    <span class="badge bg-danger ms-2">${gioHangList.size()} sản phẩm</span>
                </c:if>
            </div>
            
            <c:if test="${empty gioHangList}">
                <div class="empty-cart">
                    <div class="empty-cart-icon">
                        <i class="bi bi-bag-x"></i>
                    </div>
                    <h4>Giỏ hàng trống</h4>
                    <p class="text-muted">Bạn chưa có sản phẩm nào trong giỏ hàng</p>
                    <a href="trangchu.jsp" class="btn btn-primary mt-3">
                        <i class="bi bi-shop"></i> Tiếp tục mua sắm
                    </a>
                </div>
            </c:if>

            <c:if test="${not empty gioHangList}">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th style="width: 30%;">Sản Phẩm</th>
                                        <th style="width: 15%;" class="text-center">Đơn Giá</th>
                                        <th style="width: 20%;" class="text-center">Số Lượng</th>
                                        <th style="width: 15%;" class="text-center">Thành Tiền</th>
                                        <th style="width: 20%;" class="text-center">Hành Động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${gioHangList}">
                                        <tr>
                                            <td>
                                                <span class="product-name">Sản Phẩm ID: ${item.maSanPham}</span>
                                            </td>
                                            <td class="text-center">
                                                <span class="price">
                                                    <fmt:formatNumber value="${item.gia}" pattern="###,###,###" />đ
                                                </span>
                                            </td>
                                            <td class="text-center">
                                                <form method="POST" action="giohang?action=update" class="quantity-control d-inline-flex" style="gap: 5px;">
                                                    <input type="hidden" name="maGioHang" value="${item.maGioHang}">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="number" name="soLuong" value="${item.soLuong}" min="1" max="999" style="width: 60px; text-align: center;">
                                                    <button type="submit" class="btn btn-sm btn-outline-primary btn-update">
                                                        <i class="bi bi-arrow-repeat"></i> Cập nhật
                                                    </button>
                                                </form>
                                            </td>
                                            <td class="text-center">
                                                <span class="price">
                                                    <fmt:formatNumber value="${item.soLuong * item.gia}" pattern="###,###,###" />đ
                                                </span>
                                            </td>
                                            <td class="text-center">
                                                <a href="giohang?action=remove&maGioHang=${item.maGioHang}" class="btn btn-sm btn-danger btn-remove" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">
                                                    <i class="bi bi-trash"></i> Xóa
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="summary-box">
                            <h5 class="mb-3"><i class="bi bi-calculator"></i> Tóm Tắt</h5>
                            <div class="summary-row">
                                <span>Tổng số sản phẩm:</span>
                                <strong>${gioHangList.size()}</strong>
                            </div>
                            <div class="summary-row total">
                                <span>Tổng cộng:</span>
                                <span>
                                    <fmt:formatNumber value="${tongTien}" pattern="###,###,###" />đ
                                </span>
                            </div>
                            <a href="donhang?action=thanhtoan" class="btn btn-checkout btn-lg">
                                <i class="bi bi-credit-card"></i> Thanh Toán
                            </a>
                            <a href="trangchu.jsp" class="btn btn-outline-secondary w-100 mt-2">
                                <i class="bi bi-arrow-left"></i> Tiếp tục mua sắm
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</main>

<footer>
    <div class="container">
        <p class="mb-0">&copy; 2025 Cửa Hàng Online. All rights reserved.</p>
    </div>
</footer>


