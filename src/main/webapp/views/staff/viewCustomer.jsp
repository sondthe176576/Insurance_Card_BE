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
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .main-container {
            display: flex;
            flex: 1;
        }

        .detail-container {
            flex: 1;
            padding: 30px;
            background-color: #fff;
            border-right: 1px solid #ddd;
        }

        .motorcycle-container {
            flex: 1;
            padding: 30px;
            background-color: #fff;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        h2, h3 {
            color: #2c3e50;
        }

        h2 {
            font-size: 32px;
            margin-bottom: 30px;
            text-align: center;
        }

        h3 {
            margin-bottom: 15px;
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

        .motorcycle-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 16px;
        }

        .motorcycle-table th, .motorcycle-table td {
            padding: 12px;
            text-align: left;
        }

        .motorcycle-table thead {
            background-color: #3498db;
            color: white;
        }

        .motorcycle-table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .motorcycle-table tbody tr:hover {
            background-color: #e0e0e0;
        }

        .motorcycle-table th {
            border-bottom: 2px solid #ddd;
        }

        .motorcycle-table td {
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
<jsp:include page="/views/includes/header.jsp" />
<div class="main-container">
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
    <div class="motorcycle-container">
        <h3>Motorcycles</h3>
        <c:if test="${not empty motorcycles}">
            <table class="motorcycle-table">
                <thead>
                <tr>
                    <th>License Plate</th>
                    <th>Brand</th>
                    <th>Model</th>
                    <th>Year</th>
                    <th>Color</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="motorcycle" items="${motorcycles}">
                    <tr>
                        <td>${motorcycle.licensePlate}</td>
                        <td>${motorcycle.brand}</td>
                        <td>${motorcycle.model}</td>
                        <td>${motorcycle.yearOfManufacture}</td>
                        <td>${motorcycle.color}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
<jsp:include page="/views/includes/footer.jsp" />
</body>
</html>
