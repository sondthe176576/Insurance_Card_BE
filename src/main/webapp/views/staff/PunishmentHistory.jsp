<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Punishment History</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
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
        main-content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s;
            min-height: calc(100vh - 70px);
        }
        body {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s;
            min-height: calc(100vh - 70px);
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        .search-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }
        input[type="text"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        button {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #2980b9;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        th, td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .view-btn {
            background-color: #2ecc71;
        }
        .view-btn:hover {
            background-color: #27ae60;
        }
        @media (max-width: 768px) {
            .search-form {
                flex-direction: column;
            }
            .form-group {
                width: 100%;
                margin-right: 0;
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body>
<div class="sidebar">
    <!-- Paste the sidebar content from the first file here -->
    <div class="sidebar-header">
        <i class="fas fa-bars"></i> Menu
    </div>
    <a href="${pageContext.request.contextPath}/homepageforstaff" class="${page == 'homepageforstaff' ? 'active' : ''}">
        <i class="fas fa-home"></i> Home
    </a>
    <!-- ... (include all other sidebar links) ... -->
    <jsp:include page="/views/includes/sidebar.jsp"/>
</div>
<h1>Punishment History</h1>
<div class="main-content" >
<form method="get" action="punishment-history" class="search-form">
    <div class="form-group">
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" value="${param.customerName}" placeholder="Enter customer name...">
    </div>
    <div class="form-group">
        <label for="sortByDate">Sort By Date:</label>
        <select id="sortByDate" name="sortByDate">
            <option value="">Select</option>
            <option value="asc" ${param.sortByDate == 'asc' ? 'selected' : ''}>Ascending</option>
            <option value="desc" ${param.sortByDate == 'desc' ? 'selected' : ''}>Descending</option>
        </select>
    </div>
    <button type="submit">Search</button>
</form>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Description</th>
        <th>Punishment Type</th>
        <th>Date</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="punishment" items="${punishmentList}">
        <tr>
            <td>${punishment.punishmentID}</td>
            <td>${punishment.fullName}</td>
            <td>${punishment.description}</td>
            <td>${punishment.punishmentType}</td>
            <td>${punishment.date}</td>
            <td>
                <form method="get" action="${pageContext.request.contextPath}/viewPunishmentDetails">
                    <input type="hidden" name="punishmentID" value="${punishment.punishmentID}">
                    <button type="submit" class="view-btn">View Details</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>
