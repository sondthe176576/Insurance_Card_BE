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
<div class="container mt-4">
    <h1 class="page-title">Accident History</h1>
    <div class="d-flex justify-content-center mb-4">
        <a href="${pageContext.request.contextPath}/accidentHistory?action=addForm" class="btn btn-primary"><i class="fas fa-plus"></i> Report Accident</a>
    </div>
    <table class="table table-hover table-bordered">
        <thead>
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
                <td class="
                    <c:choose>
                        <c:when test="${accident.status == 'Pending'}">status-pending</c:when>
                        <c:when test="${accident.status == 'Rejected'}">status-rejected</c:when>
                        <c:when test="${accident.status == 'Approved'}">status-approved</c:when>
                    </c:choose>
                ">
                        ${accident.status}
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/accidentHistory?action=view&id=${accident.accidentID}" class="btn btn-primary btn-sm btn-action">
                        <i class="fas fa-eye"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/accidentHistory?action=edit&id=${accident.accidentID}" class="btn btn-warning btn-sm btn-action">
                        <i class="fas fa-pencil-alt"></i>
                    </a>
                    <form action="${pageContext.request.contextPath}/accidentHistory" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="accidentID" value="${accident.accidentID}">
                        <button type="submit" class="btn btn-danger btn-sm btn-action" onclick="return confirm('Are you sure you want to delete this record?');">
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
