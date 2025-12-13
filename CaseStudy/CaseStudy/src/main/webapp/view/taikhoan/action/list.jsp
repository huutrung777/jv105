<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29/11/2025
  Time: 8:52 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/view/layout/library.jsp"/>
</head>
<body>
<c:import url="/view/layout/navbar_admin.jsp"/>
<h1>Student List</h1>
<a class="btn btn-sm btn-success" href="/taikhoans?action=add">Add new student</a>
<h2>${param.mess}</h2>
<form action="/taikhoans" method="get" class="mb-3">
    <input type="hidden" name="action" value="find">
    <input type="number" name="id" class="form-control"
           placeholder="Nhập ID cần tìm" style="width:200px;display:inline-block;">
    <button class="btn btn-primary btn-sm">Search</button>
</form>
<table class="table table-dark table-striped">
    <tr>
        <th>ID</th>
        <th>username</th>
        <th>password</th>
        <th>email</th>
        <th>role</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="account" items="${accountList}" varStatus="status">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.password}</td>
            <td>${user.email}</td>
            <td>${user.role}</td>

            </td>
            <td>
                <button onclick="getInfoToDelete('${student.id}','${student.name}')" type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
            <td>
                <a href="/students?action=edit&id=${student.id}" class="btn btn-warning btn-sm">Update</a>

            </td>

        </tr>

    </c:forEach>
    <tr>
        <c:if test="${studentList.isEmpty()}">
            <td colspan="6">Danh sách trống</td>
        </c:if>

    </tr>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/students?action=delete" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden="hidden" name="deleteId" id="deleteId">
                    <span>Bạn có muốn xoá sinh viên </span><span id="deleteName" class="text-danger"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    function getInfoToDelete(id, name){
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerHTML = name;
    }
</script>

</body>
</html>
