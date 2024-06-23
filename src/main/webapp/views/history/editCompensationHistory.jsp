<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Compensation History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Edit Compensation History</h1>
    <div class="form-container">
        <form action="compensationHistory" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="compensationID" value="${compensationHistoryCus.compensationID}">
            <div class="mb-3">
                <label for="customerID" class="form-label">Customer ID:</label>
                <input type="text" id="customerID" name="customerID" class="form-control" value="${compensationHistoryCus.customerID}" required>
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Amount:</label>
                <input type="text" id="amount" name="amount" class="form-control" value="${compensationHistoryCus.amount}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="compensationHistory" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
