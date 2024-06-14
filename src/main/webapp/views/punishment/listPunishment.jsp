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

        .filter-form {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .filter-form .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .filter-form label {
            margin-right: 10px;
            color: #2980b9;
            font-weight: bold;
        }

        .filter-form input, .filter-form select {
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .filter-form button {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .filter-form button:hover {
            background-color: #2980b9;
        }

        .punishment-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .punishment-table th, .punishment-table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .punishment-table th {
            background-color: #2c3e50;
            color: white;
            font-weight: bold;
        }

        .punishment-table tr:nth-child(even) {
            background-color: #f4f7f6;
        }

        .btn-submit, .btn-view {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }

        .btn-submit:hover, .btn-view:hover {
            background-color: #2980b9;
        }

        .pagination {
            display: flex;
            justify-content: flex-end;
            margin: 20px 0;
        }

        .pagination a {
            color: #3498db;
            padding: 10px 15px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 5px;
            border-radius: 5px;
        }

        .pagination a.active {
            background-color: #3498db;
            color: white;
            border: 1px solid #3498db;
        }

        .pagination a:hover {
            background-color: #ecf0f1;
        }

        .status-pending {
            color: #f1c40f;
        }

        .status-approved {
            color: #2ecc71;
        }

        .status-rejected {
            color: #e74c3c;
        }

        .status-paid {
            color: #27ae60;
        }

        .status-approved {
            color: #2980b9;
        }

        .status-rejected {
            color: #e74c3c;
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
    <h3>List of Cancelled Contracts Before Expiry</h3>
    <form method="get" class="filter-form" action="${pageContext.request.contextPath}/listPunishment">
        <div class="form-group">
            <label for="statusFilter">Filter by Status:</label>
            <select id="statusFilter" name="status" class="status-select">
                <option value="">All</option>
                <option value="Paid" ${param.status == 'Paid' ? 'selected' : ''}>Paid</option>
                <option value="Approved" ${param.status == 'Approved' ? 'selected' : ''}>Approved</option>
                <option value="Rejected" ${param.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
            </select>
        </div>
        <div class="form-group">
            <label for="customerNameSearch">Search by Customer Name:</label>
            <input type="text" id="customerNameSearch" name="customerName" value="${param.customerName}"
                   placeholder="Enter customer name"/>
        </div>
        <button type="submit" class="btn-submit">Filter</button>
    </form>
    <table class="punishment-table">
        <thead>
        <tr>
            <th>No</th>
            <th>Customer ID</th>
            <th>Customer Name</th>
            <th>Contract ID</th>
            <th>Punishment Type</th>
            <th>Punishment Date</th>
            <th>Description</th>
            <th>Status</th>
            <th>Cancellation Date</th>
            <th>End Date</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="punishment" items="${punishments}" varStatus="status">
            <tr>
                <td><c:out value="${(currentPage - 1) * 10 + status.count}"/></td>
                <td><c:out value="${punishment.customer.customerID}"/></td>
                <td><c:out value="${punishment.customerName}"/></td>
                <td><c:out value="${punishment.contractID}"/></td>
                <td><c:out value="${punishment.punishmentType}"/></td>
                <td><fmt:formatDate value="${punishment.punishmentDate}" pattern="dd-MM-yyyy"/></td>
                <td><c:out value="${punishment.description}"/></td>
                <td class="${punishment.status == 'Paid' ? 'status-paid' : punishment.status == 'Approved' ? 'status-approved' : punishment.status == 'Rejected' ? 'status-rejected' : ''}">
                    <c:out value="${punishment.status}"/>
                </td>
                <td><fmt:formatDate value="${punishment.contract.cancellationDate}" pattern="dd-MM-yyyy"/></td>
                <td><fmt:formatDate value="${punishment.contract.endDate}" pattern="dd-MM-yyyy"/></td>
                <td>
                    <a href="${pageContext.request.contextPath}/resolvePunishment?punishmentID=${punishment.punishmentID}" class="btn-view">View</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a href="${pageContext.request.contextPath}/listPunishment?page=${i}&status=${param.status}&customerName=${param.customerName}" class="active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/listPunishment?page=${i}&status=${param.status}&customerName=${param.customerName}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>