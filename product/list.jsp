<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách sản phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        h1 { color: #1b2a7a; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #1b2a7a; color: white; }
        tr:hover { background-color: #f1f5f9; }
        .btn { display: inline-block; padding: 8px 16px; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 14px; }
        .btn-create { background-color: #27ae60; color: white; }
        .btn-search { background-color: #2980b9; color: white; border: none; padding: 8px 14px; border-radius: 4px; cursor: pointer; font-weight: bold; }
        .btn-edit { color: #2980b9; text-decoration: none; margin-right: 10px; }
        .btn-delete { color: #c0392b; text-decoration: none; }
        .btn-view { color: #1b2a7a; text-decoration: none; font-weight: bold; }
        .top-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; }
        .search-box { display: flex; gap: 8px; }
        .search-box input { padding: 8px; width: 250px; border: 1px solid #ccc; border-radius: 4px; }
    </style>
</head>
<body>
    <h1>Danh Sách Sản Phẩm</h1>
    
    <div class="top-bar">
        <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-create">Thêm sản phẩm mới</a>
        
        <form action="${pageContext.request.contextPath}/products" method="GET" class="search-box">
            <input type="hidden" name="action" value="search" />
            <input type="text" name="keyword" placeholder="Nhập tên sản phẩm cần tìm..." required />
            <button type="submit" class="btn-search">Tìm kiếm</button>
        </form>
    </div>
    
    <table>
        <thead>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Giá ($)</th>
                <th>Mô tả</th>
                <th>Nhà sản xuất</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.products}" var="product">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/products?action=view&id=${product.id}" class="btn-view">${product.name}</a></td>
                    <td>${product.price}</td>
                    <td>${product.description}</td>
                    <td>${product.producer}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/products?action=edit&id=${product.id}" class="btn-edit">Sửa</a>
                        <a href="${pageContext.request.contextPath}/products?action=delete&id=${product.id}" class="btn-delete">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
