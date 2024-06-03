<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/3/2024
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Accidents</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .form-container h2 {
            text-align: center;
            color: #34495e;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .form-container h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            border-bottom: 3px solid #2c3e50;
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

        .btn-submit {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
        }

        .btn-submit:hover {
            background-color: #2980b9;
        }

        .pagination {
            display: flex;
            justify-content: flex-end;
            margin: 20px 0;
        }

        .pagination a {
            color: #3498db;
            padding: 10px 15px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 5px;
            border-radius: 5px;
        }

        .pagination a.active {
            background-color: #3498db;
            color: white;
            border: 1px solid #3498db;
        }

        .pagination a:hover {
            background-color: #ecf0f1;
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
    <h2>Accident Management</h2>
    <h3>List of Accidents</h3>
    <table class="accident-table">
        <thead>
        <tr>
            <th>Accident ID</th>
            <th>Customer ID</th>
            <th>Customer Name</th>
            <th>Contract ID</th>
            <th>Accident Type</th>
            <th>Accident Date</th>
            <th>Description</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="accident" items="${accidents}">
            <tr>
                <td><c:out value="${accident.accidentID}"/></td>
                <td><c:out value="${accident.customerID}"/></td>
                <td><c:out value="${accident.customerName}"/></td>
                <td><c:out value="${accident.contractID}"/></td>
                <td><c:out value="${accident.accidentType}"/></td>
                <td><c:out value="${accident.accidentDate}"/></td>
                <td><c:out value="${accident.description}"/></td>
                <td><c:out value="${accident.status}"/></td>
                <td>
                    <a href="${pageContext.request.contextPath}/accident/view?accidentID=${accident.accidentID}"
                       class="btn-view">View</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a href="${pageContext.request.contextPath}/listAccident?page=${i}" class="active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/listAccident?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>