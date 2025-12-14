<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đơn Hàng Của Tôi</title>
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
        .order-container {
            background: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .order-card {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }
        .order-card:hover {
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transform: translateY(-2px);
        }
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 15px;
        }
        .order-id {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }
        .order-date {
            color: #666;
            font-size: 0.9rem;
        }
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
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
        .order-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-bottom: 15px;
        }
        .detail-item {
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 6px;
        }
        .detail-label {
            font-size: 0.85rem;
            color: #666;
            text-transform: uppercase;
            font-weight: 600;
        }
        .detail-value {
            font-size: 1rem;
            color: #333;
            font-weight: 500;
            margin-top: 5px;
        }
        .order-total {
            font-size: 1.3rem;
            color: #ff6b6b;
            font-weight: bold;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        .btn-action {
            padding: 8px 16px;
            font-size: 0.9rem;
            border-radius: 6px;
        }
        .empty-order {
            text-align: center;
            padding: 60px 20px;
        }
        .empty-icon {
            font-size: 4rem;
            color: #ccc;
            margin-bottom: 20px;
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
        <div class="order-container">
            <div class="d-flex align-items-center mb-4">
                <h2 class="mb-0"><i class="bi bi-box2-heart"></i> Đơn Hàng Của Tôi</h2>
                <c:if test="${not empty donHangList}">
                    <span class="badge bg-info ms-2">${donHangList.size()} đơn hàng</span>
                </c:if>
            </div>

            <c:if test="${empty donHangList}">
                <div class="empty-order">
                    <div class="empty-icon">
                        <i class="bi bi-inbox"></i>
                    </div>
                    <h4>Chưa có đơn hàng</h4>
                    <p class="text-muted">Bạn chưa đặt đơn hàng nào</p>
                    <a href="trangchu.jsp" class="btn btn-primary mt-3">
                        <i class="bi bi-shop"></i> Bắt đầu mua sắm
                    </a>
                </div>
            </c:if>

            <c:if test="${not empty donHangList}">
                <c:forEach var="donHang" items="${donHangList}">
                    <div class="order-card">
                        <div class="order-header">
                            <div>
                                <div class="order-id">Đơn hàng #${donHang.maDonHang}</div>
                                <div class="order-date">
                                    <fmt:formatDate value="${donHang.ngayDat}" pattern="dd/MM/yyyy HH:mm" />
                                </div>
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

                        <div class="order-details">
                            <div class="detail-item">
                                <div class="detail-label">Địa Chỉ Giao</div>
                                <div class="detail-value">${donHang.diaChiGiao}</div>
                            </div>
                            <div class="detail-item">
                                <div class="detail-label">Phương Thức</div>
                                <div class="detail-value">
                                    <c:choose>
                                        <c:when test="${donHang.phuongThucThanhToan == 'COD'}">
                                            <i class="bi bi-cash-coin"></i> Thanh Toán Khi Nhận
                                        </c:when>
                                        <c:when test="${donHang.phuongThucThanhToan == 'ONLINE'}">
                                            <i class="bi bi-credit-card"></i> Chuyển Khoản
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="detail-item">
                                <div class="detail-label">Tổng Tiền</div>
                                <div class="detail-value order-total">
                                    <fmt:formatNumber value="${donHang.tongTien}" pattern="###,###,###" />đ
                                </div>
                            </div>
                        </div>

                        <c:if test="${not empty donHang.ghiChu}">
                            <div style="background-color: #f8f9fa; padding: 10px; border-radius: 6px; margin-bottom: 15px;">
                                <small class="text-muted">
                                    <i class="bi bi-chat-quote"></i> Ghi chú: ${donHang.ghiChu}
                                </small>
                            </div>
                        </c:if>

                        <div class="action-buttons">
                            <a href="donhang?action=detail&maDonHang=${donHang.maDonHang}" class="btn btn-sm btn-primary btn-action">
                                <i class="bi bi-eye"></i> Xem Chi Tiết
                            </a>
                            <c:if test="${donHang.trangThai == 'PENDING'}">
                                <form method="POST" action="donhang?action=huy" style="display: inline;">
                                    <input type="hidden" name="maDonHang" value="${donHang.maDonHang}">
                                    <button type="submit" class="btn btn-sm btn-danger btn-action" onclick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng?')">
                                        <i class="bi bi-x-circle"></i> Hủy Đơn
                                    </button>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
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
