<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header_logout.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Payment History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: #fff;
        }
        .form-title {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <div class="form-container">
        <h1 class="form-title">Edit Payment History</h1>
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

            <!-- Payment Method -->
            <div class="mb-3">
                <label for="paymentMethodID" class="form-label">Payment Method:</label>
                <select class="form-control" id="paymentMethodID" name="paymentMethodID" required>
                    <option value="1" <c:if test="${paymentHistory.paymentMethodID == 1}">selected</c:if>>Cash</option>
                    <option value="2" <c:if test="${paymentHistory.paymentMethodID == 2}">selected</c:if>>Bank Transfer</option>
                </select>
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
</div>

<jsp:include page="/views/includes/footer.jsp" />

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
