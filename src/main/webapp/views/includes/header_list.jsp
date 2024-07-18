<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .header {
            background-color: #004080;
            color: white;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .header .logo {
            font-size: 1.5rem;
            display: flex;
            align-items: center;
        }

        .header .logo i {
            margin-right: 10px;
        }

        .header .user-profile {
            display: flex;
            align-items: center;
            position: relative;
        }

        .header .user-profile i {
            margin-right: 10px;
            font-size: 1.5rem;
        }

        .header .user-profile a {
            color: white;
            text-decoration: none;
            margin-right: 15px;
            transition: color 0.3s;
        }

        .header .user-profile a:hover {
            color: #ffcc00;
        }

        .header .notifications {
            position: relative;
        }

        .header .notifications .badge {
            position: absolute;
            top: -5px;
            right: -10px;
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 5px 10px;
        }

        .header .notifications-menu {
            position: absolute;
            top: 30px;
            right: 0;
            background-color: white;
            color: black;
            width: 250px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            display: none;
        }

        .header .notifications:hover .notifications-menu {
            display: block;
        }

        .header .notifications-menu a {
            display: block;
            padding: 10px;
            color: black;
            text-decoration: none;
            border-bottom: 1px solid #ddd;
            transition: background-color 0.3s;
        }

        .header .notifications-menu a:hover {
            background-color: #f0f0f0;
        }

        .header .notifications-menu a:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="logo">
        <i class="fas fa-shield-alt"></i> My Insurance
    </div>
    <div class="user-profile">
        <i class="fas fa-user-circle"></i>
<div class="header">
    <div class="logo">
        <i class="bi bi-shield-lock-fill"></i> My Insurance
    </div>
    <div class="user-profile">
        <i class="bi bi-person-circle"></i>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/customerinfo">Profile</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login">Login</a>
            </c:otherwise>
        </c:choose>
        <div class="notifications">
            <i class="fas fa-bell"></i>
            <i class="bi bi-bell"></i>
            <c:if test="${not empty sessionScope.unreadNotifications}">
                <span class="badge">${sessionScope.unreadNotifications.size()}</span>
            </c:if>
            <div class="notifications-menu">
                <c:forEach var="notification" items="${sessionScope.unreadNotifications}">
                    <a href="#">${notification.message}</a>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
</div>
