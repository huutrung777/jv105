<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <title>Thêm sản phẩm</title>
  <style>
    /* General Styling */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      padding: 20px 0;
    }

    .container {
      background: rgba(255, 255, 255, 0.95);
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
      margin-top: 20px;
    }

    /* Header Section */
    .row:nth-child(2) {
      margin-bottom: 25px;
      padding: 20px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      border-radius: 10px;
    }

    .row:nth-child(2) .col-lg-3 {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    /* Button Styling */
    .btn-success {
      background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
      border: none;
      padding: 12px 30px;
      font-weight: 600;
      font-size: 16px;
      border-radius: 25px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(17, 153, 142, 0.3);
    }

    .btn-success:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(17, 153, 142, 0.4);
      background: linear-gradient(135deg, #0d7a6f 0%, #2dd36f 100%);
    }

    .btn-warning {
      background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
      border: none;
      padding: 8px 20px;
      font-weight: 500;
      border-radius: 20px;
      transition: all 0.3s ease;
      color: white;
    }

    .btn-warning:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 15px rgba(245, 87, 108, 0.4);
      background: linear-gradient(135deg, #e77fea 0%, #e04055 100%);
    }

    .btn-danger {
      background: linear-gradient(135deg, #eb3349 0%, #f45c43 100%);
      border: none;
      padding: 8px 20px;
      font-weight: 500;
      border-radius: 20px;
      transition: all 0.3s ease;
    }

    .btn-danger:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 15px rgba(235, 51, 73, 0.4);
      background: linear-gradient(135deg, #d62839 0%, #e04e3f 100%);
    }

    /* Message Styling */
    h2 {
      color: white;
      font-size: 18px;
      font-weight: 600;
      margin: 0;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    }

    /* Table Styling */
    .table-dark {
      background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
    }

    .table-dark thead {
      background: linear-gradient(135deg, #1a252f 0%, #2c3e50 100%);
    }

    .table-dark th {
      color: #fff;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 1px;
      padding: 18px 15px;
      border: none;
      font-size: 14px;
    }

    .table-dark td {
      padding: 15px;
      vertical-align: middle;
      border-color: rgba(255, 255, 255, 0.1);
      color: #ecf0f1;
    }

    .table-striped tbody tr:nth-of-type(odd) {
      background-color: rgba(255, 255, 255, 0.05);
    }

    .table-striped tbody tr:hover {
      background-color: rgba(102, 126, 234, 0.2);
      transform: scale(1.01);
      transition: all 0.3s ease;
    }

    /* Image Styling */
    .table-dark td img {
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
      transition: all 0.3s ease;
      object-fit: cover;
    }

    .table-dark td img:hover {
      transform: scale(1.1);
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
    }

    /* Action Buttons Container */
    .table-dark td:last-child {
      display: flex;
      gap: 10px;
      justify-content: center;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .container {
        padding: 15px;
      }

      .table-dark {
        font-size: 12px;
      }

      .table-dark th,
      .table-dark td {
        padding: 10px 5px;
      }

      .btn {
        padding: 6px 12px;
        font-size: 12px;
      }

      .table-dark td img {
        width: 60px;
        height: 60px;
      }
    }

    /* Animation */
    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .table-dark tbody tr {
      animation: fadeIn 0.5s ease;
    }

    /* Scrollbar Styling */
    .table-responsive::-webkit-scrollbar {
      height: 8px;
    }

    .table-responsive::-webkit-scrollbar-track {
      background: #f1f1f1;
      border-radius: 10px;
    }

    .table-responsive::-webkit-scrollbar-thumb {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      border-radius: 10px;
    }

    .table-responsive::-webkit-scrollbar-thumb:hover {
      background: linear-gradient(135deg, #5568d3 0%, #663a8b 100%);
    }
  </style>
  <c:import url="../layout/library.jsp"/>
</head>

<body>
<div class="container mt-3">
  <div class="row">
    <c:import url="../layout/navbar_admin.jsp"/>
  </div>

  <div class="row">
    <form action="/san-pham?action=add" method="post" class="row g-3">

      <input type="hidden" name="action" value="add"/>

      <div class="col-md-6">
        <label class="form-label">Tên sản phẩm</label>
        <input type="text" class="form-control" name="tenSp" required>
      </div>

      <div class="col-md-6">
        <label class="form-label">Mô tả</label>
        <input type="text" class="form-control" name="moTa" required>
      </div>

      <div class="col-md-6">
        <label class="form-label">Giá</label>
        <input type="number" class="form-control" name="gia" required>
      </div>

      <div class="col-md-6">
        <label class="form-label">Số lượng</label>
        <input type="number" class="form-control" name="soLuong" required>
      </div>

      <div class="col-md-12">
        <label class="form-label">Ảnh (URL)</label>
        <input type="text" class="form-control" name="anh" required>
      </div>

      <div class="col-12 d-flex gap-2 mt-3">
        <button type="submit" class="btn btn-primary">Thêm mới </button>
        <a href="/san-pham?action=admin"
           class="btn btn-secondary">Quay lại</a>
      </div>

    </form>
  </div>
</div>
</body>
</html>
