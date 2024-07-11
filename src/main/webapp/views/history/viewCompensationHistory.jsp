<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Compensation History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>View Compensation History</h1>
    <div class="card mt-4">
        <div class="card-body">
            <p><strong>Customer ID:</strong> ${compensationRequest.customerID}</p>
            <p><strong>Customer Name:</strong> ${compensationRequest.customerName}</p>
            <p><strong>Contract ID:</strong> ${compensationRequest.contractID}</p>
            <p><strong>Amount:</strong> ${compensationRequest.amount}</p>
            <p><strong>Description:</strong> ${compensationRequest.description}</p>
            <p><strong>Date:</strong> ${compensationRequest.requestDate}</p>
            <p><strong>Status:</strong> ${compensationRequest.status}</p>
            <a href="${pageContext.request.contextPath}/compensationHistory" class="btn btn-primary">Back to List</a>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
