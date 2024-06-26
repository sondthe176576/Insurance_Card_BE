<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Contract</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Cancel Contract</h1>
    <p>Do you want to cancel this contract?</p>
    <form action="${pageContext.request.contextPath}/cancelContract" method="POST">
        <input type="hidden" name="contractId" value="${param.contractId}">
        <button type="submit" class="btn btn-danger" name="action" value="cancel">Cancel Contract</button>
        <a href="${pageContext.request.contextPath}/contractDetail/${param.contractId}" class="btn btn-secondary">Back</a>
    </form>
</div>
<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
