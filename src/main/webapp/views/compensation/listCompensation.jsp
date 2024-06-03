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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .form-container h2 {
            text-align: center;
            color: #34495e;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .form-container h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            border-bottom: 3px solid #2c3e50;
            padding-bottom: 10px;
            font-size: 24px;
        }

        .compensation-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .compensation-table th, .compensation-table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .compensation-table th {
            background-color: #2c3e50;
            color: white;
            font-weight: bold;
        }

        .compensation-table tr:nth-child(even) {
            background-color: #f4f7f6;
        }

        .btn-submit {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
        }

        .btn-submit:hover {
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
    <h2>Compensation Management</h2>
    <h3>List Request From Customer</h3>
    <form method="get" class="filter-form" action="${pageContext.request.contextPath}/listCompensation">
        <label for="statusFilter">Filter by Status:</label>
        <select id="statusFilter" name="status" class="status-select">
            <option value="">All</option>
            <option value="Pending" ${param.status == 'Pending' ? 'selected' : ''}>Pending</option>
            <option value="Approved" ${param.status == 'Approved' ? 'selected' : ''}>Approved</option>
            <option value="Rejected" ${param.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
        </select>
        <label for="customerNameSearch">Search by Customer Name:</label>
        <input type="text" id="customerNameSearch" name="customerName" value="${param.customerName}" placeholder="Enter customer name"/>
        <button type="submit" class="btn-submit">Filter</button>
    </form>
    <table class="compensation-table">
        <thead>
        <tr>
            <th>Compensation ID</th>
            <th>Customer ID</th>
            <th>Contract ID</th>
            <th>Customer Name</th>
            <th>Description</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="compensation" items="${requests}">
            <tr>
                <td><c:out value="${compensation.requestID}"/></td>
                <td><c:out value="${compensation.customerID}"/></td>
                <td><c:out value="${compensation.contractID}"/></td>
                <td><c:out value="${compensation.customerName}"/></td>
                <td><c:out value="${compensation.description}"/></td>
                <td><c:out value="${compensation.amount}"/></td>
                <td><c:out value="${compensation.status}"/></td>
                <td><c:out value="${compensation.requestDate}"/></td>
                <td>
                    <a href="/compensation/update?compensationID=${compensation.requestID}" class="btn-submit">View</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a href="${pageContext.request.contextPath}/listCompensation?page=${i}&status=${param.status}&customerName=${param.customerName}" class="active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/listCompensation?page=${i}&status=${param.status}&customerName=${param.customerName}">${i}</a>
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