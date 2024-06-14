<%--
  Created by IntelliJ IDEA.
  User: 09114
  Date: 6/7/2024
  Time: 12:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 30px;
        }

        .form-container h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 20px;
            border-bottom: 2px solid #2980b9;
            padding-bottom: 10px;
        }

        .details {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .details label {
            font-weight: bold;
            width: 30%;
            margin-bottom: 10px;
            color: #2980b9;
        }

        .details p {
            width: 70%;
            margin: 0 0 10px 0;
            padding: 10px;
            background-color: #ecf0f1;
            border-radius: 4px;
        }

        .btn-container {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin: 0 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->

<div class="form-container">
    <h2>Customer Detail</h2>
    <div class="details">
        <label>Customer ID:</label>
        <p><c:out value="${customer.userID}"/></p>
        <label>Full Name:</label>
        <p><c:out value="${customer.fullName}"/></p>
        <label>Username:</label>
        <p><c:out value="${customer.username}"/></p>
        <label>Mobile:</label>
        <p><c:out value="${customer.mobile}"/></p>
        <label>Email:</label>
        <p><c:out value="${customer.email}"/></p>
        <label>Address:</label>
        <p><c:out value="${customer.address}"/></p>
        <label>Gender:</label>
        <p><c:out value="${customer.gender}"/></p>
    </div>
    <div class="btn-container">
        <a href="${pageContext.request.contextPath}/customer-staff?action=edit&userID=${customer.userID}" class="btn">Update</a>
        <a href="${pageContext.request.contextPath}/customer-staff" class="btn">Back to List</a>

    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>
