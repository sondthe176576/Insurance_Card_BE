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
    <h1 class="mt-4 mb-4">Edit Compensation History</h1>
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/compensationHistory" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="requestID" value="${compensationRequest.requestID}">
            <div class="mb-3">
                <label for="customerID" class="form-label">Customer ID:</label>
                <input type="text" id="customerID" name="customerID" class="form-control" value="${compensationRequest.customerID}" readonly>
            </div>
            <div class="mb-3">
                <label for="contractID" class="form-label">Contract ID:</label>
                <input type="text" id="contractID" name="contractID" class="form-control" value="${compensationRequest.contractID}" readonly>
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Amount:</label>
                <input type="text" id="amount" name="amount" class="form-control" value="${compensationRequest.amount}" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description:</label>
                <textarea id="description" name="description" class="form-control" required>${compensationRequest.description}</textarea>
            </div>
            <div class="mb-3">
                <label for="requestDate" class="form-label">Request Date:</label>
                <input type="date" id="requestDate" name="requestDate" class="form-control" value="${compensationRequest.requestDate}" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status:</label>
                <select id="status" name="status" class="form-control" readonly disabled>
                    <option value="Pending" ${compensationRequest.status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="Approved" ${compensationRequest.status == 'Approved' ? 'selected' : ''}>Approved</option>
                    <option value="Rejected" ${compensationRequest.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                </select>
                <input type="hidden" name="status" value="${compensationRequest.status}">
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="${pageContext.request.contextPath}/compensationHistory" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
