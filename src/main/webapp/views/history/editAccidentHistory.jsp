<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Accident</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Edit Accident</h1>
    <form action="${pageContext.request.contextPath}/accidentHistory" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="accidentID" value="${accident.accidentID}">
        <div class="mb-3">
            <label for="customerID" class="form-label">Customer ID:</label>
            <input type="text" class="form-control" id="customerID" name="customerID" value="${accident.customerID}" readonly>
        </div>
        <div class="mb-3">
            <label for="contractID" class="form-label">Contract ID:</label>
            <input type="text" class="form-control" id="contractID" name="contractID" value="${accident.contractID}" readonly>
        </div>
        <div class="mb-3">
            <label for="accidentType" class="form-label">Accident Type:</label>
            <input type="text" class="form-control" id="accidentType" name="accidentType" value="${accident.accidentType}" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description:</label>
            <input type="text" class="form-control" id="description" name="description" value="${accident.description}" required>
        </div>
        <div class="mb-3">
            <label for="accidentDate" class="form-label">Accident Date:</label>
            <input type="date" class="form-control" id="accidentDate" name="accidentDate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${accident.accidentDate}' />" required>
        </div>
        <!-- Status field is excluded from editing -->
        <div class="mb-3">
            <label for="status" class="form-label">Status:</label>
            <input type="text" class="form-control" id="status" name="status" value="${accident.status}" readonly>
        </div>
        <button type="submit" class="btn btn-primary">Update Accident</button>
        <a href="${pageContext.request.contextPath}/accidentHistory" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
