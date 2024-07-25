<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar Example</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #004080;
            padding-top: 20px;
            transition: width 0.3s;
            z-index: 1000;
        }

        .sidebar:hover {
            width: 300px;
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 1.2rem;
            color: #ffffff;
            display: block;
            transition: background-color 0.3s, padding-left 0.3s;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #0056b3;
            padding-left: 30px;
        }

        .sidebar a.active {
            background-color: #007bff;
            font-weight: bold;
        }

        .sidebar i {
            margin-right: 10px;
        }

        .sidebar .sidebar-header {
            padding: 15px;
            text-align: center;
            font-size: 1.5rem;
            color: #ffffff;
            border-bottom: 1px solid #0056b3;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s;
            height: calc(100vh - 70px);
            overflow-y: auto;
        }

        .sidebar:hover ~ .main-content {
            margin-left: 300px;
        }

        .container {
            max-width: 100%;
            margin: 0 auto;
            padding: 20px;
        }

        .card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            margin-top: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .table th, .table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .table th {
            background-color: #004080;
            color: white;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1rem;
            color: white;
            background-color: #004080;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .pagination {
            display: flex;
            justify-content: flex-end;
            list-style: none;
            padding: 0;
        }

        .pagination li {
            margin: 0 5px;
        }

        .pagination a {
            color: #004080;
            text-decoration: none;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .pagination a:hover {
            background-color: #e9ecef;
            transform: scale(1.05);
        }

        .pagination .active a {
            background-color: #004080;
            color: white;
            border-color: #004080;
        }

        .dropdown-btn {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .dropdown-container {
            display: none;
            background-color: #005599;
            padding-left: 20px;
        }

        .dropdown-container a {
            font-size: 1rem;
            padding: 10px 15px;
        }

        .show {
            display: block;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="sidebar-header">
        <i class="fas fa-bars"></i> Menu
    </div>
    <a href="${pageContext.request.contextPath}/homepageforstaff" class="${page == 'homepageforstaff' ? 'active' : ''}">
        <i class="fas fa-home"></i> Home
    </a>
    <a href="${pageContext.request.contextPath}/listWaitingContract" class="${page == 'newContract' ? 'active' : ''}">
        <i class="fas fa-file-alt"></i> New Contracts
    </a>
    <div>
        <a href="javascript:void(0)" class="dropdown-btn ${page == 'accidents' ? 'active' : ''}">
            <span><i class="fas fa-exclamation-triangle"></i> Accidents</span> <i class="fas fa-caret-down"></i>
        </a>
        <div class="dropdown-container">
            <a href="${pageContext.request.contextPath}/listAccident" class="${page == 'newAccidents' ? 'active' : ''}">List Accidents</a>
            <a href="${pageContext.request.contextPath}/accident-history" class="${page == 'processedAccidents' ? 'active' : ''}">Accidents History</a>
        </div>
    </div>
    <div>
        <a href="javascript:void(0)" class="dropdown-btn ${page == 'compensation' ? 'active' : ''}">
            <span><i class="fas fa-hand-holding-usd"></i> Compensation</span> <i class="fas fa-caret-down"></i>
        </a>
        <div class="dropdown-container">
            <a href="${pageContext.request.contextPath}/listCompensation" class="${page == 'pendingCompensations' ? 'active' : ''}">list Compensations</a>
            <a href="${pageContext.request.contextPath}/listCompensationHistory" class="${page == 'approvedCompensations' ? 'active' : ''}"> Compensations History</a>
        </div>
    </div>
    <div>
        <a href="javascript:void(0)" class="dropdown-btn ${page == 'punishment' ? 'active' : ''}">
            <span><i class="fas fa-gavel"></i> Punishment</span> <i class="fas fa-caret-down"></i>
        </a>
        <div class="dropdown-container">
            <a href="${pageContext.request.contextPath}/listPunishment" class="${page == 'listPunishments' ? 'active' : ''}">List Punishments</a>
            <a href="${pageContext.request.contextPath}/punishment-history" class="${page == 'punishmentHistory' ? 'active' : ''}">Punishment History</a>
        </div>
    </div>
    <div>
        <a href="${pageContext.request.contextPath}/customer-manage" class="${page == 'listCustomers' ? 'active' : ''}">
            <span><i class="fas fa-users"></i> Customers</span>
        </a>
    </div>
    <a href="${pageContext.request.contextPath}/listRenewContract" class="${page == 'renewContract' ? 'active' : ''}">
        <i class="fas fa-sync-alt"></i> Renew Contracts
    </a>
    <a href="${pageContext.request.contextPath}/listAllContractForCustomer" class="${page == 'listAllContractForCustomer' ? 'active' : ''}">
        <i class="fas fa-list"></i> List All Contracts for Customer
    </a>
    <a href="#" class="${page == 'settings' ? 'active' : ''}">
        <i class="fas fa-cog"></i> Settings
    </a>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var dropdownBtns = document.querySelectorAll('.dropdown-btn');

        dropdownBtns.forEach(function(btn) {
            btn.addEventListener('click', function() {
                this.classList.toggle('active');
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === 'block') {
                    dropdownContent.style.display = 'none';
                } else {
                    dropdownContent.style.display = 'block';
                }
            });
        });
    });
</script>
</body>
</html>