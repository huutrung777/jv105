<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán</title>
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
        .checkout-container {
            background: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .form-section {
            margin-bottom: 30px;
            padding-bottom: 30px;
            border-bottom: 2px solid #eee;
        }
        .form-section:last-of-type {
            border-bottom: none;
        }
        .form-section h5 {
            color: #667eea;
            font-weight: 600;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .form-section h5 i {
            font-size: 1.3rem;
        }
        .payment-option {
            padding: 15px;
            border: 2px solid #ddd;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
            margin-bottom: 10px;
        }
        .payment-option:hover {
            border-color: #667eea;
            background-color: #f8f9ff;
        }
        .payment-option input[type="radio"]:checked + .payment-label {
            color: #667eea;
            font-weight: 600;
        }
        .payment-label {
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 0;
            font-size: 1.05rem;
        }
        .order-summary {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            position: sticky;
            top: 20px;
        }
        .summary-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        .summary-item.total {
            border-bottom: none;
            font-weight: bold;
            font-size: 1.2rem;
            color: #ff6b6b;
            padding: 15px 0;
        }
        .btn-submit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 40px;
            font-weight: 600;
            margin-top: 20px;
            width: 100%;
        }
        .btn-submit:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .form-control, .form-select {
            border-radius: 6px;
            border: 1px solid #ddd;
        }
        .form-control:focus, .form-select:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
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
        <div class="row">
            <div class="col-lg-8">
                <div class="checkout-container">
                    <h2 class="mb-4"><i class="bi bi-credit-card"></i> Thanh Toán Đơn Hàng</h2>

                    <form action="donhang" method="post">
                        <input type="hidden" name="action" value="create">

                        <div class="form-section">
                            <h5><i class="bi bi-geo-alt"></i> Địa Chỉ Giao Hàng</h5>
                            <textarea class="form-control" name="diaChiGiao" rows="3" placeholder="Nhập địa chỉ giao hàng của bạn..." required></textarea>
                            <small class="text-muted d-block mt-2">Vui lòng nhập địa chỉ chi tiết để chúng tôi có thể giao hàng chính xác</small>
                        </div>

                        <div class="form-section">
                            <h5><i class="bi bi-wallet2"></i> Phương Thức Thanh Toán</h5>
                            <div class="payment-option">
                                <input type="radio" id="cod" name="phuongThuc" value="COD" checked>
                                <label for="cod" class="payment-label">
                                    <i class="bi bi-cash-coin"></i>
                                    <span>Thanh Toán Khi Nhận Hàng (COD)</span>
                                </label>
                            </div>
                            <div class="payment-option">
                                <input type="radio" id="online" name="phuongThuc" value="ONLINE">
                                <label for="online" class="payment-label">
                                    <i class="bi bi-credit-card"></i>
                                    <span>Chuyển Khoản Trực Tuyến</span>
                                </label>
                            </div>
                        </div>

                        <div class="form-section">
                            <h5><i class="bi bi-chat-left-text"></i> Ghi Chú Đơn Hàng (Tùy Chọn)</h5>
                            <textarea class="form-control" name="ghiChu" rows="3" placeholder="Thêm ghi chú hoặc yêu cầu đặc biệt..."></textarea>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-submit btn-lg">
                                <i class="bi bi-check-circle"></i> Đặt Hàng
                            </button>
                            <a href="giohang?action=view" class="btn btn-outline-secondary">
                                <i class="bi bi-arrow-left"></i> Quay Lại Giỏ Hàng
                            </a>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="order-summary">
                    <h5><i class="bi bi-calculator"></i> Tóm Tắt Đơn Hàng</h5>
                    <c:if test="${empty sessionScope.gioHangList}">
                        <div class="alert alert-warning">
                            <i class="bi bi-exclamation-triangle"></i> Giỏ hàng trống!
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</main>

<footer>
    <div class="container">
        <p class="mb-0">&copy; 2025 Cửa Hàng Online. All rights reserved.</p>
    </div>
</footer>

        </div>

        <div class="col-md-4">
            <div class="order-summary">
                <h5>📦 Tóm Tắt Đơn Hàng</h5>
                <div class="summary-item">
                    <span>Tạm tính:</span>
                    <span>Đang tính...</span>
                </div>
                <div class="summary-item">
                    <span>Phí giao hàng:</span>
                    <span>Miễn phí</span>
                </div>
                <div class="summary-total">
                    <span>Tổng cộng</span>
                    <span>0đ</span>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="layout/footer_trangchu.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
