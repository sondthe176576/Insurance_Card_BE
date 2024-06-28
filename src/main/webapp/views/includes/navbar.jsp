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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .navbar {
            background-color: #004080; /* Màu xanh đậm hơn để phân biệt */
            padding: 10px 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            z-index: 1000;
        }

        .nav-links {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
            justify-content: center;
            width: 100%;
        }

        .nav-links li {
            margin: 0 15px;
        }

        .nav-links li a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            display: flex;
            align-items: center;
            transition: color 0.3s ease;
        }

        .nav-links li a:hover {
            color: #f39c12;
        }

        .nav-links li a i {
            margin-right: 8px;
            font-size: 20px;
        }

        .nav-actions {
            display: flex;
            align-items: center;
        }

        .btn-primary {
            background-color: #f39c12;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 18px;
            display: flex;
            align-items: center;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #e67e22;
        }

        .btn-primary i {
            margin-right: 8px;
            font-size: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar">
    <ul class="nav-links">
        <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="#"><i class="fas fa-concierge-bell"></i> Service</a></li>
        <li><a href="#"><i class="fas fa-info-circle"></i> About</a></li>
        <li><a href="#"><i class="fas fa-envelope"></i> Contact</a></li>
        <li><a href="${pageContext.request.contextPath}/selectCustomer"><i class="fas fa-file-contract"></i> Create Contract</a></li>
    </ul>
</nav>
</body>
</html>
