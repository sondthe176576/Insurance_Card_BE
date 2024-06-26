<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 9:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .tp-header {
            background-color: #0056b3;
            padding: 15px 0;
            color: #fff;
        }

        .tp-header .container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .tp-header .navbar-brand {
            display: inline-block;
            vertical-align: middle;
        }

        .tp-header .right-section {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .tp-header .top-row {
            display: flex;
            align-items: center;
        }

        .tp-header .btn.tp-btn-blue {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 7px 15px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            margin-left: 10px;
        }

        .tp-header .btn.tp-btn-blue i {
            margin-right: 5px;
        }

        .tp-header .form-inline {
            display: inline-block;
            margin-right: 10px;
            position: relative;
        }

        .tp-header .form-control {
            border-radius: 5px;
            padding-right: 40px;
        }

        .tp-header .form-inline .search-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #007bff;
        }

        .tp-header .phone {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<div class="tp-header" id="tp-header">
    <div class="container">
        <a class="navbar-brand" href="index.html">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo">
        </a>
        <div class="right-section">
            <div class="top-row">
                <form class="form-inline my-2 my-lg-0" onsubmit="return handleSearch(event)">
                    <div class="input-group">
                        <input class="form-control" type="search" placeholder="Search..." aria-label="Search" id="searchInput">
                        <i class="fas fa-search search-icon"></i>
                    </div>
                </form>
                <a href="login-page.html" class="btn tp-btn tp-btn-blue">
                    <i class="fas fa-user"></i> LOGIN
                </a>
            </div>
            <span class="phone">PHONE: 0123 456 789</span>
        </div>
    </div>
</div>
</body>
</html>