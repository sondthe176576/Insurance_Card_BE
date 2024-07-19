<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Punishment Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .detail-item {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        .detail-item label {
            flex: 0 0 150px;
            font-weight: bold;
            color: #555;
        }
        .detail-item span {
            flex: 1;
            display: inline-block;
            margin-left: 10px;
            color: #333;
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 4px;
        }
        .error {
            color: red;
            margin-bottom: 15px;
            text-align: center;
        }
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #3498db;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Punishment Detail</h1>
    <c:if test="${not empty error}">
        <div class="error">
            <c:out value="${error}"/>
        </div>
    </c:if>
    <c:if test="${not empty punishment}">
        <div class="detail-item">
            <label>Punishment ID:</label>
            <span>${punishment.punishmentID}</span>
        </div>
        <div class="detail-item">
            <label>Customer Name:</label>
            <span>${punishment.contract.customer.user.fullName}</span>
        </div>
        <div class="detail-item">
            <label>Punishment Type:</label>
            <span>${punishment.punishmentType}</span>
        </div>
        <div class="detail-item">
            <label>Punishment Date:</label>
            <span><fmt:formatDate value="${punishment.punishmentDate}" pattern="dd-MM-yyyy"/></span>
        </div>
        <div class="detail-item">
            <label>Description:</label>
            <span>${punishment.description}</span>
        </div>
        <div class="detail-item">
            <label>Status:</label>
            <span>${punishment.status}</span>
        </div>
        <div class="detail-item">
            <label>Contract ID:</label>
            <span>${punishment.contract.contractID}</span>
        </div>
        <div class="detail-item">
            <label>Contract Info:</label>
            <span>${punishment.contract.contractInfo}</span>
        </div>
        <div class="detail-item">
            <label>Start Date:</label>
            <span><fmt:formatDate value="${punishment.contract.startDate}" pattern="dd-MM-yyyy"/></span>
        </div>
        <div class="detail-item">
            <label>End Date:</label>
            <span><fmt:formatDate value="${punishment.contract.endDate}" pattern="dd-MM-yyyy"/></span>
        </div>
        <div class="detail-item">
            <label>Insurance Type:</label>
            <span>${punishment.contract.insuranceType}</span>
        </div>
        <div class="detail-item">
            <label>Coverage:</label>
            <span>${punishment.contract.coverage}</span>
        </div>
        <div class="detail-item">
            <label>Premium:</label>
            <span>${punishment.contract.premium}</span>
        </div>
        <div class="detail-item">
            <label>License Plate:</label>
            <span>${punishment.contract.motorcycle.licensePlate}</span>
        </div>
        <div class="detail-item">
            <label>Motorcycle Brand:</label>
            <span>${punishment.contract.motorcycle.brand}</span>
        </div>
        <div class="detail-item">
            <label>Motorcycle Model:</label>
            <span>${punishment.contract.motorcycle.model}</span>
        </div>
        <div class="detail-item">
            <label>Frame Number:</label>
            <span>${punishment.contract.motorcycle.frameNumber}</span>
        </div>
        <div class="detail-item">
            <label>Engine Number:</label>
            <span>${punishment.contract.motorcycle.engineNumber}</span>
        </div>
        <div class="detail-item">
            <label>Year of Manufacture:</label>
            <span>${punishment.contract.motorcycle.yearOfManufacture}</span>
        </div>
        <div class="detail-item">
            <label>Color:</label>
            <span>${punishment.contract.motorcycle.color}</span>
        </div>
        <a href="punishment-history" class="btn">Back to History</a>
    </c:if>
</div>
</body>
</html>
