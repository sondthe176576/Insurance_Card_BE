<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accident Detail</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        h2 {
            color: #3498db;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-top: 30px;
        }
        .info-section {
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .info-item {
            margin-bottom: 10px;
        }
        .info-item strong {
            color: #2c3e50;
            margin-right: 10px;
        }
        .btn {
            display: inline-block;
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<h1>Accident Detail</h1>

<div class="info-section">
    <h2>Accident Information</h2>
    <div class="info-item"><strong>Accident ID:</strong> <c:out value="${accident.accidentID}"/></div>
    <div class="info-item"><strong>Customer Name:</strong> <c:out value="${accident.customer.user.fullName}"/></div>
    <div class="info-item"><strong>Accident Type:</strong> <c:out value="${accident.accidentType}"/></div>
    <div class="info-item"><strong>Accident Date:</strong> <fmt:formatDate value="${accident.accidentDate}" pattern="dd-MM-yyyy"/></div>
    <div class="info-item"><strong>Description:</strong> <c:out value="${accident.description}"/></div>
    <div class="info-item"><strong>Status:</strong> <c:out value="${accident.status}"/></div>
</div>

<div class="info-section">
    <h2>Customer Information</h2>
    <div class="info-item"><strong>Customer ID:</strong> <c:out value="${accident.customerID}"/></div>
    <div class="info-item"><strong>Full Name:</strong> <c:out value="${accident.customer.user.fullName}"/></div>
    <div class="info-item"><strong>Phone Number:</strong> <c:out value="${accident.customer.user.mobile}"/></div>
    <div class="info-item"><strong>Email:</strong> <c:out value="${accident.customer.user.email}"/></div>
    <div class="info-item"><strong>Address:</strong> <c:out value="${accident.customer.user.district}, ${accident.customer.user.province}, ${accident.customer.user.country}"/></div>
    <div class="info-item"><strong>Gender:</strong> <c:out value="${accident.customer.user.gender}"/></div>
    <div class="info-item"><strong>Birth Date:</strong> <fmt:formatDate value="${accident.customer.user.birthDate}" pattern="dd-MM-yyyy"/></div>
    <div class="info-item"><strong>Personal Info:</strong> <c:out value="${accident.customer.personalInfo}"/></div>
</div>

<div class="info-section">
    <h2>Contract Information</h2>
    <div class="info-item"><strong>Contract ID:</strong> <c:out value="${accident.contractID}"/></div>
    <div class="info-item"><strong>Contract Info:</strong> <c:out value="${accident.contract.contractInfo}"/></div>
    <div class="info-item"><strong>Contract Status:</strong> <c:out value="${accident.contract.status}"/></div>
    <div class="info-item"><strong>Start Date:</strong> <fmt:formatDate value="${accident.contract.startDate}" pattern="dd-MM-yyyy"/></div>
    <div class="info-item"><strong>End Date:</strong> <fmt:formatDate value="${accident.contract.endDate}" pattern="dd-MM-yyyy"/></div>
    <div class="info-item"><strong>Insurance Type:</strong> <c:out value="${accident.contract.insuranceType}"/></div>
    <div class="info-item"><strong>Coverage:</strong> <c:out value="${accident.contract.coverage}"/></div>
    <div class="info-item"><strong>Premium:</strong> <fmt:formatNumber value="${accident.contract.premium}" type="currency" currencySymbol="$"/></div>
    <div class="info-item"><strong>Value:</strong> <fmt:formatNumber value="${accident.contract.value}" type="currency" currencySymbol="$"/></div>
</div>

<div class="info-section">
    <h2>Motorcycle Information</h2>
    <div class="info-item"><strong>License Plate:</strong> <c:out value="${accident.contract.motorcycle.licensePlate}"/></div>
    <div class="info-item"><strong>Brand:</strong> <c:out value="${accident.contract.motorcycle.brand}"/></div>
    <div class="info-item"><strong>Model:</strong> <c:out value="${accident.contract.motorcycle.model}"/></div>
    <div class="info-item"><strong>Frame Number:</strong> <c:out value="${accident.contract.motorcycle.frameNumber}"/></div>
    <div class="info-item"><strong>Engine Number:</strong> <c:out value="${accident.contract.motorcycle.engineNumber}"/></div>
    <div class="info-item"><strong>Year Of Manufacture:</strong> <c:out value="${accident.contract.motorcycle.yearOfManufacture}"/></div>
    <div class="info-item"><strong>Color:</strong> <c:out value="${accident.contract.motorcycle.color}"/></div>
</div>

<div style="text-align: center; margin-top: 30px;">
    <a href="${pageContext.request.contextPath}/accident-history" class="btn">Back to List</a>
</div>
</body>
</html>