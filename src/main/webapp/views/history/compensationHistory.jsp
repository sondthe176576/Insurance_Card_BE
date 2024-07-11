<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compensation History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        .form-container {
            margin-top: 20px;
        }
        .status-pending {
            background-color: yellow;
            color: black;
            padding: 5px;
            border-radius: 5px;
        }
        .status-rejected {
            background-color: red;
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
        .status-approved {
            background-color: green;
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Compensation History</h1>
    <a href="${pageContext.request.contextPath}/compensationHistory?action=addForm" class="btn btn-primary mb-4">Request Compensation</a>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>Request ID</th>
            <th>Customer Name</th>
            <th>Customer ID</th>
            <th>Contract ID</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Description</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${compensationRequests}" var="request">
            <tr>
                <td>${request.requestID}</td>
                <td>${request.customerName}</td>
                <td>${request.customerID}</td>
                <td>${request.contractID}</td>
                <td>${request.amount}</td>
                <td>${request.requestDate}</td>
                <td>${request.description}</td>
                <td class="<c:choose>
                    <c:when test="${request.status == 'Pending'}">status-pending</c:when>
                    <c:when test="${request.status == 'Rejected'}">status-rejected</c:when>
                    <c:when test="${request.status == 'Approved'}">status-approved</c:when>
                </c:choose>">
                        ${request.status}
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/compensationHistory?action=view&id=${request.requestID}" class="btn btn-primary btn-sm">
                        <i class="fas fa-eye"></i>
                    </a>
                    <form action="${pageContext.request.contextPath}/compensationHistory" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="requestID" value="${request.requestID}">
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this record?');">
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

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
