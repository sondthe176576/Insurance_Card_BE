<%--
  Created by IntelliJ IDEA.
  User: 09114
  Date: 5/24/2024
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/includes/header.jsp" />
<script>
    function doDelete(userId) {
        if(confirm("Are you sure you want to delete this customer?")) {
            window.location = "/customer-staff?action=deleteCustomer&id=" + userId;
        }
    }
</script>
<html>
<head>
    <title>Manage Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            max-width: 800px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .button-create {
            background-color: #28a745;
        }
        .button-create:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<h1>Manage Customer</h1>

<div style="text-align: center;">
    <a href="views/staff/CreateCustomer.jsp" class="button button-create">Create Customer</a>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${requestScope.data}" var="customer">
        <tr>
            <td>${customer.userID}</td>
            <td>${customer.username}</td>
            <td>${customer.address}</td>
            <td>${customer.mobile}</td>
            <td>${customer.email}</td>
            <td>
                <a href="/viewCustomer?id=${customer.userID}" class="button">View</a>
                <a href="#" onclick="doDelete('${customer.userID}')" class="button">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
<jsp:include page="/views/includes/footer.jsp" />