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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Punishments</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listPunishment.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listHeader.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%-- Thiết lập biến để nhận diện trang hiện tại --%>
<c:set var="page" value="punishment"/>

<!-- Include header -->
<jsp:include page="/views/includes/header_list.jsp"/>
<!-- End of header -->

<!-- Include sidebar -->
<jsp:include page="/views/includes/sidebar.jsp"/>
<!-- End of sidebar -->

<!-- Main Content -->
<div class="main-content">
    <div class="container mt-5">
        <div class="card p-4 shadow-sm">
            <h2 class="text-center mb-4 mt-4">Punishment Management System</h2>
            <form method="get" class="row g-3" action="${pageContext.request.contextPath}/listPunishment">
                <div class="col-md-4">
                    <label for="statusFilter" class="form-label">Filter by Status:</label>
                    <select id="statusFilter" name="status" class="form-select">
                        <option value="">All</option>
                        <option value="Paid" ${param.status == 'Paid' ? 'selected' : ''}>Paid</option>
                        <option value="Approved" ${param.status == 'Approved' ? 'selected' : ''}>Approved</option>
                        <option value="Rejected" ${param.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="customerNameSearch" class="form-label">Search by Customer Name:</label>
                    <input type="text" id="customerNameSearch" name="customerName" value="${param.customerName}"
                           class="form-control" placeholder="Enter customer name"/>
                </div>
                <div class="col-md-4 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary search-button"><i class="bi bi-search"></i> Search
                    </button>
                </div>
            </form>
            <table class="table table-hover mt-4">
                <thead class="table-dark">
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
                        <td class="${punishment.status == 'Paid' ? 'text-warning' : punishment.status == 'Approved' ? 'text-success' : punishment.status == 'Rejected' ? 'text-danger' : ''}">
                            <c:out value="${punishment.status}"/>
                        </td>
                        <td><fmt:formatDate value="${punishment.contract.cancellationDate}" pattern="dd-MM-yyyy"/></td>
                        <td><fmt:formatDate value="${punishment.contract.endDate}" pattern="dd-MM-yyyy"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/resolvePunishment?punishmentID=${punishment.punishmentID}"
                               class="btn btn-info btn-sm"><i class="bi bi-eye-fill"></i> View</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Pagination -->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/listPunishment?page=${currentPage - 1}&status=${param.status}&customerName=${param.customerName}">
                                <i class="bi bi-arrow-left"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:if test="${i >= currentPage - 1 && i <= currentPage + 1}">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link"
                                   href="${pageContext.request.contextPath}/listPunishment?page=${i}&status=${param.status}&customerName=${param.customerName}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/listPunishment?page=${currentPage + 1}&status=${param.status}&customerName=${param.customerName}">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!-- End of Main Content -->
</body>
</html>