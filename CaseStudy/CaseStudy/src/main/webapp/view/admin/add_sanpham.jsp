<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <title>Thêm sản phẩm</title>
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
