<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accident History</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Paste the sidebar styles from the first file here */
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
        /* ... (include all other sidebar styles) ... */

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

        /* Additional styles for the accident history table */
        .content {
            max-width: 100%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #004080;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .btn {
            padding: 8px 15px;
            background-color: #004080;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
    <jsp:include page="/views/includes/header_list.jsp"/>
</head>
<body class="bg-gray-100">
<!-- Sidebar -->
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

<!-- Main Content -->
<div class="main-content">
    <div class="content">
        <h1 class="text-3xl font-bold mb-6 text-center text-gray-800">Accident History</h1>
        <form method="get" action="${pageContext.request.contextPath}/accident-history" class="mb-6 flex justify-between items-center">
            <div class="flex items-center">
                <label for="customerName" class="mr-2">Customer Name:</label>
                <input type="text" id="customerName" name="customerName" value="${param.customerName}" class="border rounded px-2 py-1">
                <button type="submit" class="btn ml-2">Find Name</button>
            </div>
            <div class="flex items-center">
                <label for="sortByDate" class="mr-2">Sort by Date:</label>
                <select id="sortByDate" name="sortByDate" onchange="this.form.submit()" class="border rounded px-2 py-1">
                    <option value="">Select</option>
                    <option value="asc" ${param.sortByDate == 'asc' ? 'selected' : ''}>Ascending</option>
                    <option value="desc" ${param.sortByDate == 'desc' ? 'selected' : ''}>Descending</option>
                </select>
            </div>
        </form>
        <table>
            <thead>
            <tr>
                <th>Full Name</th>
                <th>Accident ID</th>
                <th>Accident Type</th>
                <th>Status</th>
                <th>Description</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="accident" items="${accidentList}">
                <tr>
                    <td>${accident.fullName}</td>
                    <td>${accident.accidentID}</td>
                    <td>${accident.accidentType}</td>
                    <td>${accident.status}</td>
                    <td>${accident.description}</td>
                    <td>${accident.date}</td>
                    <td>
                        <form method="get" action="${pageContext.request.contextPath}/viewAccidentDetails">
                            <input type="hidden" name="accidentID" value="${accident.accidentID}">
                            <button type="submit" class="btn">View</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>