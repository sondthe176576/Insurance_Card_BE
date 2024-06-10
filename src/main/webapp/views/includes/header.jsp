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
</head>
<body>
<div class="tp-header" id="tp-header">
    <div class="container">
        <div class="row">
            <div class="col-md-4"><a class="navbar-brand" href="${pageContext.request.contextPath}/views/dashboard/HomePageForCustomer.jsp"><img
                    src="${pageContext.request.contextPath}/img/logo.png" alt="logo"></a></div>
            <div class="col-md-8 cta-box text-right"><span class="call">Phone: 0123 456 789</span>
                <!-- Single button -->
                <div class="btn-group">
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="auto-land.html"><i class="fa fa-car"></i>Auto Insurance</a></li>
                        <li><a href="life-land.html"><i class="fa fa-heart"></i> Life Insurance</a></li>
                        <li><a href="business-land.html"> <i class="fa fa-envelope"></i>Business Insurance</a></li>
                        <li><a href="travel-land.html"> <i class="fa fa-plane"></i>Travel Insurance</a></li>
                        <li><a href="home-land.html"> <i class="fa fa-home"></i>Home Insurance</a></li>
                    </ul>
                </div>
                <a href="login-page.html" class="btn tp-btn tp-btn-blue">Login</a>
                <form class="form-inline my-2 my-lg-0 ml-3" onsubmit="return handleSearch(event)">
                    <div class="input-group">
                        <input class="form-control" type="search" placeholder="Search..." aria-label="Search"
                               id="searchInput">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>