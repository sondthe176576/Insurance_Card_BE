<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contract Information</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Contract Details</h1>
    <div class="card">
        <div class="card-body">
            <p><strong>Contract ID:</strong> ${contract.contractID}</p>
            <p><strong>Customer ID:</strong> ${contract.customerID}</p>
            <p><strong>Contract Info:</strong> ${contract.contractInfo}</p>
            <p><strong>Status:</strong> ${contract.status}</p>
            <p><strong>Start Date:</strong> ${contract.startDate}</p>
            <p><strong>End Date:</strong> ${contract.endDate}</p>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/contracts">Back to List</a>
        </div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
