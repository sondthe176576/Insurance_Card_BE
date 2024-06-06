<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Resolve Compensation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 30px;
        }

        .form-container h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 20px;
            border-bottom: 2px solid #2980b9;
            padding-bottom: 10px;
        }

        .form-container h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            font-size: 20px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 5px;
        }

        .details {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .details label {
            font-weight: bold;
            width: 30%;
            margin-bottom: 10px;
            color: #2980b9;
        }

        .details p {
            width: 70%;
            margin: 0 0 10px 0;
            padding: 10px;
            background-color: #ecf0f1;
            border-radius: 4px;
        }

        .btn-container {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin: 0 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        .btn-approve {
            background-color: #2ecc71;
        }

        .btn-approve:hover {
            background-color: #27ae60;
        }

        .btn-reject {
            background-color: #e74c3c;
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
<!-- Form -->
<div class="form-container">
    <h2>Compensation Detail</h2>
    <h3>Request Information</h3>
    <div class="details">
        <label>Compensation ID:</label>
        <p><c:out value="${compensation.requestID}"/></p>
        <label>Description:</label>
        <p><c:out value="${compensation.description}"/></p>
        <label>Amount:</label>
        <p><fmt:formatNumber value="${compensation.amount}" type="currency" currencySymbol="$"/></p>
        <label>Status:</label>
        <p><c:out value="${compensation.status}"/></p>
        <label>Date:</label>
        <p><fmt:formatDate value="${compensation.requestDate}" pattern="dd-MM-yyyy"/></p>
    </div>
    <h3>Customer Information</h3>
    <div class="details">
        <label>Customer ID:</label>
        <p><c:out value="${compensation.customerID}"/></p>
        <label>Customer Name:</label>
        <p><c:out value="${compensation.customerName}"/></p>
        <label>Full Name:</label>
        <p><c:out value="${compensation.contract.customer.user.fullName}"/></p>
        <label>Phone Number:</label>
        <p><c:out value="${compensation.contract.customer.user.mobile}"/></p>
        <label>Email:</label>
        <p><c:out value="${compensation.contract.customer.user.email}"/></p>
        <label>Address:</label>
        <p><c:out value="${compensation.contract.customer.user.address}"/></p>
        <label>Gender:</label>
        <p><c:out value="${compensation.contract.customer.user.gender}"/></p>
        <label>Personal Info:</label>
        <p><c:out value="${compensation.contract.customer.personalInfo}"/></p>
    </div>
    <h3>Contract Information</h3>
    <div class="details">
        <label>Contract ID:</label>
        <p><c:out value="${compensation.contractID}"/></p>
        <label>Contract Info:</label>
        <p><c:out value="${compensation.contract.contractInfo}"/></p>
        <label>Contract Status:</label>
        <p><c:out value="${compensation.contract.status}"/></p>
        <label>Start Date:</label>
        <p><fmt:formatDate value="${compensation.contract.startDate}" pattern="dd-MM-yyyy"/></p>
        <label>End Date:</label>
        <p><fmt:formatDate value="${compensation.contract.endDate}" pattern="dd-MM-yyyy"/></p>
        <label>Insurance Type:</label>
        <p><c:out value="${compensation.contract.insuranceType}"/></p>
        <label>Coverage:</label>
        <p><c:out value="${compensation.contract.coverage}"/></p>
        <label>Premium:</label>
        <p><fmt:formatNumber value="${compensation.contract.premium}" type="currency" currencySymbol="$"/></p>
        <label>Detail:</label>
        <p><c:out value="${compensation.contract.detail}"/></p>
        <label>Value:</label>
        <p><fmt:formatNumber value="${compensation.contract.value}" type="currency" currencySymbol="$"/></p>
    </div>
    <h3>Motorcycle Information</h3>
    <div class="details">
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
    </div>
    <form method="post" action="${pageContext.request.contextPath}/resolveCompensation">
        <input type="hidden" name="requestID" value="${compensation.requestID}"/>
        <div class="btn-container">
            <button type="submit" name="status" value="Approved" class="btn btn-approve">Approve</button>
            <button type="submit" name="status" value="Rejected" class="btn btn-reject">Reject</button>
            <a href="${pageContext.request.contextPath}/listCompensation" class="btn">Back to List</a>
        </div>
    </form>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>