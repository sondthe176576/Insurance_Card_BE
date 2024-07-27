<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Punishment History</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --background-color: #f8f9fa;
            --text-color: #333;
            --card-background: #ffffff;
            --border-color: #e0e0e0;
        }
        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: var(--card-background);
            padding-top: 20px;
            transition: width 0.3s;
            z-index: 1000;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        .main-content {
            margin-left: 250px;
            padding: 40px;
            transition: margin-left 0.3s;
            min-height: 100vh;
        }
        h1 {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5em;
            font-weight: 600;
        }
        .card {
            background-color: var(--card-background);
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 25px;
            margin-bottom: 30px;
        }
        .search-form {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            align-items: flex-end;
        }
        .form-group {
            flex: 1;
            min-width: 200px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-color);
        }
        input[type="text"], select {
            width: 100%;
            padding: 12px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
        }
        input[type="text"]:focus, select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }
        button {
            background-color: var(--primary-color);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s;
        }
        button:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: var(--card-background);
            border-radius: 12px;
            overflow: hidden;
        }
        th, td {
            text-align: left;
            padding: 16px;
            border-bottom: 1px solid var(--border-color);
        }
        th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        tr:last-child td {
            border-bottom: none;
        }
        tr:hover {
            background-color: rgba(52, 152, 219, 0.05);
        }
        .view-btn {
            background-color: var(--secondary-color);
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 6px;
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .view-btn i {
            margin-right: 5px;
        }
        .view-btn:hover {
            background-color: #27ae60;
        }
        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 20px;
            }
            .search-form {
                flex-direction: column;
            }
            .form-group {
                width: 100%;<-->
            }
        }

    </style>
    <jsp:include page="/views/includes/header_list.jsp"/>
</head>
<body>
<jsp:include page="/views/includes/sidebar.jsp"/>

<div class="main-content">
    <h1>Punishment History</h1>
    <div class="card">
        <form method="get" action="punishment-history" class="search-form">
            <div class="form-group">
                <label for="customerName">Customer Name</label>
                <input type="text" id="customerName" name="customerName" value="${param.customerName}" placeholder="Enter customer name">
            </div>
            <div class="form-group">
                <label for="sortByDate">Sort By Date</label>
                <select id="sortByDate" name="sortByDate">
                    <option value="">Select order</option>
                    <option value="asc" ${param.sortByDate == 'asc' ? 'selected' : ''}>Ascending</option>
                    <option value="desc" ${param.sortByDate == 'desc' ? 'selected' : ''}>Descending</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>

    <div class="card">
        <table>
            <thead>
            <tr>
                <th>No</th>
                <th>Full Name</th>
                <th>Description</th>
                <th>Punishment Type</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="punishment" items="${punishmentList}" varStatus="a">
                <tr>
                    <td>${a.index + 1}</td>
                    <td>${punishment.fullName}</td>
                    <td>${punishment.description}</td>
                    <td>${punishment.punishmentType}</td>
                    <td>${punishment.date}</td>
                    <td>
                        <form method="get" action="${pageContext.request.contextPath}/viewPunishmentDetails">
                            <input type="hidden" name="punishmentID" value="${punishment.punishmentID}">
                            <button type="submit" class="view-btn"><i class="fas fa-eye"></i> View</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
