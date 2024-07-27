<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>
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
    <title>Contract List</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Contract List</h1>
    <div class="form-container">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th>Contract ID</th>
                <th>Customer ID</th>
                <th>Contract Info</th>
                <th>Status</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty contracts}">
                <c:forEach var="contract" items="${contracts}">
                    <tr>
                        <td>${contract.contractID}</td>
                        <td>${contract.customerID}</td>
                        <td>${contract.contractInfo}</td>
                        <td>${contract.status}</td>
                        <td>${contract.startDate}</td>
                        <td>${contract.endDate}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/contracts?action=view&id=${contract.contractID}" class="btn btn-primary btn-sm">View</a>
                            <a href="${pageContext.request.contextPath}/contracts?action=edit&id=${contract.contractID}" class="btn btn-warning btn-sm">Edit</a>
                            <form action="${pageContext.request.contextPath}/contracts" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="contractId" value="${contract.contractID}">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this record?');">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>

        <!-- Pagination -->
        <!-- Example pagination, replace with dynamic logic -->
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${page == i ? 'active' : ''}"><a class="page-link" href="?page=${i}">${i}</a></li>
                </c:forEach>
            </ul>
        </nav>

        <!-- Add New Contract Form -->
        <h2 class="mt-4 mb-4">Add New Contract</h2>
        <form action="${pageContext.request.contextPath}/contracts" method="post">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <label for="customerId" class="form-label">Customer ID:</label>
                <input type="text" class="form-control" id="customerId" name="customerId" required>
            </div>
            <div class="mb-3">
                <label for="contractInfo" class="form-label">Contract Info:</label>
                <input type="text" class="form-control" id="contractInfo" name="contractInfo" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status:</label>
                <input type="text" class="form-control" id="status" name="status" required>
            </div>
            <div class="mb-3">
                <label for="startDate" class="form-label">Start Date:</label>
                <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>
            <div class="mb-3">
                <label for="endDate" class="form-label">End Date:</label>
                <input type="date" class="form-control" id="endDate" name="endDate" required>
            </div>
            <button type="submit" class="btn btn-success">Add</button>
        </form>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
