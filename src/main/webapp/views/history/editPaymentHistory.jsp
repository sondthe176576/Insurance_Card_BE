<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Payment History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Edit Payment History</h1>
    <form action="${pageContext.request.contextPath}/paymentHistory" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="paymentID" value="${paymentHistory.paymentID}">

        <!-- Customer ID -->
        <div class="mb-3">
            <label for="customerID" class="form-label">Customer ID:</label>
            <input type="text" class="form-control" id="customerID" name="customerID" value="${paymentHistory.customerID}" required>
        </div>

        <!-- Amount -->
        <div class="mb-3">
            <label for="amount" class="form-label">Amount:</label>
            <input type="text" class="form-control" id="amount" name="amount" value="${paymentHistory.amount}" required>
        </div>

        <!-- Payment Date -->
        <div class="mb-3">
            <label for="paymentDate" class="form-label">Payment Date:</label>
            <input type="date" class="form-control" id="paymentDate" name="paymentDate" value="${paymentHistory.paymentDate}" required>
        </div>

        <!-- Payment Method ID -->
        <div class="mb-3">
            <label for="paymentMethodID" class="form-label">Payment Method ID:</label>
            <input type="text" class="form-control" id="paymentMethodID" name="paymentMethodID" value="${paymentHistory.paymentMethodID}" required>
        </div>

        <!-- Contract ID -->
        <div class="mb-3">
            <label for="contractID" class="form-label">Contract ID:</label>
            <input type="text" class="form-control" id="contractID" name="contractID" value="${paymentHistory.contractID}" required>
        </div>

        <!-- Update and Cancel Buttons -->
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="${pageContext.request.contextPath}/paymentHistory" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<jsp:include page="/views/includes/footer.jsp" />

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
