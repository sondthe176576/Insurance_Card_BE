<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>
<%
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        request.getRequestDispatcher("/views/homepage/home.jsp").forward(request, response);
        return;
    }

    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
    if (userFromDB == null) {
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border-radius: 10px;
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .card-body {
            text-align: center;
        }
        .btn-custom {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card shadow-sm">
        <div class="card-header">
            <h1 class="my-3">Request Pending</h1>
        </div>
        <div class="card-body">
            <div class="alert alert-info" role="alert">
                Your request has been submitted and is pending for review.
            </div>
            <p class="mb-4">Please wait while our team reviews your request. You will be notified once the review is complete.</p>
            <a href="${pageContext.request.contextPath}/homepageforcustomer" class="btn btn-custom btn-lg">Go to Homepage</a>
        </div>
    </div>
</div>
<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
