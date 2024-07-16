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
    <!-- Include Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        .table thead {
            background-color: #343a40;
            color: white;
        }
        .table-hover tbody tr:hover {
            background-color: #f8f9fa;
        }
        .btn-action {
            margin-right: 5px;
        }
        .page-title {
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</head>
<!-- Navbar -->
<nav class="bg-blue-900 border-b-4 border-orange-600">
    <div class="container mx-auto px-4 py-2 flex justify-center">
        <ul class="flex space-x-6">
            <li>
                <a href="${pageContext.request.contextPath}/homepageforcustomer" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-home mr-2"></i> Home
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/createContract?customerID=${sessionScope.customerID}" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-file-contract mr-2"></i> Buy Insurance
                </a>
            </li>
            <li>
                <a href="#" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-info-circle mr-2"></i> About
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/contractForCustomer" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-file-alt mr-2"></i> Contract
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/dashboard/customerDashboard.jsp" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                </a>
            </li>
        </ul>
    </div>
</nav>

<body>
<div class="container">
    <h1 class="page-title">Punishment History</h1>
    <div class="form-container">
        <table class="table table-hover table-bordered">
            <thead>
            <tr>
                <th>No</th>
                <th>Punishment ID</th>
                <th>Customer ID</th>
                <th>Description</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="punishmentHistory" items="${punishmentHistories}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${punishmentHistory.punishmentID}</td>
                    <td>${punishmentHistory.customerID}</td>
                    <td>${punishmentHistory.description}</td>
                    <td>${punishmentHistory.date}</td>
                    <td>
                        <a href="punishmentHistory?action=view&punishmentID=${punishmentHistory.punishmentID}" class="btn btn-primary btn-sm btn-action">
                            <i class="fas fa-eye"></i>
                        </a>
                        <a href="punishmentHistory?action=edit&punishmentID=${punishmentHistory.punishmentID}" class="btn btn-warning btn-sm btn-action">
                            <i class="fas fa-pencil-alt"></i>
                        </a>
                        <form action="punishmentHistory" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="punishmentID" value="${punishmentHistory.punishmentID}">
                            <button type="submit" class="btn btn-danger btn-sm btn-action" onclick="return confirm('Are you sure you want to delete this record?');">
                                <i class="fas fa-trash"></i>
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
                    <li class="page-item"><a class="page-link" href="?page=1&pageSize=${pageSize}">First</a></li>
                    <li class="page-item"><a class="page-link" href="?page=${page - 1}&pageSize=${pageSize}">Previous</a></li>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${page == i ? 'active' : ''}"><a class="page-link" href="?page=${i}&pageSize=${pageSize}">${i}</a></li>
                </c:forEach>
                <c:if test="${page < totalPages}">
                    <li class="page-item"><a class="page-link" href="?page=${page + 1}&pageSize=${pageSize}">Next</a></li>
                    <li class="page-item"><a class="page-link" href="?page=${totalPages}&pageSize=${pageSize}">Last</a></li>
                </c:if>
            </ul>
        </nav>

    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
