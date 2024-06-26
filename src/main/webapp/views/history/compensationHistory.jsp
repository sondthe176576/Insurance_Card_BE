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
    <!-- Include Bootstrap Icons CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Compensation History</h1>
    <div class="form-container">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Customer ID</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="history" items="${compensationHistories}">
                <tr>
                    <td>${history.compensationID}</td>
                    <td>${history.customerID}</td>
                    <td>${history.amount}</td>
                    <td>${history.date}</td>
                    <td>
                        <a href="compensationHistory?action=view&id=${history.compensationID}" class="btn btn-primary btn-sm">
                            <i class="bi bi-eye"></i>
                        </a>
                        <a href="compensationHistory?action=edit&id=${history.compensationID}" class="btn btn-warning btn-sm">
                            <i class="bi bi-pencil"></i>
                        </a>
                        <form action="compensationHistory" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="compensationID" value="${history.compensationID}">
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
                    <li class="page-item"><a class="page-link" href="?customerId=${customerId}&page=1&pageSize=${pageSize}">First</a></li>
                    <li class="page-item"><a class="page-link" href="?customerId=${customerId}&page=${page - 1}&pageSize=${pageSize}">Previous</a></li>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${page == i ? 'active' : ''}"><a class="page-link" href="?customerId=${customerId}&page=${i}&pageSize=${pageSize}">${i}</a></li>
                </c:forEach>
                <c:if test="${page < totalPages}">
                    <li class="page-item"><a class="page-link" href="?customerId=${customerId}&page=${page + 1}&pageSize=${pageSize}">Next</a></li>
                    <li class="page-item"><a class="page-link" href="?customerId=${customerId}&page=${totalPages}&pageSize=${pageSize}">Last</a></li>
                </c:if>
            </ul>
        </nav>



        <h2 class="mt-4 mb-4">Request Compensation</h2>
        <form action="${pageContext.request.contextPath}/compensationHistory" method="post">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <label for="customerID" class="form-label">Customer ID:</label>
                <input type="text" class="form-control" id="customerID" name="customerID" required>
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Amount:</label>
                <input type="text" class="form-control" id="amount" name="amount" required>
            </div>
            <div class="mb-3">
                <label for="date" class="form-label">Date:</label>
                <input type="date" class="form-control" id="date" name="date" required>
            </div>
            <button type="submit" class="btn btn-success">Request</button>
        </form>
    </div>
</div>

        <c:if test="${not empty compensationHistoryCus}">
            <h2 class="mt-4 mb-4">Edit Compensation History</h2>
            <form action="compensationHistory" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="compensationID" value="${compensationHistoryCus.compensationID}">
                <div class="mb-3">
                    <label for="customerID" class="form-label">Customer ID:</label>
                    <input type="text" class="form-control" id="customerID" name="customerID" value="${compensationHistoryCus.customerID}" required>
                </div>
                <div class="mb-3">
                    <label for="amount" class="form-label">Amount:</label>
                    <input type="text" class="form-control" id="amount" name="amount" value="${compensationHistoryCus.amount}" required>
                </div>
                <button type="submit" class="btn btn-warning">Update</button>
            </form>
        </c:if>

        <c:if test="${not empty compensationHistoryCus}">
            <h2 class="mt-4 mb-4">View Compensation History</h2>
            <div class="card">
                <div class="card-body">
                    <p>ID: ${compensationHistoryCus.compensationID}</p>
                    <p>Customer ID: ${compensationHistoryCus.customerID}</p>
                    <p>Amount: ${compensationHistoryCus.amount}</p>
                    <p>Date: ${compensationHistoryCus.date}</p>
                </div>
            </div>
        </c:if>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
