<%--
  Created by IntelliJ IDEA.
  User: LE NHAT
  Date: 13/12/2025
  Time: 11:52 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout/library.jsp"></c:import>
</head>
<body>
<div class="container" >
    <div class="row">
        <c:import url="../layout/navbar_admin.jsp"></c:import>
    </div>
    <div class="row">
        <div class="col-lg-3">
            <a class="btn btn-sm btn-success" href="/san-pham?action=add">Thêm mới</a>
            <h2>${param.mess}</h2>
        </div>
    </div>
    <div class="row">
        <table  class="table table-dark table-striped">
            <tr>
                <th>Mã Sản Phẩm</th>
                <th>Tên Sản Phẩm</th>
                <th>Mô Tả</th>
                <th>Giá</th>
                <th>Số Lượng</th>
                <th>Ảnh</th>
                <th>Hành động</th>
            </tr>
            <c:forEach var="sanpham" items="${sanPhamList}" varStatus="status">
                <tr>
                    <td>${sanpham.maSp}</td>
                    <td>${sanpham.tenSp}</td>
                    <td>${sanpham.moTa}</td>
                    <td>${sanpham.gia}</td>
                    <td>${sanpham.soLuong}</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/images/${sanpham.anh}"
                             width="100" height="100">
                    </td>
                    <td>
                        <button type="button" class="btn btn-warning">Chỉnh sủa</button>
                        <button type="button" class="btn btn-danger">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
