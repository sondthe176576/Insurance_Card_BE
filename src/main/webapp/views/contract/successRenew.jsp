<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contract Renewal Successful</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-success" role="alert">
        <h4 class="alert-heading">Contract Renewal Successful!</h4>
        <p>Your contract renewal request has been successfully submitted and is currently being processed. If there are any notifications, we will send them to your email.</p>
        <hr>
        <p class="mb-0">If you have any questions, please contact us.</p>
    </div>
    <a href="${pageContext.request.contextPath}/homepageforcustomer" class="btn btn-primary">Back to Home</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>