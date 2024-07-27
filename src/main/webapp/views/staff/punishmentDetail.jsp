<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Punishment Detail</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            --secondary-color: #2c3e50;
            --background-color: #f0f2f5;
            --text-color: #333;
            --border-radius: 12px;
            --box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.7;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            color: var(--secondary-color);
            text-align: center;
            margin-bottom: 40px;
            font-weight: 600;
            font-size: 2.5rem;
            position: relative;
        }

        h1::after {
            content: '';
            display: block;
            width: 60px;
            height: 4px;
            background-color: #6a11cb;
            margin: 20px auto 0;
            border-radius: 2px;
        }

        .card {
            background-color: #fff;
            border-radius: var(--border-radius);
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: var(--box-shadow);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .section-title {
            font-size: 1.5rem;
            color: var(--secondary-color);
            margin-bottom: 20px;
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        .section-icon {
            font-size: 24px;
            margin-right: 15px;
            color: var(--secondary-color);
            background-color: rgba(108, 117, 125, 0.1);
            padding: 10px;
            border-radius: 50%;
        }

        .detail-item {
            display: flex;
            margin-bottom: 15px;
        }

        .detail-item label {
            font-weight: bold;
            width: 200px;
            color: var(--secondary-color);
            margin-right: 10px;
        }

        .detail-item span {
            flex: 1;
        }

        .btn {
            display: inline-block;
            background-color: var(--primary-gradient);
            color: #fff;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: var(--border-radius);
            transition: var(--transition);
            font-weight: 500;
            border: none;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9rem;
        }

        .btn:hover {
            background-color: #5a67d8;
            transform: translateY(-2px);
        }

        .btn i {
            margin-right: 8px;
        }

        .grid-container {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
        }

        @media(min-width: 768px) {
            .grid-container {
                grid-template-columns: 1fr 1fr;
            }<-->
        }
    </style>
</head>
<body>
<jsp:include page="/views/includes/header_logout.jsp"/>
<jsp:include page="/views/includes/navbar.jsp"/>
<div class="container">
    <h1><i class="fas fa-file-alt section-icon"></i>Punishment Detail</h1>

    <c:if test="${not empty error}">
        <div class="error">
            <i class="fas fa-exclamation-circle"></i> <c:out value="${error}"/>
        </div>
    </c:if>

    <c:if test="${not empty punishment}">
        <div class="grid-container">
            <div class="card">
                <div class="section-title">
                    <i class="fas fa-file-contract section-icon"></i>Punishment Information
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-fingerprint"></i> Punishment ID:</label>
                    <span>${punishment.punishmentID}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-user"></i> Customer Name:</label>
                    <span>${punishment.contract.customer.user.fullName}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-exclamation-triangle"></i> Punishment Type:</label>
                    <span>${punishment.punishmentType}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-calendar-alt"></i> Punishment Date:</label>
                    <span><fmt:formatDate value="${punishment.punishmentDate}" pattern="dd-MM-yyyy"/></span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-info-circle"></i> Description:</label>
                    <span>${punishment.description}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-flag"></i> Status:</label>
                    <span>${punishment.status}</span>
                </div>
            </div>

            <div class="card">
                <div class="section-title">
                    <i class="fas fa-user section-icon"></i>Customer Information
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-user"></i> Full Name:</label>
                    <span>${punishment.contract.customer.user.fullName}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-phone"></i> Phone:</label>
                    <span>${punishment.contract.customer.user.mobile}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-birthday-cake"></i> Date of Birth:</label>
                    <span>${punishment.contract.customer.user.birthDate}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-map-marker-alt"></i> Address:</label>
                    <span>${punishment.contract.customer.user.district}, ${punishment.contract.customer.user.province}, ${punishment.contract.customer.user.country}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-envelope"></i> Email:</label>
                    <span>${punishment.contract.customer.user.email}</span>
                </div>
            </div>
        </div>

        <div class="grid-container">
            <div class="card">
                <div class="section-title">
                    <i class="fas fa-file-contract section-icon"></i>Contract Information
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-file-contract"></i> Contract ID:</label>
                    <span>${punishment.contract.contractID}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-file-alt"></i> Contract Info:</label>
                    <span>${punishment.contract.contractInfo}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-play"></i> Start Date:</label>
                    <span><fmt:formatDate value="${punishment.contract.startDate}" pattern="dd-MM-yyyy"/></span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-stop"></i> End Date:</label>
                    <span><fmt:formatDate value="${punishment.contract.endDate}" pattern="dd-MM-yyyy"/></span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-shield-alt"></i> Insurance Type:</label>
                    <span>${punishment.contract.insuranceType}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-umbrella"></i> Coverage:</label>
                    <span>${punishment.contract.coverage}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-dollar-sign"></i> Premium:</label>
                    <span>${punishment.contract.premium}</span>
                </div>
            </div>

            <div class="card">
                <div class="section-title">
                    <i class="fas fa-motorcycle section-icon"></i>Motorcycle Information
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-id-card"></i> License Plate:</label>
                    <span>${punishment.contract.motorcycle.licensePlate}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-motorcycle"></i> Motorcycle Brand:</label>
                    <span>${punishment.contract.motorcycle.brand}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-cogs"></i> Motorcycle Model:</label>
                    <span>${punishment.contract.motorcycle.model}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-barcode"></i> Frame Number:</label>
                    <span>${punishment.contract.motorcycle.frameNumber}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-engine"></i> Engine Number:</label>
                    <span>${punishment.contract.motorcycle.engineNumber}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-calendar-check"></i> Year of Manufacture:</label>
                    <span>${punishment.contract.motorcycle.yearOfManufacture}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-palette"></i> Color:</label>
                    <span>${punishment.contract.motorcycle.color}</span>
                </div>
            </div>
        </div>
    </c:if>

    <div style="text-align: center; margin-top: 40px;">
        <a href="punishment-history" class="btn"><i class="fas fa-arrow-left"></i> Back to History</a>
    </div>
</div>
</body>
</html>
