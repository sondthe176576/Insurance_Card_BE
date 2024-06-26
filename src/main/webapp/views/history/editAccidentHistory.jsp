<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Accident History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Edit Accident History</h1>
    <form action="${pageContext.request.contextPath}/accidentHistory" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="accidentID" value="${accidentHistoryCus.accidentID}">

        <!-- Customer ID -->
        <div class="mb-3">
            <label for="customerID" class="form-label">Customer ID:</label>
            <input type="text" class="form-control" id="customerID" name="customerID" value="${accidentHistoryCus.customerID}" required>
        </div>

        <!-- Accident Date -->
        <div class="mb-3">
            <label for="accidentDate" class="form-label">Accident Date:</label>
            <input type="date" class="form-control" id="accidentDate" name="accidentDate" value="${accidentHistoryCus.accidentDate}" required>
        </div>

        <!-- Description -->
        <div class="mb-3">
            <label for="description" class="form-label">Description:</label>
            <input type="text" class="form-control" id="description" name="description" value="${accidentHistoryCus.description}" required>
        </div>

        <!-- Update and Cancel Buttons -->
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="${pageContext.request.contextPath}/accidentHistory" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
