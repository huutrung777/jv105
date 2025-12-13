<%--
  Created by IntelliJ IDEA.
  User: LE NHAT
  Date: 11/12/2025
  Time: 8:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TechStore - Siêu Thị Điện Thoại & Laptop</title>
  <c:import url="../layout/css_trangchu.jsp"></c:import>
  <c:import url="../layout/library.jsp"></c:import>
</head>
<body>
<%--header--%>
<c:import url="../layout/navabr_trangchu.jsp"></c:import>
<!-- Banner -->
<div class="banner-slider">
  <div class="banner-slide">
    <div class="banner-content">
      <h1>SIÊU SALE CÔNG NGHỆ</h1>
      <p>Giảm giá lên đến 50% + Trả góp 0%</p>
      <button class="banner-btn">MUA NGAY</button>
    </div>
  </div>
</div>
<%--Body--%>
<div class="container mt-4">
  <div class="row">
    <c:forEach var="sanpham" items="${sanPhamList}">
      <div class="col-md-3 mb-4">
        <div class="card h-100">
          <img src="${sanpham.anh}"
               class="card-img-top"
               style="height:200px; object-fit:cover;"
               alt="${sanpham.tenSp}">
          <div class="card-body">
            <h5 class="card-title">${sanpham.tenSp}</h5>
            <p class="card-text">${sanpham.moTa}</p>
            <p class="text-danger fw-bold fs-5">
                ${sanpham.gia} VNĐ
            </p>
            <a href="#" class="btn btn-warning btn-sm">Thêm vào giỏ hàng</a>
            <a href="#" class="btn btn-primary btn-sm">Mua</a>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>


<!-- Footer -->
<c:import url="../layout/footer_trangchu.jsp"></c:import>
</body>
</html>
