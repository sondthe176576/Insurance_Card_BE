<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/6/2024
  Time: 6:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Contracts</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        .container {
            margin-top: 20px;
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

<div class="container">
    <h1>Customer Contracts</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Contract ID</th>
            <th>Contract Info</th>
            <th>Status</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Insurance Type</th>
            <th>Coverage</th>
            <th>Premium</th>
            <th>Cancellation Date</th>
            <th>Detail</th>
            <th>Value</th>
            <th>Motorcycle Info</th>
            <th>View</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="contract" items="${contracts}">
            <tr>
                <td>${contract.contractID}</td>
                <td>${contract.contractInfo}</td>
                <td>${contract.status}</td>
                <td>${contract.startDate}</td>
                <td>${contract.endDate}</td>
                <td>${contract.insuranceType}</td>
                <td>${contract.coverage}</td>
                <td>${contract.premium}</td>
                <td>${contract.cancellationDate}</td>
                <td>${contract.detail}</td>
                <td>${contract.value}</td>
                <td>
                    <c:out value="${contract.motorcycle.licensePlate}"/> -
                    <c:out value="${contract.motorcycle.brand}"/> -
                    <c:out value="${contract.motorcycle.model}"/>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/contractDetail/${contract.contractID}" class="btn btn-info">View</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->

<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>