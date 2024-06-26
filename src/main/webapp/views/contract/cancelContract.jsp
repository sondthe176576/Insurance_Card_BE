<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Contract</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Edit Contract</h1>
    <form action="${pageContext.request.contextPath}/contracts" method="post">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="contractId" value="${contract.contractID}" />
        <div class="mb-3">
            <label for="customerId" class="form-label">Customer ID</label>
            <input type="text" class="form-control" id="customerId" name="customerId" value="${contract.customerID}" required>
        </div>
        <div class="mb-3">
            <label for="contractInfo" class="form-label">Contract Info</label>
            <input type="text" class="form-control" id="contractInfo" name="contractInfo" value="${contract.contractInfo}" required>
        </div>
        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <input type="text" class="form-control" id="status" name="status" value="${contract.status}" required>
        </div>
        <div class="mb-3">
            <label for="startDate" class="form-label">Start Date</label>
            <input type="date" class="form-control" id="startDate" name="startDate" value="${contract.startDate}" required>
        </div>
        <div class="mb-3">
            <label for="endDate" class="form-label">End Date</label>
            <input type="date" class="form-control" id="endDate" name="endDate" value="${contract.endDate}" required>
        </div>
        <button type="submit" class="btn btn-primary">Update Contract</button>
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/contracts?action=view&id=${contract.contractID}">Cancel</a>
    </form>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
