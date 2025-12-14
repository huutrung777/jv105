<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Đơn Hàng</title>
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
        .detail-container {
            background: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .order-info-section {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            border-left: 4px solid #667eea;
        }
        .info-row {
            display: flex;
            gap: 30px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }
        .info-item {
            flex: 1;
            min-width: 200px;
        }
        .info-label {
            font-size: 0.85rem;
            color: #666;
            text-transform: uppercase;
            font-weight: 600;
        }
        .info-value {
            font-size: 1rem;
            color: #333;
            font-weight: 500;
            margin-top: 5px;
        }
        .status-badge {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.9rem;
        }
        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }
        .status-confirmed {
            background-color: #d1ecf1;
            color: #0c5460;
        }
        .status-shipping {
            background-color: #cfe2ff;
            color: #084298;
        }
        .status-delivered {
            background-color: #d1e7dd;
            color: #0f5132;
        }
        .status-cancelled {
            background-color: #f8d7da;
            color: #842029;
        }
        .items-table {
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 30px;
        }
        .price {
            color: #ff6b6b;
            font-weight: 600;
        }
        .summary-section {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
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
            padding: 15px 0;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .btn-action {
            padding: 10px 20px;
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
        <div class="detail-container">
            <div class="d-flex align-items-center justify-content-between mb-4">
                <div>
                    <h2 class="mb-0"><i class="bi bi-receipt"></i> Chi Tiết Đơn Hàng #${donHang.maDonHang}</h2>
                    <small class="text-muted">
                        <fmt:formatDate value="${donHang.ngayDat}" pattern="dd/MM/yyyy HH:mm" />
                    </small>
                </div>
                <span class="status-badge status-${donHang.trangThai.toLowerCase()}">
                    <c:choose>
                        <c:when test="${donHang.trangThai == 'PENDING'}">Chờ Xác Nhận</c:when>
                        <c:when test="${donHang.trangThai == 'CONFIRMED'}">Đã Xác Nhận</c:when>
                        <c:when test="${donHang.trangThai == 'SHIPPING'}">Đang Giao</c:when>
                        <c:when test="${donHang.trangThai == 'DELIVERED'}">Đã Giao</c:when>
                        <c:when test="${donHang.trangThai == 'CANCELLED'}">Đã Hủy</c:when>
                    </c:choose>
                </span>
            </div>

            <div class="order-info-section">
                <h5 class="mb-4"><i class="bi bi-info-circle"></i> Thông Tin Đơn Hàng</h5>
                <div class="info-row">
                    <div class="info-item">
                        <div class="info-label">Địa Chỉ Giao Hàng</div>
                        <div class="info-value">${donHang.diaChiGiao}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Phương Thức Thanh Toán</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${donHang.phuongThucThanhToan == 'COD'}">
                                    <i class="bi bi-cash-coin"></i> Thanh Toán Khi Nhận
                                </c:when>
                                <c:when test="${donHang.phuongThucThanhToan == 'ONLINE'}">
                                    <i class="bi bi-credit-card"></i> Chuyển Khoản Trực Tuyến
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty donHang.ghiChu}">
                    <div class="info-item">
                        <div class="info-label">Ghi Chú</div>
                        <div class="info-value" style="font-style: italic;">"${donHang.ghiChu}"</div>
                    </div>
                </c:if>
            </div>

            <h5 class="mb-3"><i class="bi bi-basket"></i> Danh Sách Sản Phẩm</h5>
            <div class="table-responsive items-table">
                <table class="table table-hover mb-0">
                    <thead class="table-light">
                        <tr>
                            <th style="width: 30%;">Sản Phẩm</th>
                            <th style="width: 15%;" class="text-center">Đơn Giá</th>
                            <th style="width: 15%;" class="text-center">Số Lượng</th>
                            <th style="width: 20%;" class="text-center">Thành Tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="chiTiet" items="${chiTietList}">
                            <tr>
                                <td>
                                    <span style="font-weight: 500;">Sản Phẩm ID: ${chiTiet.maSanPham}</span>
                                </td>
                                <td class="text-center">
                                    <span class="price">
                                        <fmt:formatNumber value="${chiTiet.gia}" pattern="###,###,###" />đ
                                    </span>
                                </td>
                                <td class="text-center">
                                    <strong>${chiTiet.soLuong}</strong>
                                </td>
                                <td class="text-center">
                                    <span class="price">
                                        <fmt:formatNumber value="${chiTiet.thanhTien}" pattern="###,###,###" />đ
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="summary-section">
                <h5 class="mb-3"><i class="bi bi-calculator"></i> Tóm Tắt Thanh Toán</h5>
                <div class="summary-row">
                    <span>Tạm Tính:</span>
                    <span class="price">
                        <fmt:formatNumber value="${donHang.tongTien}" pattern="###,###,###" />đ
                    </span>
                </div>
                <div class="summary-row">
                    <span>Phí Giao Hàng:</span>
                    <span>Miễn phí</span>
                </div>
                <div class="summary-row total">
                    <span>Tổng Cộng:</span>
                    <span>
                        <fmt:formatNumber value="${donHang.tongTien}" pattern="###,###,###" />đ
                    </span>
                </div>
            </div>

            <div class="action-buttons">
                <a href="donhang?action=list" class="btn btn-outline-secondary btn-action">
                    <i class="bi bi-arrow-left"></i> Quay Lại
                </a>
                <c:if test="${donHang.trangThai == 'PENDING'}">
                    <form method="POST" action="donhang?action=huy" style="display: inline;">
                        <input type="hidden" name="maDonHang" value="${donHang.maDonHang}">
                        <button type="submit" class="btn btn-danger btn-action" onclick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng này?')">
                            <i class="bi bi-x-circle"></i> Hủy Đơn Hàng
                        </button>
                    </form>
                </c:if>
            </div>
        </div>
    </div>
</main>

<footer>
    <div class="container">
        <p class="mb-0">&copy; 2025 Cửa Hàng Online. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
