<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Accident</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .page-title {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            color: #007bff;
            margin: 20px 0;
        }
        .card {
            margin-top: 20px;
            border-radius: 10px;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            border-radius: 10px 10px 0 0;
            font-size: 1.25rem;
            padding: 15px;
            text-align: center;
        }
        .card-body {
            padding: 20px;
        }
        .info-section {
            margin-bottom: 20px;
        }
        .info-title {
            font-size: 1.5rem;
            color: #343a40;
            border-bottom: 2px solid #007bff;
            display: inline-block;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }
        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #e9ecef;
        }
        .info-label {
            font-weight: bold;
            color: #343a40;
            width: 40%;
        }
        .info-value {
            color: #555;
            width: 60%;
        }
        .badge {
            font-size: 1rem;
        }
        .btn-back {
            display: block;
            margin: 20px auto 0;
            width: fit-content;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="page-title">Accident Details</h1>
    <div class="card">
        <div class="card-header">
            Accident Information
        </div>
        <div class="card-body">
            <c:choose>
                <c:when test="${accident.status == 'Pending'}">
                    <div class="alert alert-warning" role="alert">
                        Data is being processed and cannot be viewed at this time.
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="info-section">
                        <div class="info-title">Accident Details</div>
                        <div class="info-row">
                            <div class="info-label">Accident ID:</div>
                            <div class="info-value">${accident.accidentID}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Customer ID:</div>
                            <div class="info-value">${accident.customerID}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Customer Name:</div>
                            <div class="info-value">${accident.customer.user.fullName}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Contract ID:</div>
                            <div class="info-value">${accident.contractID}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Accident Type:</div>
                            <div class="info-value">${accident.accidentType}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Accident Date:</div>
                            <div class="info-value">${accident.accidentDate}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Description:</div>
                            <div class="info-value">${accident.description}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Status:</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${accident.status == 'Pending'}">
                                        <span class="badge bg-warning text-dark">${accident.status}</span>
                                    </c:when>
                                    <c:when test="${accident.status == 'Rejected'}">
                                        <span class="badge bg-danger">${accident.status}</span>
                                    </c:when>
                                    <c:when test="${accident.status == 'Approved'}">
                                        <span class="badge bg-success">${accident.status}</span>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <div class="info-section">
                        <div class="info-title">User Details</div>
                        <div class="info-row">
                            <div class="info-label">User ID:</div>
                            <div class="info-value">${accident.customer.user.userID}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Username:</div>
                            <div class="info-value">${accident.customer.user.username}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Email:</div>
                            <div class="info-value">${accident.customer.user.email}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Mobile:</div>
                            <div class="info-value">${accident.customer.user.mobile}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Full Name:</div>
                            <div class="info-value">${accident.customer.user.fullName}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Gender:</div>
                            <div class="info-value">${accident.customer.user.gender}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Province:</div>
                            <div class="info-value">${accident.customer.user.province}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">District:</div>
                            <div class="info-value">${accident.customer.user.district}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Country:</div>
                            <div class="info-value">${accident.customer.user.country}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Birth Date:</div>
                            <div class="info-value">${accident.customer.user.birthDate}</div>
                        </div>
                    </div>

                    <div class="info-section">
                        <div class="info-title">Motorcycle Details</div>
                        <div class="info-row">
                            <div class="info-label">Motorcycle ID:</div>
                            <div class="info-value">${accident.contract.motorcycle.motorcycleID}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">License Plate:</div>
                            <div class="info-value">${accident.contract.motorcycle.licensePlate}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Brand:</div>
                            <div class="info-value">${accident.contract.motorcycle.brand}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Model:</div>
                            <div class="info-value">${accident.contract.motorcycle.model}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Frame Number:</div>
                            <div class="info-value">${accident.contract.motorcycle.frameNumber}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Engine Number:</div>
                            <div class="info-value">${accident.contract.motorcycle.engineNumber}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Year of Manufacture:</div>
                            <div class="info-value">${accident.contract.motorcycle.yearOfManufacture}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Color:</div>
                            <div class="info-value">${accident.contract.motorcycle.color}</div>
                        </div>
                    </div>

                    <div class="info-section">
                        <div class="info-title">Contract Details</div>
                        <div class="info-row">
                            <div class="info-label">Contract Info:</div>
                            <div class="info-value">${accident.contract.contractInfo}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Contract Status:</div>
                            <div class="info-value">${accident.contract.status}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Start Date:</div>
                            <div class="info-value">${accident.contract.startDate}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">End Date:</div>
                            <div class="info-value">${accident.contract.endDate}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Insurance Type:</div>
                            <div class="info-value">${accident.contract.insuranceType}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Coverage:</div>
                            <div class="info-value">${accident.contract.coverage}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Premium:</div>
                            <div class="info-value">${accident.contract.premium}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Detail:</div>
                            <div class="info-value">${accident.contract.detail}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Value:</div>
                            <div class="info-value">${accident.contract.value}</div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            <a href="${pageContext.request.contextPath}/accidentHistory" class="btn btn-primary btn-back">Back to Accident History</a>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>
<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
