<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compensation Request Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .section {
            margin-bottom: 30px;
        }
        .section-title {
            font-size: 1.2em;
            color: #2980b9;
            margin-bottom: 15px;
            font-weight: bold;
        }
        .detail-item {
            display: flex;
            margin-bottom: 10px;
        }
        .detail-item label {
            font-weight: bold;
            width: 200px;
            color: #34495e;
        }
        .detail-item span {
            flex: 1;
        }
        .error {
            color: #e74c3c;
            background-color: #fadbd8;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Compensation Request Details</h1>
    <c:if test="${not empty error}">
        <div class="error">
            <c:out value="${error}"/>
        </div>
    </c:if>
    <c:if test="${not empty details}">
        <div class="section">
            <div class="section-title">Compensation Information</div>
            <div class="detail-item">
                <label>Compensation ID:</label>
                <span>${details.compensationID}</span>
            </div>
            <div class="detail-item">
                <label>Customer ID:</label>
                <span>${details.customerID}</span>
            </div>
            <div class="detail-item">
                <label>Amount:</label>
                <span>${details.amount}</span>
            </div>
            <div class="detail-item">
                <label>Date:</label>
                <span><fmt:formatDate value="${details.date}" pattern="dd-MM-yyyy"/></span>
            </div>
            <div class="detail-item">
                <label>Status:</label>
                <span>${details.status}</span>
            </div>
        </div>

        <div class="section">
            <div class="section-title">Customer Information</div>
            <div class="detail-item">
                <label>Full Name:</label>
                <span>${details.users.fullName}</span>
            </div>
            <div class="detail-item">
                <label>Phone:</label>
                <span>${details.users.mobile}</span>
            </div>
            <div class="detail-item">
                <label>Date of Birth:</label>
                <span>${details.users.birthDate}</span>
            </div>
            <div class="detail-item">
                <label>Address:</label>
                <span>${details.users.province}, ${details.users.district}, ${details.users.country}</span>
            </div>
        </div>

        <div class="section">
            <div class="section-title">Contract Information</div>
            <div class="detail-item">
                <label>Contract ID:</label>
                <span>${details.contract.contractID}</span>
            </div>
            <div class="detail-item">
                <label>Contract Info:</label>
                <span>${details.contract.contractInfo}</span>
            </div>
            <div class="detail-item">
                <label>Contract Status:</label>
                <span>${details.contract.status}</span>
            </div>
            <div class="detail-item">
                <label>Start Date:</label>
                <span><fmt:formatDate value="${details.contract.startDate}" pattern="dd-MM-yyyy"/></span>
            </div>
            <div class="detail-item">
                <label>End Date:</label>
                <span><fmt:formatDate value="${details.contract.endDate}" pattern="dd-MM-yyyy"/></span>
            </div>
            <div class="detail-item">
                <label>Insurance Type:</label>
                <span>${details.contract.insuranceType}</span>
            </div>
            <div class="detail-item">
                <label>Coverage:</label>
                <span>${details.contract.coverage}</span>
            </div>
            <div class="detail-item">
                <label>Premium:</label>
                <span>${details.contract.premium}</span>
            </div>
        </div>

        <div class="section">
            <div class="section-title">Motorcycle Information</div>
            <div class="detail-item">
                <label>License Plate:</label>
                <span>${details.contract.motorcycle.licensePlate}</span>
            </div>
            <div class="detail-item">
                <label>Brand:</label>
                <span>${details.contract.motorcycle.brand}</span>
            </div>
            <div class="detail-item">
                <label>Model:</label>
                <span>${details.contract.motorcycle.model}</span>
            </div>
            <div class="detail-item">
                <label>Frame Number:</label>
                <span>${details.contract.motorcycle.frameNumber}</span>
            </div>
            <div class="detail-item">
                <label>Engine Number:</label>
                <span>${details.contract.motorcycle.engineNumber}</span>
            </div>
            <div class="detail-item">
                <label>Year of Manufacture:</label>
                <span>${details.contract.motorcycle.yearOfManufacture}</span>
            </div>
            <div class="detail-item">
                <label>Color:</label>
                <span>${details.contract.motorcycle.color}</span>
            </div>
        </div>
    </c:if>
</div>
</body>
</html>