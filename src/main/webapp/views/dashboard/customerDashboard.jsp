<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        .dashboard-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #f0f0f0;
        }
        .dashboard-content {
            width: 100%;
            max-width: 1200px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .dashboard-row {
            display: flex;
            flex-wrap: wrap;
            margin: -10px;
        }
        .dashboard-col {
            flex: 1 1 50%;
            padding: 10px;
        }
        .dashboard-card {
            display: flex;
            align-items: center;
            padding: 20px;
            background-color: #004080;
            color: #fff;
            border-radius: 10px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .dashboard-card:hover {
            background-color: #ff8000;
        }
        .dashboard-card-icon {
            font-size: 2.5rem;
            margin-right: 20px;
        }
        .dashboard-card-content {
            flex: 1;
        }
        .dashboard-card-title {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        .dashboard-card-description {
            font-size: 1rem;
        }
    </style>
</head>
<body>
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
<!-- End of navbar -->

<div class="dashboard-container">
    <div class="dashboard-content">
        <div class="dashboard-row">
            <!-- Payment History Section -->
            <div class="dashboard-col">
                <a href="${pageContext.request.contextPath}/paymentHistory" class="dashboard-card">
                    <i class="fas fa-money-check-alt dashboard-card-icon"></i>
                    <div class="dashboard-card-content">
                        <div class="dashboard-card-title">Payment History</div>
                        <div class="dashboard-card-description">Review your payment history, including all transactions and details.</div>
                    </div>
                </a>
            </div>
            <!-- Accident History Section -->
            <div class="dashboard-col">
                <a href="${pageContext.request.contextPath}/accidentHistory" class="dashboard-card">
                    <i class="fas fa-car-crash dashboard-card-icon"></i>
                    <div class="dashboard-card-content">
                        <div class="dashboard-card-title">Accident History</div>
                        <div class="dashboard-card-description">View the history of accidents that have been reported and their statuses.</div>
                    </div>
                </a>
            </div>
            <!-- Punishment History Section -->
            <div class="dashboard-col">
                <a href="${pageContext.request.contextPath}/punishmentHistory" class="dashboard-card">
                    <i class="fas fa-gavel dashboard-card-icon"></i>
                    <div class="dashboard-card-content">
                        <div class="dashboard-card-title">Punishment History</div>
                        <div class="dashboard-card-description">Check any records of punishments related to your insurance policies.</div>
                    </div>
                </a>
            </div>
            <!-- Compensation History Section -->
            <div class="dashboard-col">
                <a href="${pageContext.request.contextPath}/compensationHistory" class="dashboard-card">
                    <i class="fas fa-hand-holding-usd dashboard-card-icon"></i>
                    <div class="dashboard-card-content">
                        <div class="dashboard-card-title">Compensation History</div>
                        <div class="dashboard-card-description">Examine your compensation claims, their statuses, and details.</div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
