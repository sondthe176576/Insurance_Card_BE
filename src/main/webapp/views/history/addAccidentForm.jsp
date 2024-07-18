<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Accident</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2 class="mt-4 mb-4">Request Accident</h2>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/accidentHistory" method="post">
        <input type="hidden" name="action" value="add">
        <div class="mb-3">
            <label for="customerID" class="form-label">Customer ID:</label>
            <input type="text" class="form-control" id="customerID" name="customerID" required>
        </div>
        <div class="mb-3">
            <label for="customerName" class="form-label">Customer Name:</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div class="mb-3">
            <label for="contractID" class="form-label">Contract ID:</label>
            <input type="text" class="form-control" id="contractID" name="contractID" required>
        </div>
        <div class="mb-3">
            <label for="accidentType" class="form-label">Accident Type:</label>
            <input type="text" class="form-control" id="accidentType" name="accidentType" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description:</label>
            <input type="text" class="form-control" id="description" name="description" required>
        </div>
        <div class="mb-3">
            <label for="accidentDate" class="form-label">Accident Date:</label>
            <input type="date" class="form-control" id="accidentDate" name="accidentDate" required>
        </div>
        <button type="submit" class="btn btn-success">Submit Request</button>
    </form>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
