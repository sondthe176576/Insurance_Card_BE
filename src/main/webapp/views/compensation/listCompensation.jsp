<%--
  Created by IntelliJ IDEA.
  User: TRAN HUU HUNG
  Date: 6/27/2024
  Time: 3:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listCompensation.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->
<!-- Form -->
<div class="container mt-5 compensation-form-section">
    <div class="card p-4 shadow-sm">
        <h2 class="text-center mb-4">Compensation Management</h2>
        <form method="get" class="row g-3 compensation-form" action="${pageContext.request.contextPath}/listCompensation">
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
                <input type="text" id="customerNameSearch" name="customerName" value="${param.customerName}" class="form-control" placeholder="Enter customer name"/>
            </div>
            <div class="col-md-4 d-flex align-items-end">
                <button type="submit" class="btn btn-primary search-button"><i class="bi bi-search"></i> Search</button>
            </div>
        </form>
        <table class="table table-hover mt-4">
            <thead class="table-dark">
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
                    <td class="${compensation.status == 'Pending' ? 'text-warning' : compensation.status == 'Approved' ? 'text-success' : compensation.status == 'Rejected' ? 'text-danger' : ''}">
                        <c:out value="${compensation.status}"/>
                    </td>
                    <td><fmt:formatDate value="${compensation.requestDate}" pattern="dd-MM-yyyy"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/resolveCompensation?compensationID=${compensation.requestID}" class="btn btn-info btn-sm"><i class="bi bi-eye-fill"></i> View</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- Include pagination -->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-end">
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/listCompensation?page=${currentPage - 1}&status=${param.status}&customerName=${param.customerName}">
                            <i class="bi bi-arrow-left"></i>
                        </a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:if test="${i >= currentPage - 1 && i <= currentPage + 1}">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="${pageContext.request.contextPath}/listCompensation?page=${i}&status=${param.status}&customerName=${param.customerName}">${i}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/listCompensation?page=${currentPage + 1}&status=${param.status}&customerName=${param.customerName}">
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>