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
    <h2>Punishment Detail</h2>
    <h3>Punishment Information</h3>
    <div class="details">
        <label>Punishment ID:</label>
        <p><c:out value="${punishment.punishmentID}"/></p>
        <label>Customer Name:</label>
        <p><c:out value="${punishment.customer.user.fullName}"/></p>
        <label>Punishment Type:</label>
        <p><c:out value="${punishment.punishmentType}"/></p>
        <label>Punishment Date:</label>
        <p><fmt:formatDate value="${punishment.punishmentDate}" pattern="dd-MM-yyyy"/></p>
        <label>Description:</label>
        <p><c:out value="${punishment.description}"/></p>
        <label>Status:</label>
        <p><c:out value="${punishment.status}"/></p>
    </div>
    <h3>Customer Information</h3>
    <div class="details">
        <label>Customer ID:</label>
        <p><c:out value="${punishment.customer.customerID}"/></p>
        <label>Full Name:</label>
        <p><c:out value="${punishment.customer.user.fullName}"/></p>
        <label>First Name:</label>
        <p><c:out value="${punishment.customer.user.firstName}"/></p>
        <label>Last Name:</label>
        <p><c:out value="${punishment.customer.user.lastName}"/></p>
        <label>Phone Number:</label>
        <p><c:out value="${punishment.customer.user.mobile}"/></p>
        <label>Email:</label>
        <p><c:out value="${punishment.customer.user.email}"/></p>
        <label>Province:</label>
        <p><c:out value="${punishment.customer.user.province}"/></p>
        <label>District:</label>
        <p><c:out value="${punishment.customer.user.district}"/></p>
        <label>Country:</label>
        <p><c:out value="${punishment.customer.user.country}"/></p>
        <label>Gender:</label>
        <p><c:out value="${punishment.customer.user.gender}"/></p>
        <label>Birth Date:</label>
        <p><fmt:formatDate value="${punishment.customer.user.birthDate}" pattern="dd-MM-yyyy"/></p>
        <label>Personal Info:</label>
        <p><c:out value="${punishment.customer.personalInfo}"/></p>
    </div>
    <h3>Contract Information</h3>
    <div class="details">
        <label>Contract ID:</label>
        <p><c:out value="${punishment.contractID}"/></p>
        <label>Contract Info:</label>
        <p><c:out value="${punishment.contract.contractInfo}"/></p>
        <label>Contract Status:</label>
        <p><c:out value="${punishment.contract.status}"/></p>
        <label>Start Date:</label>
        <p><fmt:formatDate value="${punishment.contract.startDate}" pattern="dd-MM-yyyy"/></p>
        <label>End Date:</label>
        <p><fmt:formatDate value="${punishment.contract.endDate}" pattern="dd-MM-yyyy"/></p>
        <label>Insurance Type:</label>
        <p><c:out value="${punishment.contract.insuranceType}"/></p>
        <label>Coverage:</label>
        <p><c:out value="${punishment.contract.coverage}"/></p>
        <label>Premium:</label>
        <p><fmt:formatNumber value="${punishment.contract.premium}" type="currency" currencySymbol="$"/></p>
        <label>Detail:</label>
        <p><c:out value="${punishment.contract.detail}"/></p>
        <label>Value:</label>
        <p><fmt:formatNumber value="${punishment.contract.value}" type="currency" currencySymbol="$"/></p>
    </div>
    <form method="post" action="${pageContext.request.contextPath}/resolvePunishment">
        <input type="hidden" name="punishmentID" value="${punishment.punishmentID}"/>
        <div class="btn-container">
            <button type="submit" name="status" value="Approved" class="btn btn-approve">Approve</button>
            <button type="submit" name="status" value="Rejected" class="btn btn-reject">Reject</button>
            <a href="${pageContext.request.contextPath}/listPunishment" class="btn">Back to List</a>
        </div>
    </form>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>