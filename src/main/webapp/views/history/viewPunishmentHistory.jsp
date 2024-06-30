<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Punishment History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>View Punishment History</h1>
    <div class="card mt-4">

        <div class="card-body">
            <p><strong>Punishment ID:</strong> ${punishmentHistory.punishmentID}</p>
            <p><strong>Customer ID:</strong> ${punishmentHistory.customerID}</p>
            <p><strong>Description:</strong> ${punishmentHistory.description}</p>
            <p><strong>Date:</strong> ${punishmentHistory.date}</p>
            <a href="punishmentHistory" class="btn btn-secondary">Back to List</a>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
