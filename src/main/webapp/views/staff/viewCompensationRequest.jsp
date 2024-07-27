<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>
<%
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        request.getRequestDispatcher("/views/homepage/home.jsp").forward(request, response);
        return;
    }

    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
    if (userFromDB == null) {
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compensation Request Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
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

        .section-title {
            font-size: 1.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        .section-icon {
            font-size: 24px;
            margin-right: 15px;
            color: var(--primary-color);
            background-color: rgba(74, 144, 226, 0.1);
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

        .error {
            color: #e74c3c;
            background-color: #fadbd8;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            .detail-item {
                flex-direction: column;
            }

            .detail-item label {
                margin-bottom: 5px;
            }

            h1 {
                font-size: 2rem;
            }

            .section-title {
                font-size: 1.3rem;
            }
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

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
    </style>


</head>
<body>
<jsp:include page="/views/includes/header_logout.jsp"/>
<jsp:include page="/views/includes/navbar.jsp"/>
<div class="container">

    <h1><i class="fas fa-file-alt section-icon"></i>Compensation History Details</h1>

    <c:if test="${not empty error}">
        <div class="error">
            <c:out value="${error}"/>
        </div>
    </c:if>

    <c:if test="${not empty details}">
        <div class="grid-container">
            <div class="card">
                <div class="section-title">
                    <i class="fas fa-money-check-alt section-icon"></i>Compensation Information
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-fingerprint"></i> Compensation ID:</label>
                    <span>${details.compensationID}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-user"></i> Customer ID:</label>
                    <span>${details.customerID}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-dollar-sign"></i> Amount:</label>
                    <span>${details.amount}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-calendar-alt"></i> Date:</label>
                    <span><fmt:formatDate value="${details.date}" pattern="dd-MM-yyyy"/></span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-flag"></i> Status:</label>
                    <span class="status-badge ${details.status == 'Pending' ? 'status-pending' : 'status-resolved'}">${details.status}</span>
                </div>
            </div>

            <div class="card">
                <div class="section-title">
                    <i class="fas fa-user section-icon"></i>Customer Information
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-user"></i> Full Name:</label>
                    <span>${details.users.fullName}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-phone"></i> Phone:</label>
                    <span>${details.users.mobile}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-birthday-cake"></i> Date of Birth:</label>
                    <span>${details.users.birthDate}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-map-marker-alt"></i> Address:</label>
                    <span>${details.users.province}, ${details.users.district}, ${details.users.country}</span>
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
                    <span>${details.contract.contractID}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-file-alt"></i> Contract Info:</label>
                    <span>${details.contract.contractInfo}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-exclamation-circle"></i> Contract Status:</label>
                    <span>${details.contract.status}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-play"></i> Start Date:</label>
                    <span><fmt:formatDate value="${details.contract.startDate}" pattern="dd-MM-yyyy"/></span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-stop"></i> End Date:</label>
                    <span><fmt:formatDate value="${details.contract.endDate}" pattern="dd-MM-yyyy"/></span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-shield-alt"></i> Insurance Type:</label>
                    <span>${details.contract.insuranceType}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-umbrella"></i> Coverage:</label>
                    <span>${details.contract.coverage}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-dollar-sign"></i> Premium:</label>
                    <span>${details.contract.premium}</span>
                </div>
            </div>

            <div class="card">
                <div class="section-title">
                    <i class="fas fa-motorcycle section-icon"></i>Motorcycle Information
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-id-card"></i> License Plate:</label>
                    <span>${details.contract.motorcycle.licensePlate}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-motorcycle"></i> Brand:</label>
                    <span>${details.contract.motorcycle.brand}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-cogs"></i> Model:</label>
                    <span>${details.contract.motorcycle.model}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-barcode"></i> Frame Number:</label>
                    <span>${details.contract.motorcycle.frameNumber}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-engine"></i> Engine Number:</label>
                    <span>${details.contract.motorcycle.engineNumber}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-calendar-check"></i> Year of Manufacture:</label>
                    <span>${details.contract.motorcycle.yearOfManufacture}</span>
                </div>
                <div class="detail-item">
                    <label><i class="fas fa-palette"></i> Color:</label>
                    <span>${details.contract.motorcycle.color}</span>
                </div>
            </div>
        </div>
    </c:if>

    <div style="text-align: center; margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/listCompensationHistory" class="btn">
            <i class="fas fa-arrow-left"></i> Back to List
        </a>
    </div>
</div>
</body>

</html>
