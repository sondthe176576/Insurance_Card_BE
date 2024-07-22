<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Compensation Request</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<style>
    .page-title {
        font-size: 2.5rem;
        font-weight: bold;
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }
</style>

<!-- Navbar -->
<nav class="bg-blue-900 border-b-4 border-orange-600">
    <div class="container mx-auto px-4 py-2 flex justify-center">
        <ul class="flex space-x-6">
            <li>
                <a href="${pageContext.request.contextPath}/homepageforcustomer" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-home mr-2"></i> Home
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/createContract?customerID=${sessionScope.customerID}" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-file-contract mr-2"></i> Buy Insurance
                </a>
            </li>
            <li>
                <a href="#" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-info-circle mr-2"></i> About
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/contractForCustomer" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-file-alt mr-2"></i> Contract
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/dashboard/customerDashboard.jsp" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                </a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <h1 class="page-title">Edit Compensation Request</h1>
    <div class="card">
        <div class="card-body">
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">
                    <c:out value="${errorMessage}"/>
                </div>
            </c:if>
            <form action="${pageContext.request.contextPath}/compensationHistory" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="requestID" value="${compensationRequest.requestID}">
                <div class="mb-3">
                    <label for="customerID" class="form-label">Customer ID:</label>
                    <input type="text" class="form-control" id="customerID" name="customerID" value="${compensationRequest.customerID}" readonly>
                </div>
                <div class="mb-3">
                    <label for="contractID" class="form-label">Contract ID:</label>
                    <input type="text" class="form-control" id="contractID" name="contractID" value="${compensationRequest.contractID}" readonly>
                </div>
                <div class="mb-3">
                    <label for="amount" class="form-label">Amount:</label>
                    <input type="text" class="form-control" id="amount" name="amount" value="${compensationRequest.amount}" <c:if test="${compensationRequest.status != 'Pending'}">readonly</c:if> required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description:</label>
                    <input type="text" class="form-control" id="description" name="description" value="${compensationRequest.description}" <c:if test="${compensationRequest.status != 'Pending'}">readonly</c:if> required>
                </div>
                <div class="mb-3">
                    <label for="requestDate" class="form-label">Request Date:</label>
                    <input type="date" class="form-control" id="requestDate" name="requestDate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${compensationRequest.requestDate}' />" <c:if test="${compensationRequest.status != 'Pending'}">readonly</c:if> required>
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Status:</label>
                    <input type="text" class="form-control" id="status" name="status" value="${compensationRequest.status}" readonly>
                </div>
                <c:if test="${compensationRequest.status == 'Pending'}">
                    <button type="submit" class="btn btn-primary">Update Request</button>
                </c:if>
                <a href="${pageContext.request.contextPath}/compensationHistory" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
