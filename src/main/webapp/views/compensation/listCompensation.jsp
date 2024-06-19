<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Compensation</title>
    <!-- Liên kết đến Font Awesome cục bộ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .title {
            text-align: center;
            color: #2c3e50;
            font-size: 36px;
            margin: 30px 0;
        }

        .section {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .section:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
        }

        .section h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 30px;
            border-bottom: 2px solid #2980b9;
            padding-bottom: 10px;
        }

        .section h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            font-size: 24px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 5px;
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
            background: none;
            border: none;
            cursor: pointer;
            font-size: 20px;
            color: #2980b9;
        }

        .filter-form button:hover {
            color: #1a6ba1;
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

        .btn-view {
            background: none;
            border: none;
            color: #3498db;
            cursor: pointer;
            font-size: 20px;
            padding: 0;
            margin: 0;
        }

        .btn-view:hover {
            color: #1a6ba1;
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
<div class="container">
    <div class="section">
        <h2>Compensation Management</h2>
        <h3>List Request From Customer</h3>
        <form method="get" class="filter-form" action="${pageContext.request.contextPath}/listCompensation">
            <div class="form-group">
                <label for="statusFilter">Filter by Status:</label>
                <select id="statusFilter" name="status" class="status-select">
                    <option value="">All</option>
                    <option value="Pending" ${param.status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="Approved" ${param.status == 'Approved' ? 'selected' : ''}>Approved</option>
                    <option value="Rejected" ${param.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                </select>
            </div>
            <div class="form-group">
                <label for="customerNameSearch">Search by Customer Name:</label>
                <input type="text" id="customerNameSearch" name="customerName" value="${param.customerName}" placeholder="Enter customer name"/>
            </div>
            <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
        <table class="compensation-table">
            <thead>
            <tr>
                <th>No</th>
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
            <c:forEach var="compensation" items="${requests}" varStatus="status">
                <tr>
                    <td><c:out value="${(currentPage - 1) * 10 + status.count}"/></td>
                    <td><c:out value="${compensation.customerID}"/></td>
                    <td><c:out value="${compensation.contractID}"/></td>
                    <td><c:out value="${compensation.customerName}"/></td>
                    <td><c:out value="${compensation.description}"/></td>
                    <td><fmt:formatNumber value="${compensation.amount}" type="currency" currencySymbol="$"/></td>
                    <td class="<c:out value="${compensation.status == 'Pending' ? 'status-pending' : compensation.status == 'Approved' ? 'status-approved' : compensation.status == 'Rejected' ? 'status-rejected' : ''}"/>">
                        <c:out value="${compensation.status}"/>
                    </td>
                    <td><fmt:formatDate value="${compensation.requestDate}" pattern="dd-MM-yyyy"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/resolveCompensation?compensationID=${compensation.requestID}" class="btn-view"><i class="fa-solid fa-eye"></i></a>
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
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>