<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accident History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Accident History</h1>
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/accidentHistory" method="post">
        </form>
        <table class="table table-striped">
                <thead>
                <tr>
                    <th>User ID</th>
                    <th>Personal Info</th>
                    <th>Full Name</th>
                    <th>Accident ID</th>
                    <th>Description</th>
                    <th>Date</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listAh}" var="accident">
                    <tr>
                        <td>${accident.userId}</td>
                        <td>${accident.personalInfo}</td>
                        <td>${accident.fullName}</td>
                        <td>${accident.accidentId}</td>
                        <td>${accident.description}</td>
                        <td>${accident.date}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
</div>
<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>