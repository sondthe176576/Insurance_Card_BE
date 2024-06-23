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
</head>
<body>
<div class="container">
    <h1>Compensation History</h1>
    <div class="form-container">
        <table class="table table-bordered">
            <thead>
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
                        <a href="compensationHistoryCus?action=view&id=${history.compensationID}">View</a>
                        <a href="compensationHistoryCus?action=edit&id=${history.compensationID}">Edit</a>
                        <form action="compensationHistoryCus" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="compensationID" value="${history.compensationID}">
                            <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this record?');">
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- Pagination -->
        <style type="text/css">
                .pagination .page-link {
                color: black;
        }
        </style>

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




        <h2>Add New Compensation History</h2>
        <form action="compensationHistoryCus" method="post">
            <input type="hidden" name="action" value="add">
            <label for="customerID">Customer ID:</label>
            <input type="text" id="addcustomerID" name="customerID" required><br>
            <label for="amount">Amount:</label>
            <input type="text" id="addamount" name="amount" required><br>
            <input type="submit" value="Add">
        </form>

        <c:if test="${not empty compensationHistoryCus}">
            <h2>Edit Compensation History</h2>
            <form action="compensationHistoryCus" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="compensationID" value="${compensationHistoryCus.compensationID}">
                <label for="customerID">Customer ID:</label>
                <input type="text" id="customerID" name="customerID" value="${compensationHistoryCus.customerID}" required><br>
                <label for="amount">Amount:</label>
                <input type="text" id="amount" name="amount" value="${compensationHistoryCus.amount}" required><br>
                <input type="submit" value="Update">
            </form>
        </c:if>

        <c:if test="${not empty compensationHistoryCus}">
            <h2>View Compensation History</h2>
            <p>ID: ${compensationHistoryCus.compensationID}</p>
            <p>Customer ID: ${compensationHistoryCus.customerID}</p>
            <p>Amount: ${compensationHistoryCus.amount}</p>
            <p>Date: ${compensationHistoryCus.date}</p>
        </c:if>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
