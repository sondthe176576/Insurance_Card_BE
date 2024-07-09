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
    <h1 class="mt-4 mb-4">Accident History</h1>
    <a href="${pageContext.request.contextPath}/accidentHistory?action=addForm" class="btn btn-primary mb-4">Request Accident</a>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>Customer ID</th>
            <th>Customer Name</th>
            <th>Accident ID</th>
            <th>Contract ID</th>
            <th>Accident Type</th>
            <th>Accident Date</th>
            <th>Description</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${accidents}" var="accident">
            <tr>
                <td>${accident.customerID}</td>
                <td>${accident.customerName}</td>
                <td>${accident.accidentID}</td>
                <td>${accident.contractID}</td>
                <td>${accident.accidentType}</td>
                <td>${accident.accidentDate}</td>
                <td>${accident.description}</td>
                <td class="<c:choose>
                    <c:when test="${accident.status == 'Pending'}">status-pending</c:when>
                    <c:when test="${accident.status == 'Rejected'}">status-rejected</c:when>
                    <c:when test="${accident.status == 'Approved'}">status-approved</c:when>
                </c:choose>">
                        ${accident.status}
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/accidentHistory?action=view&id=${accident.accidentID}" class="btn btn-primary btn-sm">
                        <i class="fas fa-eye"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/accidentHistory?action=edit&id=${accident.accidentID}" class="btn btn-warning btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                    </a>
                    <form action="${pageContext.request.contextPath}/accidentHistory" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="accidentID" value="${accident.accidentID}">
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this record?');">
                            <i class="fas fa-trash"></i>
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
