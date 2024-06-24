<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <p>ID: ${compensationHistoryCus.compensationID}</p>
        <p>Customer ID: ${compensationHistoryCus.customerID}</p>
        <p>Amount: ${compensationHistoryCus.amount}</p>
        <p>Date: ${compensationHistoryCus.date}</p>
        <a href="compensationHistory" class="btn btn-primary">Back to List</a>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
