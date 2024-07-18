<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Accident History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">View Accident</h1>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"></h5>
            <p><strong>Accident ID:</strong> ${accident.accidentID}</p>
            <p><strong>Customer ID:</strong> ${accident.customerID}</p>
            <p><strong>Contract ID:</strong> ${accident.contractID}</p>
            <p><strong>Accident Type:</strong> ${accident.accidentType}</p>
            <p><strong>Accident Date:</strong> ${accident.accidentDate}</p>
            <p><strong>Description:</strong> ${accident.description}</p>
            <p><strong>Status:</strong> ${accident.status}</p>
            <a href="${pageContext.request.contextPath}/accidentHistory" class="btn btn-primary">Back to Accident History</a>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
