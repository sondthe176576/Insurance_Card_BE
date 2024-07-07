<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contract Cancellation Successful</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-success" role="alert">
        <h4 class="alert-heading">Contract Cancellation Successful!</h4>
        <p>Your contract has been successfully canceled and is currently being processed. If there are any notifications, we will send them to your email.</p>
        <hr>
        <p class="mb-0">If you have any questions, please contact us.</p>
    </div>
    <a href="${pageContext.request.contextPath}/homepageforcustomer" class="btn btn-primary">Back to Home</a>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>