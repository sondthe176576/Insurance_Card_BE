<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header_logout.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accident Details</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .page-title {
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            color: #333;
            margin: 20px 0;
        }
        .card {
            margin-top: 20px;
        }
        .card-body p {
            margin: 10px 0;
            font-size: 1rem;
        }
        .alert-warning {
            margin: 20px 0;
        }
        .btn-back {
            display: block;
            margin: 20px auto 0;
            width: fit-content;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="page-title">View Compensation Request</h1>
    <div class="card mt-4">
        <div class="card-body">
            <c:choose>
                <c:when test="${compensationRequest.status == 'Pending'}">
                    <div class="alert alert-warning" role="alert">
                        Data is being processed and cannot be viewed at this time.
                    </div>
                </c:when>
                <c:otherwise>
                    <p><strong>Customer ID:</strong> ${compensationRequest.customerID}</p>
                    <p><strong>Customer Name:</strong> ${compensationRequest.customerName}</p>
                    <p><strong>Contract ID:</strong> ${compensationRequest.contractID}</p>
                    <p><strong>Amount:</strong> ${compensationRequest.amount}</p>
                    <p><strong>Description:</strong> ${compensationRequest.description}</p>
                    <p><strong>Date:</strong> ${compensationRequest.requestDate}</p>
                    <p><strong>Status:</strong>
                        <c:choose>
                            <c:when test="${compensationRequest.status == 'Rejected'}">
                                <span class="badge bg-danger">${compensationRequest.status}</span>
                            </c:when>
                            <c:when test="${compensationRequest.status == 'Approved'}">
                                <span class="badge bg-success">${compensationRequest.status}</span>
                            </c:when>
                        </c:choose>
                    </p>
                </c:otherwise>
            </c:choose>
            <a href="${pageContext.request.contextPath}/compensationHistory" class="btn btn-primary btn-back">Back to List</a>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
