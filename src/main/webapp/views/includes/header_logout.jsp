<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>

<%
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("home");
        return;
    }

    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
    if (userFromDB == null) {
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
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

        .tp-header .navbar-brand img {
            height: 40px;
        }

        .tp-header .right-section {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .tp-header .top-row {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .tp-header .btn.tp-btn-blue {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            font-size: 1.2rem;
        }

        .tp-header .btn.tp-btn-blue i {
            margin-right: 10px;
        }

        .tp-header .form-inline {
            display: inline-block;
            margin-right: 20px;
            position: relative;
        }

        .tp-header .form-control {
            border-radius: 5px;
            padding-right: 40px;
            font-size: 1.1rem;
        }

        .tp-header .form-inline .search-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #007bff;
            font-size: 1.5rem;
        }

        .tp-header .phone {
            font-size: 20px;
            font-weight: bold;
        }

        .tp-header .user-info {
            position: relative;
            display: inline-block;
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

        .tp-header .notification-icon {
            position: relative;
            font-size: 1.5rem;
            cursor: pointer;
            margin-left: 20px;
        }

        .tp-header .notification-icon .badge {
            position: absolute;
            top: -5px;
            right: -10px;
            padding: 5px 10px;
            border-radius: 50%;
            background-color: red;
            color: white;
        }

        .tp-header .notifications-menu {
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
            width: 300px;
        }

        .tp-header .notifications-menu a {
            display: block;
            padding: 10px 15px;
            color: #000;
            text-decoration: none;
        }

        .tp-header .notifications-menu a:hover {
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
                        <input class="form-control" type="search" placeholder="Search..." aria-label="Search"
                               id="searchInput">
                        <i class="bi bi-search search-icon"></i>
                    </div>
                </form>
                <div class="user-info">
                    <button class="user-icon-btn">
                        <i class="bi bi-person user-icon"></i>
                    </button>
                    <div class="dropdown-menu">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/customerinfo">Profile</a>
                        <a href="${pageContext.request.contextPath}/logout">Logout</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/login" class="btn tp-btn tp-btn-blue">Login</a>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>
                <div class="notification-icon">
                    <i class="bi bi-bell"></i>
                    <span class="badge">3</span>
                    <div class="notifications-menu">
                        <a href="#">Notification 1</a>
                        <a href="#">Notification 2</a>
                        <a href="#">Notification 3</a>
                    </div>
                </div>
                <div class="notification-icon">
                    <i class="bi bi-bell"></i>
                    <span class="badge">3</span>
                    <div class="notifications-menu">
                        <a href="#">Notification 1</a>
                        <a href="#">Notification 2</a>
                        <a href="#">Notification 3</a>
                    </div>
                </div>
            </div>
            <span class="phone">PHONE: 0123 456 789</span>
        </div>
    </div>
</div>

<script>
    function isLoggedIn() {
        return true;
    }

    document.addEventListener("DOMContentLoaded", function() {
        const userInfo = document.querySelector(".user-info");
        const loginButton = document.querySelector(".tp-btn-blue");
        const notificationIcon = document.querySelector(".notification-icon");
        const notificationsMenu = document.querySelector(".notifications-menu");

        if (isLoggedIn()) {
            userInfo.style.display = "block";
            loginButton.style.display = "none";
        } else {
            userInfo.style.display = "none";
            loginButton.style.display = "block";
        }

        notificationIcon.addEventListener("click", function() {
            notificationsMenu.style.display = notificationsMenu.style.display === "block" ? "none" : "block";
        });

        document.addEventListener("click", function(event) {
            if (!notificationIcon.contains(event.target)) {
                notificationsMenu.style.display = "none";
            }
        });

        fetchNotifications();
    });

    function fetchNotifications() {
        fetch('${pageContext.request.contextPath}/notifications')
            .then(response => response.json())
            .then(data => {
                const notificationsMenu = document.querySelector('.notifications-menu');
                notificationsMenu.innerHTML = '';
                data.forEach(notification => {
                    const notificationLink = document.createElement('a');
                    notificationLink.href = '#';
                    notificationLink.textContent = notification.message;
                    notificationsMenu.appendChild(notificationLink);
                });
            })
            .catch(error => console.error('Error fetching notifications:', error));
    }
</script>
</body>
</html>