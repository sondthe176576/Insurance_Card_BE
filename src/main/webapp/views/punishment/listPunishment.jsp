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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listPunishment.css">
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
        <button type="submit" class="btn-submit"><i class="fa-solid fa-magnifying-glass"></i></button>
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
                <td class="${punishment.status == 'Paid' ? 'status-paid' : punishment.status == 'Approved' ? 'status-approved' : punishment.status == 'Rejected' ? 'status-rejected' : 'status-pending'}">
                    <c:out value="${punishment.status}"/>
                </td>
                <td><fmt:formatDate value="${punishment.contract.cancellationDate}" pattern="dd-MM-yyyy"/></td>
                <td><fmt:formatDate value="${punishment.contract.endDate}" pattern="dd-MM-yyyy"/></td>
                <td>
                    <a href="${pageContext.request.contextPath}/resolvePunishment?punishmentID=${punishment.punishmentID}" class="btn-view"><i class="fa-solid fa-eye"></i></a>
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