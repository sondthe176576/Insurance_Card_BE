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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Compensation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/request-list.css">
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
        <!-- Include pagination -->
        <div class="pagination-nav">
            <c:forEach var="i" begin="1" end="${totalPages}">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <a href="${pageContext.request.contextPath}/listCompensation?page=${i}&status=${param.status}&customerName=${param.customerName}" class="page-btn active">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/listCompensation?page=${i}&status=${param.status}&customerName=${param.customerName}" class="page-btn">${i}</a>
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