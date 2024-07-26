<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Peace Insurance</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .tp-header {
            background-color: #0056b3;
            padding: 20px 0;
            color: #fff;
        }

        .tp-header .container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 15px;
        }

        .tp-header .navbar-brand {
            font-size: 1.8rem;
            font-weight: 700;
            color: #fff;
            text-decoration: none;
            transition: transform 0.3s ease;
            flex: 0 0 auto;
            margin-right: 40px;
        }

        .tp-header .navbar-brand:hover {
            transform: scale(1.05);
        }

        .tp-header .form-inline {
            flex: 1 1 auto;
            max-width: 400px;
            margin: 0 40px;
            position: relative;
        }

        .tp-header .form-control {
            border-radius: 25px;
            padding: 10px 20px;
            font-size: 1.1rem;
            width: 100%;
            transition: all 0.3s ease;
        }

        .tp-header .form-control:focus {
            outline: none;
        }

        .tp-header .form-inline .search-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #007bff;
            font-size: 1.5rem;
        }

        .tp-header .right-section {
            flex: 0 0 auto;
            margin-left: 40px;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .tp-header .user-info {
            position: relative;
            display: flex;
            align-items: center;
            color: #fff;
        }

        .tp-header .user-info .user-icon-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-right: 10px;
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
            width: 200px;
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

        .tp-header .user-name {
            font-size: 1.2rem;
            font-weight: 700;
        }

        .tp-header .phone {
            font-size: 16px;
            font-weight: bold;
            margin-top: 5px;
        }

        @media (max-width: 768px) {
            .tp-header .form-inline {
                max-width: 100%;
                margin: 10px 0;
            }

            .tp-header .user-info {
                margin-right: 0;
            }

            .tp-header .phone {
                margin-left: 0;
                margin-top: 10px;
                text-align: center;
            }

            .tp-header .container {
                flex-wrap: wrap;
            }
        }
    </style>
</head>
<body>
<div class="tp-header" id="tp-header">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            Peace Insurance
        </a>
        <form class="form-inline my-2 my-lg-0" onsubmit="return handleSearch(event)">
            <div class="input-group">
                <input class="form-control" type="search" placeholder="Search..." aria-label="Search" id="searchInput">
                <i class="bi bi-search search-icon"></i>
            </div>
        </form>
        <div class="right-section">
            <div class="user-info">
                <button class="user-icon-btn">
                    <i class="bi bi-person user-icon"></i>
                </button>
                <c:if test="${not empty sessionScope.user}">
                    <span class="user-name">${sessionScope.user.username}</span>
                </c:if>
                <div class="dropdown-menu">
                    <a href="${pageContext.request.contextPath}/customerinfo"><i class="fas fa-user"></i> PROFILE</a>
                    <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> LOGOUT</a>
                </div>
            </div>
            <span class="phone">PHONE: 0123 456 789</span>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const userInfo = document.querySelector(".user-info");
        const loginButton = document.querySelector(".tp-btn-blue");

        if (isLoggedIn()) {
            userInfo.style.display = "flex";
            loginButton.style.display = "none";
        } else {
            userInfo.style.display = "none";
            loginButton.style.display = "block";
        }
    });

    function handleSearch(event) {
        event.preventDefault();
        const searchTerm = document.getElementById('searchInput').value;
        console.log('Searching for:', searchTerm);
        // Implement your search logic here
    }

    function isLoggedIn() {
        return true; // This is a placeholder. Implement your actual login check here.
    }
</script>
</body>
</html>