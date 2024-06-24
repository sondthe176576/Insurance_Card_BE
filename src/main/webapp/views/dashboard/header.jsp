<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 9:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
  <title>Title</title>
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
  <style>
    .user-info {
      display: flex;
      align-items: center;
    }
    .user-info .user-icon {
      font-size: 50px;
      margin-right: 10px;
    }
    .user-info .user-name {
      font-size: 30px;
      color: #004080;
    }
  </style>
</head>
<body>
<div class="tp-header" id="tp-header">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
          <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo">
        </a>
      </div>
      <div class="col-md-8 cta-box text-right">
        <span class="call">Phone: 0123 456 789</span>
        <!-- Single button -->
        <div class="btn-group">
          <ul class="dropdown-menu" role="menu">
            <li><a href="auto-land.html"><i class="fa fa-car"></i>Auto Insurance</a></li>
            <li><a href="life-land.html"><i class="fa fa-heart"></i> Life Insurance</a></li>
            <li><a href="business-land.html"><i class="fa fa-envelope"></i>Business Insurance</a></li>
            <li><a href="travel-land.html"><i class="fa fa-plane"></i>Travel Insurance</a></li>
            <li><a href="home-land.html"><i class="fa fa-home"></i>Home Insurance</a></li>
          </ul>
        </div>
        <!-- User Information Icon and Login/Logout Button -->
        <c:choose>
          <c:when test="${not empty sessionScope.user}">
            <a class="nav-link" href="${pageContext.request.contextPath}/customerinfo">
              <i class="fas fa-user-circle fa-6x"></i>
            </a>
            <span class="user-name">Hello, ${sessionScope.user.username}</span>
            <a href="${pageContext.request.contextPath}/logout" class="btn tp-btn tp-btn-blue">Logout</a>
          </c:when>
          <c:otherwise>
            <a href="${pageContext.request.contextPath}/login" class="btn tp-btn tp-btn-blue">Login</a>
          </c:otherwise>
        </c:choose>
        <form class="form-inline my-2 my-lg-0 ml-3" onsubmit="return handleSearch(event)">
          <div class="input-group">
            <input class="form-control" type="search" placeholder="Search..." aria-label="Search" id="searchInput">
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
//Commit
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script>
  function handleSearch(event) {
    event.preventDefault();
    const query = document.getElementById('searchInput').value;
    alert('You searched for: ' + query);
  }
</script>
</body>
</html>