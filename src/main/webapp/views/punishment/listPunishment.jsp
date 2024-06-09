<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/8/2024
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>List Punishments</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 1200px;
            margin: 40px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .form-container h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .form-container h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
            font-size: 24px;
        }

        .accident-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .accident-table th, .accident-table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .accident-table th {
            background-color: #2c3e50;
            color: white;
            font-weight: bold;
        }

        .accident-table tr:nth-child(even) {
            background-color: #f4f7f6;
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
    <h2>Contract Management System</h2>
    <h3>List of Punishments</h3>
    <table class="accident-table">
        <thead>
        <tr>
            <th>No</th>
            <th>Punishment ID</th>
            <th>Contract ID</th>
            <th>Punishment Type</th>
            <th>Punishment Date</th>
            <th>Description</th>
            <th>Status</th>
            <th>Customer ID</th>
            <th>Customer Name</th>
            <th>Cancellation Date</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="punishment" items="${punishments}" varStatus="status">
            <tr>
                <td><c:out value="${status.count}"/></td>
                <td><c:out value="${punishment.punishmentID}"/></td>
                <td><c:out value="${punishment.contractID}"/></td>
                <td><c:out value="${punishment.punishmentType}"/></td>
                <td><fmt:formatDate value="${punishment.punishmentDate}" pattern="dd-MM-yyyy"/></td>
                <td><c:out value="${punishment.description}"/></td>
                <td><c:out value="${punishment.status}"/></td>
                <td><c:out value="${punishment.customer.customerID}"/></td>
                <td><c:out value="${punishment.customerName}"/></td>
                <td><fmt:formatDate value="${punishment.contract.cancellationDate}" pattern="dd-MM-yyyy"/></td>
                <td>
                    <a href="${pageContext.request.contextPath}/resolvePunishment?punishmentID=${punishment.punishmentID}" class="btn-view">View</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>