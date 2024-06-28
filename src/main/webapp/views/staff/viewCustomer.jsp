<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Customer Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .detail-container {
            max-width: 800px;
            margin: 40px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .detail-container h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .detail-container h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
            font-size: 24px;
        }

        .detail-item {
            margin-bottom: 15px;
        }

        .detail-item label {
            font-weight: bold;
            color: #2980b9;
        }

        .detail-item span {
            color: #333;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn-back, .btn-update {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            text-align: center;
        }

        .btn-back:hover, .btn-update:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<jsp:include page="/views/includes/header.jsp" />
<div class="detail-container">
    <h2>View Customer</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <div class="detail-item">
        <label>Username:</label>
        <span>${customer.username}</span>
    </div>
    <div class="detail-item">
        <label>Email:</label>
        <span>${customer.email}</span>
    </div>
    <div class="detail-item">
        <label>Mobile:</label>
        <span>${customer.mobile}</span>
    </div>
    <div class="detail-item">
        <label>Province:</label>
        <span>${customer.province}</span>
    </div>
    <div class="detail-item">
        <label>District:</label>
        <span>${customer.district}</span>
    </div>
    <div class="detail-item">
        <label>Country:</label>
        <span>${customer.country}</span>
    </div>
    <div class="detail-item">
        <label>First Name:</label>
        <span>${customer.firstName}</span>
    </div>
    <div class="detail-item">
        <label>Last Name:</label>
        <span>${customer.lastName}</span>
    </div>
    <div class="detail-item">
        <label>Full Name:</label>
        <span>${customer.fullName}</span>
    </div>
    <div class="detail-item">
        <label>Birth Date:</label>
        <span><fmt:formatDate value="${customer.birthDate}" pattern="yyyy-MM-dd" /></span>
    </div>
    <div class="detail-item">
        <label>Gender:</label>
        <span>${customer.gender}</span>
    </div>
    <div class="btn-container">
        <a href="${pageContext.request.contextPath}/customer-manage" class="btn-back">Back</a>
        <a href="${pageContext.request.contextPath}/customer-edit?userID=${customer.userID}" class="btn-update">Update</a>
    </div>
</div>
<jsp:include page="/views/includes/footer.jsp" />
</body>
</html>
