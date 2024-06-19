<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/21/2024
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Custom Navbar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
</head>
<body>
<nav class="navbar">
    <div class="navbar-container">
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#">Service</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contract</a></li>
        </ul>
        <div class="nav-actions">
            <!-- Loại bỏ nút tìm kiếm -->
            <a href="${pageContext.request.contextPath}/selectCustomer" class="btn btn-primary">Create Contract</a>
        </div>
    </div>
</nav>
</body>
</html>