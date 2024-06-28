<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/26/2024
  Time: 9:55 PM
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css"> <!-- Sử dụng CDN -->
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
            font-size: 1.5rem; /* Tăng kích thước icon */
        }

        .tp-header .phone {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }

        .tp-header .user-info {
            position: relative;
            display: inline-block;
        }

        .tp-header .user-info .user-icon {
            cursor: pointer;
            font-size: 1.5rem; /* Tăng kích thước icon */
        }

        .tp-header .user-info .user-icon-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 7px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .tp-header .user-info .dropdown-menu {
            display: none;
            position: absolute;
            right: 0;
            top: 100%;
            background-color: #fff;
            color: #000;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .tp-header .user-info:hover .dropdown-menu {
            display: block;
        }

        .tp-header .user-info .dropdown-menu a {
            display: block;
            padding: 10px 15px;
            color: #000;
            text-decoration: none;
        }

        .tp-header .user-info .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }
    </style>
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
                        <i class="bi bi-search search-icon"></i>
                    </div>
                </form>
                <div class="user-info">
                    <button class="user-icon-btn">
                        <i class="bi bi-person user-icon"></i>
                    </button>
                    <div class="dropdown-menu">
                        <a href="#">Profile</a>
                        <a href="#">Logout</a>
                    </div>
                </div>
            </div>
            <span class="phone">PHONE: 0123 456 789</span>
        </div>
    </div>
</div>

<script>
    // Placeholder function to simulate user login state
    function isLoggedIn() {
        return true; // Change this to false to simulate logged out state
    }

    document.addEventListener("DOMContentLoaded", function() {
        const userInfo = document.querySelector(".user-info");
        const loginButton = document.querySelector(".tp-btn-blue");

        if (isLoggedIn()) {
            userInfo.style.display = "block";
            loginButton.style.display = "none";
        } else {
            userInfo.style.display = "none";
            loginButton.style.display = "block";
        }
    });
</script>
</body>
</html>