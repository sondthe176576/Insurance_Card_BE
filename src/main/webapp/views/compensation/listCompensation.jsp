<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Compensation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 90%;
            height: 90vh;
            margin: 20px auto;
            overflow: auto;
        }

        .form-container h2 {
            text-align: center;
            color: #007bff;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .form-container h3 {
            margin-bottom: 10px;
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
            font-size: 22px;
        }

        .compensation-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .compensation-table th, .compensation-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .compensation-table th {
            background-color: #f9f9f9;
            color: #007bff;
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            margin-top: 20px;
            display: block;
            width: 100%;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .pagination a {
            color: #007bff;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 4px;
        }

        .pagination a.active {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }

        .pagination a:hover {
            background-color: #ddd;
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
<!-- Form -->
<div class="form-container">
    <h2>Compensation List</h2>
    <h3>Contract ID: <c:out value="${contract.contractID}"/></h3>
    <table class="compensation-table">
        <thead>
        <tr>
            <th>Compensation ID</th>
            <th>Description</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="compensation" items="${compensations}">
            <tr>
                <td><c:out value="${compensation.compensationID}"/></td>
                <td><c:out value="${compensation.description}"/></td>
                <td><c:out value="${compensation.amount}"/></td>
                <td><c:out value="${compensation.status}"/></td>
                <td><c:out value="${compensation.date}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="?page=${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>
        </c:forEach>
    </div>
    <button type="submit" class="btn-submit">Update Compensation</button>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>