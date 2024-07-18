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
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listAccident.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listHeader.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%-- Thiết lập biến để nhận diện trang hiện tại --%>
<c:set var="page" value="accidents"/>

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
            <h2 class="text-center mb-4 mt-4">Accident Management System</h2>
            <form class="row g-3" method="get" action="${pageContext.request.contextPath}/listAccident">
                <div class="col-md-4">
                    <label for="statusFilter" class="form-label">Filter by Status:</label>
                    <select id="statusFilter" name="status" class="form-select">
                        <option value="">All</option>
                        <option value="Pending" ${param.status == 'Pending' ? 'selected' : ''}>Pending</option>
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
                        <td><fmt:formatDate value="${accident.accidentDate}" pattern="yyyy-MM-dd"/></td>
                        <td><c:out value="${accident.description}"/></td>
                        <td class="${accident.status == 'Pending' ? 'text-warning' : accident.status == 'Approved' ? 'text-success' : accident.status == 'Rejected' ? 'text-danger' : ''}">
                            <c:out value="${accident.status}"/>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/resolveAccident?accidentID=${accident.accidentID}"
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
                               href="${pageContext.request.contextPath}/listAccident?page=${currentPage - 1}&status=${param.status}&customerName=${param.customerName}">
                                <i class="bi bi-arrow-left"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:if test="${i >= currentPage - 1 && i <= currentPage + 1}">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link"
                                   href="${pageContext.request.contextPath}/listAccident?page=${i}&status=${param.status}&customerName=${param.customerName}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/listAccident?page=${currentPage + 1}&status=${param.status}&customerName=${param.customerName}">
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