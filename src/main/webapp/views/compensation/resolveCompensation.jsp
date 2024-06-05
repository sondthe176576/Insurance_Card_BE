<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Resolve Compensation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .detail-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            margin: 40px auto;
        }

        .detail-container h2 {
            text-align: center;
            color: #34495e;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .detail-container h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            padding-bottom: 10px;
            font-size: 24px;
        }

        .detail-container label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .detail-container p {
            margin-bottom: 15px;
        }

        .btn-back, .btn-approve, .btn-reject {
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

        .btn-approve {
            background-color: #2ecc71;
        }

        .btn-reject {
            background-color: #e74c3c;
        }

        .btn-back:hover {
            background-color: #2980b9;
        }

        .btn-approve:hover {
            background-color: #27ae60;
        }

        .btn-reject:hover {
            background-color: #c0392b;
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
<div class="detail-container">
    <h2>Compensation Detail</h2>
    <h3>Request Information</h3>
    <label>Compensation ID:</label>
    <p><c:out value="${compensation.requestID}"/></p>
    <label>Customer ID:</label>
    <p><c:out value="${compensation.customerID}"/></p>
    <label>Contract ID:</label>
    <p><c:out value="${compensation.contractID}"/></p>
    <label>Customer Name:</label>
    <p><c:out value="${compensation.customerName}"/></p>
    <label>Description:</label>
    <p><c:out value="${compensation.description}"/></p>
    <label>Amount:</label>
    <p><c:out value="${compensation.amount}"/></p>
    <label>Status:</label>
    <p><c:out value="${compensation.status}"/></p>
    <label>Date:</label>
    <p><c:out value="${compensation.requestDate}"/></p>
    <h3>Contract Information</h3>
    <label>Contract Info:</label>
    <p><c:out value="${compensation.contract.contractInfo}"/></p>
    <label>Contract Status:</label>
    <p><c:out value="${compensation.contract.status}"/></p>
    <label>Start Date:</label>
    <p><c:out value="${compensation.contract.startDate}"/></p>
    <label>End Date:</label>
    <p><c:out value="${compensation.contract.endDate}"/></p>
    <label>Insurance Type:</label>
    <p><c:out value="${compensation.contract.insuranceType}"/></p>
    <label>Coverage:</label>
    <p><c:out value="${compensation.contract.coverage}"/></p>
    <label>Premium:</label>
    <p><c:out value="${compensation.contract.premium}"/></p>
    <label>Detail:</label>
    <p><c:out value="${compensation.contract.detail}"/></p>
    <label>Value:</label>
    <p><c:out value="${compensation.contract.value}"/></p>
    <h3>Motorcycle Information</h3>
    <label>License Plate:</label>
    <p><c:out value="${compensation.contract.motorcycle.licensePlate}"/></p>
    <label>Brand:</label>
    <p><c:out value="${compensation.contract.motorcycle.brand}"/></p>
    <label>Model:</label>
    <p><c:out value="${compensation.contract.motorcycle.model}"/></p>
    <label>Frame Number:</label>
    <p><c:out value="${compensation.contract.motorcycle.frameNumber}"/></p>
    <label>Engine Number:</label>
    <p><c:out value="${compensation.contract.motorcycle.engineNumber}"/></p>
    <label>Year Of Manufacture:</label>
    <p><c:out value="${compensation.contract.motorcycle.yearOfManufacture}"/></p>
    <label>Color:</label>
    <p><c:out value="${compensation.contract.motorcycle.color}"/></p>
    <form method="post" action="${pageContext.request.contextPath}/resolveCompensation">
        <input type="hidden" name="requestID" value="${compensation.requestID}"/>
        <button type="submit" name="status" value="Approved" class="btn-approve">Approve</button>
        <button type="submit" name="status" value="Rejected" class="btn-reject">Reject</button>
        <a href="${pageContext.request.contextPath}/listCompensation" class="btn-back">Back to List</a>
    </form>
</div>
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>