<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Punishment History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Punishment History</h1>
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/punishmentHistory" method="get" class="row g-3 mb-3">
            <div class="col-md-2">
                <label for="page" class="form-label">Page</label>
                <input type="number" class="form-control" id="page" name="page" value="${param.page != null ? param.page : 1}">
            </div>
            <div class="col-md-2">
                <label for="pageSize" class="form-label">Page Size</label>
                <input type="number" class="form-control" id="pageSize" name="pageSize" value="${param.pageSize != null ? param.pageSize : 5}">
            </div>
            <!-- Add other filter fields here if needed -->
            <div class="col-md-12">
                <button type="submit" class="btn btn-primary mt-3">Filter</button>
            </div>
        </form>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Punishment ID</th>
                <th>Customer ID</th>
                <th>Description</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${punishmentHistoryList}" var="punishmentHistory">
                <tr>
                    <td>${punishmentHistory.punishmentID}</td>
                    <td>${punishmentHistory.customerID}</td>
                    <td>${punishmentHistory.description}</td>
                    <td>${punishmentHistory.date}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
