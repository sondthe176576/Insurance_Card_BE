<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/23/2024
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Select Customer</title>
    <style>
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 50px;
        }

        .form-container h2 {
            text-align: center;
            color: #007bff;
            font-size: 24px;
            margin-bottom: 20px;
            position: relative;
        }

        .form-container h3 {
            margin-bottom: 10px;
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 20px 100px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-group textarea {
            height: 100px;
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .membership-info {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 4px;
            margin-top: 20px;
        }

        .membership-info p {
            margin: 10px 0;
            color: #333;
        }

        .membership-info strong {
            color: #007bff;
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
<img src="${pageContext.request.contextPath}/img/slider.jpg" alt="Slider Image">
<!-- End of image slider -->
<!-- Form -->
<div class="form-container">
    <form action="${pageContext.request.contextPath}/createContract" method="get">
        <h2>Create New Contract</h2>
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
