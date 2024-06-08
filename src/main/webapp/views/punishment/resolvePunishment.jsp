<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resolve Punishment</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 1200px;
            margin: 40px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .form-container h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .form-container h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
            font-size: 24px;
        }

        .accident-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .accident-table th, .accident-table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .accident-table th {
            background-color: #2c3e50;
            color: white;
            font-weight: bold;
        }

        .accident-table tr:nth-child(even) {
            background-color: #f4f7f6;
        }
    </style>
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->
<!-- Form -->
<div class="form-container">
    <h2>Contract Details</h2>
    <table class="accident-table">
        <tr>
            <th>Contract ID</th>
            <td><c:out value="${contract.contractID}"/></td>
        </tr>
        <tr>
            <th>Customer ID</th>
            <td><c:out value="${contract.customerID}"/></td>
        </tr>
        <tr>
            <th>Customer Name</th>
            <td><c:out value="${contract.customerName}"/></td>
        </tr>
        <tr>
            <th>Start Date</th>
            <td><fmt:formatDate value="${contract.startDate}" pattern="dd-MM-yyyy"/></td>
        </tr>
        <tr>
            <th>End Date</th>
            <td><fmt:formatDate value="${contract.endDate}" pattern="dd-MM-yyyy"/></td>
        </tr>
        <tr>
            <th>Cancellation Date</th>
            <td><fmt:formatDate value="${contract.cancellationDate}" pattern="dd-MM-yyyy"/></td>
        </tr>
        <tr>
            <th>Contract Info</th>
            <td><c:out value="${contract.contractInfo}"/></td>
        </tr>
        <tr>
            <th>Status</th>
            <td><c:out value="${contract.status}"/></td>
        </tr>
    </table>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>
