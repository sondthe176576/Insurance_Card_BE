<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Waiting Contracts</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/waitingContracts.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%-- Thiết lập biến để nhận diện trang hiện tại --%>
<c:set var="page" value="waitingContracts"/>

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
            <h2 class="text-center mb-4 mt-4">List of Waiting Contracts</h2>
            <form class="row g-3" method="get" action="${pageContext.request.contextPath}/listWaitingContract">
                <div class="col-md-4">
                    <label for="customerName" class="form-label">Search by Customer Name:</label>
                    <input type="text" id="customerName" name="customerName" value="${param.customerName}"
                           class="form-control" placeholder="Enter customer name"/>
                </div>
                <div class="col-md-4">
                    <label for="startDate" class="form-label">Search by Start Date:</label>
                    <input type="date" id="startDate" name="startDate" value="${param.startDate}" class="form-control"/>
                </div>
                <div class="col-md-4">
                    <label for="insuranceType" class="form-label">Filter by Insurance Type:</label>
                    <select id="insuranceType" name="insuranceType" class="form-select">
                        <option value="">All</option>
                        <option value="Basic" ${param.insuranceType == 'Basic' ? 'selected' : ''}>Basic</option>
                        <option value="Comprehensive" ${param.insuranceType == 'Comprehensive' ? 'selected' : ''}>
                            Comprehensive
                        </option>
                        <option value="Premium" ${param.insuranceType == 'Premium' ? 'selected' : ''}>Premium</option>
                    </select>
                </div>
                <div class="col-md-12 d-flex align-items-end justify-content-end mt-3">
                    <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Search</button>
                </div>
            </form>
            <table class="table table-hover mt-4">
                <thead class="table-dark">
                <tr>
                    <th>No</th>
                    <th>Customer Name</th>
                    <th>Customer ID</th>
                    <th>Contract Info</th>
                    <th>Status</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Insurance Type</th>
                    <th>Coverage</th>
                    <th>Premium</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="contract" items="${waitingContracts}" varStatus="status">
                    <tr>
                        <td><c:out value="${(currentPage - 1) * 10 + status.count}"/></td>
                        <td><c:out value="${contract.customerName}"/></td>
                        <td><c:out value="${contract.customerID}"/></td>
                        <td><c:out value="${contract.contractInfo}"/></td>
                        <td><c:out value="${contract.status}"/></td>
                        <td><fmt:formatDate value="${contract.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${contract.endDate}" pattern="yyyy-MM-dd"/></td>
                        <td><c:out value="${contract.insuranceType}"/></td>
                        <td><c:out value="${contract.coverage}"/></td>
                        <td><fmt:formatNumber value="${contract.premium}" type="currency" currencySymbol="$"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/resolveWaitingContract?contractID=${contract.contractID}"
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
                               href="${pageContext.request.contextPath}/listWaitingContract?page=${currentPage - 1}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}">
                                <i class="bi bi-arrow-left"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:if test="${i >= currentPage - 1 && i <= currentPage + 1}">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link"
                                   href="${pageContext.request.contextPath}/listWaitingContract?page=${i}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/listWaitingContract?page=${currentPage + 1}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}">
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