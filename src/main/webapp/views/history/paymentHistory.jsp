<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment History</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Payment History</h1>
    <div class="form-container">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th>Payment ID</th>
                <th>Customer ID</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Payment Method ID</th>
                <th>Contract ID</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="paymentHistory" items="${paymentHistories}">
                <tr>
                    <td>${paymentHistory.paymentID}</td>
                    <td>${paymentHistory.customerID}</td>
                    <td>${paymentHistory.amount}</td>
                    <td>${paymentHistory.paymentDate}</td>
                    <td>${paymentHistory.paymentMethodID}</td>
                    <td>${paymentHistory.contractID}</td>
                    <td>
                        <a href="paymentHistory?action=view&paymentID=${paymentHistory.paymentID}" class="btn btn-primary btn-sm">
                            <i class="fas fa-eye"></i>
                        </a>
                        <a href="paymentHistory?action=edit&paymentID=${paymentHistory.paymentID}" class="btn btn-warning btn-sm">
                            <i class="fas fa-pencil-alt"></i>
                        </a>
                        <form action="paymentHistory" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="paymentID" value="${paymentHistory.paymentID}">
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

        <h2 class="mt-4 mb-4">Add New Payment</h2>
        <form action="paymentHistory" method="post">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <label for="addCustomerID" class="form-label">Customer ID:</label>
                <input type="number" class="form-control" id="addCustomerID" name="customerID" required>
            </div>
            <div class="mb-3">
                <label for="addAmount" class="form-label">Amount:</label>
                <input type="number" class="form-control" id="addAmount" name="amount" required step="0.01">
            </div>
            <div class="mb-3">
                <label for="addPaymentDate" class="form-label">Payment Date:</label>
                <input type="date" class="form-control" id="addPaymentDate" name="paymentDate" required>
            </div>
            <div class="mb-3">
                <label for="addPaymentMethodID" class="form-label">Payment Method ID:</label>
                <input type="number" class="form-control" id="addPaymentMethodID" name="paymentMethodID" required>
            </div>
            <div class="mb-3">
                <label for="addContractID" class="form-label">Contract ID:</label>
                <input type="number" class="form-control" id="addContractID" name="contractID" required>
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
