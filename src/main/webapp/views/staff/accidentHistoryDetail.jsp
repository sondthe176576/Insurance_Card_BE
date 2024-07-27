<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accident Detail</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        /* CSS styles from the previous example */
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #2c3e50;
            --background-color: #f4f7f9;
            --card-background: #ffffff;
            --text-color: #333333;
            --border-radius: 12px;
            --box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Inter', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: var(--background-color);
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
            background-color: var(--primary-color);
            margin: 20px auto 0;
            border-radius: 2px;
        }

        h2 {
            color: var(--primary-color);
            padding-bottom: 10px;
            margin-top: 0;
            font-weight: 500;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
        }

        .card {
            background-color: var(--card-background);
            border-radius: var(--border-radius);
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: var(--box-shadow);
            transition: var(--transition);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .info-item {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #e0e0e0;
            padding-bottom: 10px;
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .info-item strong {
            color: var(--secondary-color);
            margin-right: 10px;
            min-width: 170px;
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        .btn {
            display: inline-block;
            background-color: var(--primary-color);
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
            background-color: #3a7bbf;
            transform: translateY(-2px);
        }

        .btn i {
            margin-right: 8px;
        }

        .section-icon {
            font-size: 24px;
            margin-right: 15px;
            color: var(--primary-color);
            background-color: rgba(74, 144, 226, 0.1);
            padding: 10px;
            border-radius: 50%;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .status-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            text-transform: uppercase;
        }

        .status-pending {
            background-color: #ffeeba;
            color: #856404;
        }

        .status-resolved {
            background-color: #d4edda;
            color: #155724;
        }
    </style>
</head>
<body>
<div class="container">
    <h1><i class="fas fa-file-alt section-icon"></i>Accident Detail</h1>

    <div class="grid-container">
        <div class="card">
            <h2><i class="fas fa-car-crash section-icon"></i>Accident Information</h2>
            <div class="info-item"><strong>Accident ID:</strong> ${accidentHistories.accidentID}</div>
            <div class="info-item"><strong>Accident Date:</strong> ${accidentHistories.date}</div>
            <div class="info-item"><strong>Accident Type:</strong> ${accidentHistories.accidentType}</div>
            <div class="info-item"><strong>Description:</strong> ${accidentHistories.description}</div>
            <div class="info-item"><strong>Status:</strong> ${accidentHistories.status}</div>
        </div>

        <div class="card">
            <h2><i class="fas fa-user section-icon"></i>Customer Information</h2>
            <div class="info-item"><strong><i class="fas fa-id-card"></i> Customer ID:</strong> ${accidentHistory.customerID}</div>
            <div class="info-item"><strong><i class="fas fa-user"></i> Full Name:</strong> ${accidentHistory.fullName}</div>
            <div class="info-item"><strong><i class="fas fa-envelope"></i> Email:</strong> ${accidentHistory.user.email}</div>
           <div class="info-item"><strong><i class="fas fa-phone"></i> Mobile:</strong> ${accidentHistory.user.mobile}</div>
          <div class="info-item"><strong><i class="fas fa-venus-mars"></i> Gender:</strong> ${accidentHistory.user.gender}</div>
           <div class="info-item"><strong><i class="fas fa-map-marker-alt"></i> Address:</strong> ${accidentHistory.user.district}, ${accidentHistory.user.province}, ${accidentHistory.user.country}</div>
           <div class="info-item"><strong><i class="fas fa-birthday-cake"></i> Birth Date:</strong> ${accidentHistory.user.birthDate}</div>
       </div>
    </div>

   <div class="grid-container">
        <div class="card">--%>
          <h2><i class="fas fa-file-contract section-icon"></i>Contract Information</h2>--%>
            <div class="info-item"><strong><i class="fas fa-file-contract"></i> Contract ID:</strong> ${accidentHistory.accident.contract.contractID}</div>
          <div class="info-item"><strong><i class="fas fa-file-alt"></i> Contract Info:</strong> ${accidentHistory.accident.contract.contractInfo}</div>
          <div class="info-item"><strong><i class="fas fa-info-circle"></i> Contract Status:</strong> ${accidentHistory.accident.contract.status}</div>
           <div class="info-item"><strong><i class="fas fa-play"></i> Start Date:</strong> ${accidentHistory.accident.contract.startDate}</div>
           <div class="info-item"><strong><i class="fas fa-stop"></i> End Date:</strong> ${accidentHistory.accident.contract.endDate}</div>
            <div class="info-item"><strong><i class="fas fa-shield-alt"></i> Insurance Type:</strong> ${accidentHistory.accident.contract.insuranceType}</div>
           <div class="info-item"><strong><i class="fas fa-umbrella"></i> Coverage:</strong> ${accidentHistory.accident.contract.coverage}</div>
            <div class="info-item"><strong><i class="fas fa-dollar-sign"></i> Premium:</strong> $${accidentHistory.accident.contract.premium}</div>
        <div class="info-item"><strong><i class="fas fa-info"></i> Detail:</strong> ${accidentHistory.accident.contract.detail}</div>--%>
          <div class="info-item"><strong><i class="fas fa-money-bill-wave"></i> Value:</strong> $${accidentHistory.accident.contract.value}</div>
        </div>

      <div class="card">--%>
            <h2><i class="fas fa-motorcycle section-icon"></i>Motorcycle Information</h2>--%>
           <div class="info-item"><strong><i class="fas fa-id-card"></i> License Plate:</strong> ${accidentHistory.accident.contract.motorcycle.licensePlate}</div>
           <div class="info-item"><strong><i class="fas fa-motorcycle"></i> Brand:</strong> ${accidentHistory.accident.contract.motorcycle.brand}</div>
            <div class="info-item"><strong><i class="fas fa-cogs"></i> Model:</strong> ${accidentHistory.accident.contract.motorcycle.model}</div>--%>
           <div class="info-item"><strong><i class="fas fa-engine"></i> Engine Number:</strong> ${accidentHistory.accident.contract.motorcycle.engineNumber}</div>
           <div class="info-item"><strong><i class="fas fa-palette"></i> Color:</strong> ${accidentHistory.accident.contract.motorcycle.color}</div>
       </div>
    </div>

    <div style="text-align: center; margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/accident-history" class="btn">
            <i class="fas fa-arrow-left"></i> Back to List
        </a>
    </div>
</div>
</body>
</html>