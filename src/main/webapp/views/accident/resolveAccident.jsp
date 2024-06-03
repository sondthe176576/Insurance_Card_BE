<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Accident</title>
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
            max-width: 800px;
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

        .accident-details {
            margin-bottom: 20px;
        }

        .accident-details label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .accident-details p {
            margin: 0 0 20px 0;
            padding: 10px;
            background-color: #ecf0f1;
            border-radius: 5px;
        }

        .btn-back {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

        .btn-back:hover {
            background-color: #2980b9;
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
    <h2>Accident Details</h2>
    <div class="accident-details">
        <label>Accident ID:</label>
        <p><c:out value="${accident.accidentID}"/></p>

        <label>Customer ID:</label>
        <p><c:out value="${accident.customerID}"/></p>

        <label>Full Name:</label>
        <p><c:out value="${accident.fullName}"/></p>

        <label>Contract ID:</label>
        <p><c:out value="${accident.contractID}"/></p>

        <label>Accident Type:</label>
        <p><c:out value="${accident.accidentType}"/></p>

        <label>Accident Date:</label>
        <p><c:out value="${accident.accidentDate}"/></p>

        <label>Description:</label>
        <p><c:out value="${accident.description}"/></p>
    </div>
    <a href="${pageContext.request.contextPath}/listAccident" class="btn-back">Back to List</a>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>