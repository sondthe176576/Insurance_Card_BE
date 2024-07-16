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
    <style>
        .page-title {
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            color: #333;
            margin: 20px 0;
        }
        .card {
            margin-top: 20px;
        }
        .card-body p {
            margin: 10px 0;
            font-size: 1rem;
        }
        .btn-back {
            display: block;
            margin: 20px auto 0;
            width: fit-content;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="page-title">View Payment History</h1>
    <div class="card">
        <div class="card-body">
            <p><strong>Payment ID:</strong> ${paymentHistory.paymentID}</p>
            <p><strong>Customer ID:</strong> ${paymentHistory.customerID}</p>
            <p><strong>Amount:</strong> ${paymentHistory.amount}</p>
            <p><strong>Payment Date:</strong> ${paymentHistory.paymentDate}</p>
            <p><strong>Payment Method ID:</strong> ${paymentHistory.paymentMethodID}</p>
            <p><strong>Contract ID:</strong> ${paymentHistory.contractID}</p>
            <a href="${pageContext.request.contextPath}/paymentHistory" class="btn btn-secondary btn-back">Back to List</a>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
