<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Punishment History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Edit Punishment History</h1>
    <form action="punishmentHistory" method="post" class="mt-3">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="punishmentID" value="${punishmentHistory.punishmentID}">
        <div class="mb-3">
            <label for="customerID" class="form-label">Customer ID</label>
            <input type="text" class="form-control" id="customerID" name="customerID" value="${punishmentHistory.customerID}" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <input type="text" class="form-control" id="description" name="description" value="${punishmentHistory.description}" required>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="punishmentHistory" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
