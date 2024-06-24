<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Payment History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">View Payment History</h1>
    <div class="card">
        <div class="card-body">
            <p><strong>Payment ID:</strong> ${paymentHistoryCus.paymentID}</p>
            <p><strong>Customer ID:</strong> ${paymentHistoryCus.customerID}</p>
            <p><strong>Amount:</strong> ${paymentHistoryCus.amount}</p>
            <p><strong>Payment Date:</strong> ${paymentHistoryCus.paymentDate}</p>
            <p><strong>Payment Method ID:</strong> ${paymentHistoryCus.paymentMethodID}</p>
            <p><strong>Contract ID:</strong> ${paymentHistoryCus.contractID}</p>
            <a href="${pageContext.request.contextPath}/paymentHistory" class="btn btn-secondary">Back to List</a>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
