<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/23/2024
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Select Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 600px;
            margin: 60px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 30px;
        }

        .form-container h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #2980b9;
            font-weight: bold;
        }

        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .btn-submit {
            background-color: #3498db;
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            display: block;
            width: 100%;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #2980b9;
        }

        .slider-image {
            width: 100%;
            margin-bottom: 20px;
            border-radius: 10px;
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
<!-- Link image slider -->
<img src="${pageContext.request.contextPath}/img/slider.jpg" alt="Slider Image" class="slider-image">
<!-- End of image slider -->
<!-- Form -->
<div class="form-container">
    <form action="${pageContext.request.contextPath}/selectCustomer" method="post">
        <h2>Select Customer ID To Create A Contract</h2>
        <div class="form-group">
            <label for="customerID">Customer ID:</label>
            <select id="customerID" name="customerID">
                <option value="">Select Customer ID</option>
                <c:forEach var="customerID" items="${customerIDs}">
                    <option value="${customerID}">${customerID}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn-submit">Select</button>
    </form>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>