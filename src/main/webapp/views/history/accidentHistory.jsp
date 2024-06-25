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
    <!-- Include Bootstrap Icons CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        .form-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Accident History</h1>
    <div class="form-container">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th>Accident ID</th>
                <th>Customer ID</th>
                <th>Description</th>
                <th>Accident Date</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="history" items="${accidentHistories}">
                <tr>
                    <td>${history.accidentID}</td>
                    <td>${history.customerID}</td>
                    <td>${history.description}</td>
                    <td>${history.accidentDate}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/accidentHistory?action=view&id=${history.accidentID}" class="btn btn-primary btn-sm">
                            <i class="bi bi-eye"></i>
                        </a>
                        <a href="${pageContext.request.contextPath}/accidentHistory?action=edit&id=${history.accidentID}" class="btn btn-warning btn-sm">
                            <i class="bi bi-pencil"></i>
                        </a>
                        <form action="${pageContext.request.contextPath}/accidentHistory" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="accidentID" value="${history.accidentID}">
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this record?');">
                                <i class="bi bi-trash"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- Pagination -->
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <c:if test="${page > 1}">
                    <li class="page-item"><a class="page-link" href="?page=1">First</a></li>
                    <li class="page-item"><a class="page-link" href="?page=${page - 1}">Previous</a></li>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${page == i ? 'active' : ''}"><a class="page-link" href="?page=${i}">${i}</a></li>
                </c:forEach>
                <c:if test="${page < totalPages}">
                    <li class="page-item"><a class="page-link" href="?page=${page + 1}">Next</a></li>
                    <li class="page-item"><a class="page-link" href="?page=${totalPages}">Last</a></li>
                </c:if>
            </ul>
        </nav>

        <h2 class="mt-4 mb-4">Add New Accident History</h2>
        <form action="${pageContext.request.contextPath}/accidentHistory" method="post">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <label for="customerID" class="form-label">Customer ID:</label>
                <input type="text" class="form-control" id="customerID" name="customerID" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description:</label>
                <input type="text" class="form-control" id="description" name="description" required>
            </div>
            <div class="mb-3">
                <label for="accidentDate" class="form-label">Accident Date:</label>
                <input type="date" class="form-control" id="accidentDate" name="accidentDate" required>
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
