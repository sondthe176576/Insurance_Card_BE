<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insurance Card</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
        }

        .tp-header {
            background-color: #0056b3;
            padding: 20px 40px;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .tp-header .navbar-brand {
            display: flex;
            align-items: center;
        }

        .tp-header .navbar-brand img {
            height: 50px;
        }

        .tp-header .search-container {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            margin: 0 40px;
        }

        .tp-header .form-inline {
            display: flex;
            width: 100%;
            max-width: 600px;
        }

        .tp-header .form-control {
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 1.2rem;
            width: 100%;
            border: none;
            outline: none;
        }

        .tp-header .user-info {
            display: flex;
            align-items: flex-end;
            flex-direction: column;
            position: relative;
            margin-left: 20px;
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
            cursor: pointer;
        }

        .tp-header .user-info .profile-link {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: white;
            margin-right: 10px;
        }

        .tp-header .user-info .profile-link i {
            margin-right: 10px;
        }

        .tp-header .user-info .logout-btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1.2rem;
            cursor: pointer;
            margin-top: 10px;
        }

        .tp-header .welcome-message {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 200px;
            margin-left: 10px;
        }

        .tp-header .phone {
            font-size: 1.2rem;
            font-weight: bold;
            margin-top: 10px;
            text-align: right;
        }

        .tp-header .login-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1.2rem;
            display: flex;
            align-items: center;
            cursor: pointer;
            margin-top: 10px;
        }

        .tp-header .login-btn i {
            margin-right: 10px;
        }

        @media (max-width: 768px) {
            .tp-header {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px 20px;
            }

            .tp-header .search-container {
                width: 100%;
                margin: 10px 0;
            }

            .tp-header .form-inline {
                max-width: none;
            }

            .tp-header .welcome-message {
                max-width: 100%;
            }

            .tp-header .user-info {
                flex-direction: column;
                align-items: flex-start;
            }

            .tp-header .phone {
                margin-left: 0;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
<div class="tp-header" id="tp-header">
    <a class="navbar-brand" href="index.html">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Insurance Card">
    </a>
    <div class="search-container">
        <form class="form-inline my-2 my-lg-0" onsubmit="return handleSearch(event)">
            <input class="form-control" type="search" placeholder="Search..." aria-label="Search" id="searchInput">
        </form>
    </div>
    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <div class="user-info">
                <a href="${pageContext.request.contextPath}/customerinfo" class="profile-link">
                    <i class="fas fa-user"></i>
                    <span class="welcome-message">Welcome, ${sessionScope.user.username}</span>
                </a>
                <form action="${pageContext.request.contextPath}/login">
                    <button type="submit" class="logout-btn">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </button>
                </form>
                <span class="phone">PHONE: 0123 456 789</span>
            </div>
        </c:when>
        <c:otherwise>
            <div class="user-info">
                <a href="${pageContext.request.contextPath}/login" class="login-btn">
                    <i class="fas fa-sign-in-alt"></i> LOGIN
                </a>
                <span class="phone">PHONE: 0123 456 789</span>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const notificationIcon = document.querySelector(".notification-icon");
        const notificationsMenu = document.querySelector(".notifications-menu");

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

    function handleSearch(event) {
        event.preventDefault();
        const searchInput = document.getElementById('searchInput').value;
        console.log(`Searching for: ${searchInput}`);
        // Add your search handling logic here
    }
</script>
</body>
</html>