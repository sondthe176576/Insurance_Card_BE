<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/30/2024
  Time: 10:29 PM
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
    <title>List Renew Contracts</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listRenewContract.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listHeader.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%-- Thiết lập biến để nhận diện trang hiện tại --%>
<c:set var="page" value="renewContract"/>

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
            <h2 class="text-center mb-4 mt-4">Renew Contract Management System</h2>

            <c:if test="${param.message != null}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <c:out value="${param.message}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <form class="row g-3" method="get" action="${pageContext.request.contextPath}/listRenewContract">
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
                    <th>Contract Info</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th class="overdue">Days Overdue</th> <!-- Chuyển cột mới này ngay sau End Date -->
                    <th>Insurance Type</th>
                    <th>Coverage</th>
                    <th>Premium</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="entry" items="${contractDaysOverdueMap}" varStatus="status">
                    <c:set var="contract" value="${entry.key}"/>
                    <c:set var="daysOverdue" value="${entry.value}"/>
                    <tr>
                        <td><c:out value="${(currentPage - 1) * 10 + status.count}"/></td>
                        <td><c:out value="${contract.customerID}"/></td>
                        <td><c:out value="${contract.customerName}"/></td>
                        <td><c:out value="${contract.contractID}"/></td>
                        <td><c:out value="${contract.contractInfo}"/></td>
                        <td><fmt:formatDate value="${contract.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${contract.endDate}" pattern="yyyy-MM-dd"/></td>
                        <td class="overdue">
                            <c:out value="${daysOverdue}"/> days
                        </td>
                        <td><c:out value="${contract.insuranceType}"/></td>
                        <td><c:out value="${contract.coverage}"/></td>
                        <td><fmt:formatNumber value="${contract.premium}" type="currency" currencySymbol="$"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/renewContract?contractID=${contract.contractID}"
                               class="btn btn-info btn-sm"><i class="bi bi-arrow-clockwise"></i> Renew</a>
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
                               href="${pageContext.request.contextPath}/listRenewContract?page=${currentPage - 1}&customerName=${param.customerName}">
                                <i class="bi bi-arrow-left"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:if test="${i >= currentPage - 1 && i <= currentPage + 1}">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link"
                                   href="${pageContext.request.contextPath}/listRenewContract?page=${i}&customerName=${param.customerName}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/listRenewContract?page=${currentPage + 1}&customerName=${param.customerName}">
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