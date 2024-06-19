<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/3/2024
  Time: 12:00 PM
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
    <title>List Accidents</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listAccident.css">
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
        <h2>Accident Management</h2>
        <h3>List of Accidents</h3>
        <form method="get" class="filter-form" action="${pageContext.request.contextPath}/listAccident">
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
        <table class="accident-table">
            <thead>
            <tr>
                <th>No</th>
                <th>Customer ID</th>
                <th>Customer Name</th>
                <th>Contract ID</th>
                <th>Accident Type</th>
                <th>Accident Date</th>
                <th>Description</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="accident" items="${accidents}" varStatus="status">
                <tr>
                    <td><c:out value="${(currentPage - 1) * 10 + status.count}"/></td>
                    <td><c:out value="${accident.customerID}"/></td>
                    <td><c:out value="${accident.customerName}"/></td>
                    <td><c:out value="${accident.contractID}"/></td>
                    <td><c:out value="${accident.accidentType}"/></td>
                    <td><fmt:formatDate value="${accident.accidentDate}" pattern="dd-MM-yyyy"/></td>
                    <td><c:out value="${accident.description}"/></td>
                    <td class="${accident.status == 'Pending' ? 'status-pending' : accident.status == 'Approved' ? 'status-approved' : accident.status == 'Rejected' ? 'status-rejected' : ''}">
                        <c:out value="${accident.status}"/>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/resolveAccident?accidentID=${accident.accidentID}"
                           class="btn-view"><i class="fa-solid fa-eye"></i></a>
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
                        <a href="${pageContext.request.contextPath}/listAccident?page=${i}&status=${param.status}&customerName=${param.customerName}"
                           class="page-btn active">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/listAccident?page=${i}&status=${param.status}&customerName=${param.customerName}"
                           class="page-btn">${i}</a>
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