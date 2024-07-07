<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contract Details</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .contract-details {
            text-align: center;
            margin-bottom: 20px;
        }

        .info-section {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .info-card {
            width: 48%;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .info-card h2 {
            margin-top: 0;
            background-color: #007bff;
            color: white;
            padding: 10px;
            border-radius: 5px;
        }

        .info-card p {
            margin-bottom: 5px;
        }

        .contract-details .card-body {
            background-color: #f8f9fa;
        }

        .action-buttons {
            margin-top: 20px;
        }

        .action-buttons button {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mt-4 mb-4">Contract Details</h1>
    <div class="contract-details">
        <div class="card">
            <div class="card-body">
                <p><strong>Contract ID:</strong> ${contract.contractID}</p>
                <p><strong>Customer ID:</strong> ${contract.customer.customerID}</p>
                <p><strong>Contract Info:</strong> ${contract.contractInfo}</p>
                <p><strong>Status:</strong> ${contract.status}</p>
                <p><strong>Start Date:</strong> <fmt:formatDate value="${contract.startDate}" pattern="yyyy-MM-dd"/></p>
                <p><strong>End Date:</strong> <fmt:formatDate value="${contract.endDate}" pattern="yyyy-MM-dd"/></p>
                <p><strong>Days Remaining:</strong>
                    <c:choose>
                        <c:when test="${diffDays < 0}">
                            Expired ${-diffDays} days ago
                        </c:when>
                        <c:otherwise>
                            ${diffDays} days remaining
                        </c:otherwise>
                    </c:choose>
                </p>
                <p><strong>Insurance Type:</strong> ${contract.insuranceType}</p>
                <p><strong>Coverage:</strong> ${contract.coverage}</p>
                <p><strong>Premium:</strong> ${contract.premium}</p>
                <p><strong>Cancellation Date:</strong> <fmt:formatDate value="${contract.cancellationDate}" pattern="yyyy-MM-dd"/></p>
                <p><strong>Detail:</strong> ${contract.detail}</p>
                <p><strong>Value:</strong> ${contract.value}</p>
            </div>
        </div>
    </div>

    <div class="info-section">
        <div class="info-card">
            <h2>Customer Information</h2>
            <p><strong>User ID:</strong> ${contract.customer.user.userID}</p>
            <p><strong>Username:</strong> ${contract.customer.user.username}</p>
            <p><strong>Email:</strong> ${contract.customer.user.email}</p>
            <p><strong>Mobile:</strong> ${contract.customer.user.mobile}</p>
            <p><strong>Full Name:</strong> ${contract.customer.user.fullName}</p>
            <p><strong>Gender:</strong> ${contract.customer.user.gender}</p>
            <p><strong>Province:</strong> ${contract.customer.user.province}</p>
            <p><strong>District:</strong> ${contract.customer.user.district}</p>
            <p><strong>Country:</strong> ${contract.customer.user.country}</p>
            <p><strong>First Name:</strong> ${contract.customer.user.firstName}</p>
            <p><strong>Last Name:</strong> ${contract.customer.user.lastName}</p>
            <p><strong>Birth Date:</strong> <fmt:formatDate value="${contract.customer.user.birthDate}" pattern="yyyy-MM-dd"/></p>
            <p><strong>Personal Info:</strong> ${contract.customer.personalInfo}</p>
        </div>

        <div class="info-card">
            <h2>Motorcycle Information</h2>
            <p><strong>Motorcycle ID:</strong> ${contract.motorcycle.motorcycleID}</p>
            <p><strong>License Plate:</strong> ${contract.motorcycle.licensePlate}</p>
            <p><strong>Brand:</strong> ${contract.motorcycle.brand}</p>
            <p><strong>Model:</strong> ${contract.motorcycle.model}</p>
            <p><strong>Frame Number:</strong> ${contract.motorcycle.frameNumber}</p>
            <p><strong>Engine Number:</strong> ${contract.motorcycle.engineNumber}</p>
            <p><strong>Year of Manufacture:</strong> ${contract.motorcycle.yearOfManufacture}</p>
            <p><strong>Color:</strong> ${contract.motorcycle.color}</p>
        </div>
    </div>

    <div class="d-flex justify-content-between mt-4 action-buttons">
        <button type="button" class="btn btn-primary" onclick="showRenewModal('${contract.contractID}', '${contract.customer.user.email}')">Request Renew Contract</button>
        <form id="cancelForm" action="${pageContext.request.contextPath}/cancelContract" method="post">
            <input type="hidden" name="contractId" value="${contract.contractID}">
            <input type="hidden" name="contractValue" value="${contract.value}">
            <button type="button" class="btn btn-danger" onclick="showCancelModal()">Cancel Contract</button>
        </form>
    </div>
</div>

<!-- Renew Confirmation Modal -->
<div class="modal fade" id="renewModal" tabindex="-1" aria-labelledby="renewModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="renewModalLabel">Request Renew Contract</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="renewForm" action="${pageContext.request.contextPath}/requestRenewContract" method="post">
                    <div class="mb-3">
                        <label for="renewYears" class="form-label">Number of years to renew:</label>
                        <input type="number" class="form-control" id="renewYears" name="renewYears" required>
                    </div>
                    <input type="hidden" id="customerEmail" name="customerEmail" value="">
                    <input type="hidden" id="contractId" name="contractId" value="">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary" onclick="submitRenewForm()">Yes, Renew Contract</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function showCancelModal() {
        const endDate = new Date("${contract.endDate}");
        const currentDate = new Date();
        const contractValue = ${contract.value};
        const penalty = (contractValue * 0.30).toFixed(2);

        let message = "Are you sure you want to cancel this contract?";
        if (currentDate < endDate) {
            message += "<br>You will be penalized 30% of the contract value (Penalty: $" + penalty + ").";
        }

        document.getElementById('cancelMessage').innerHTML = message;
        var cancelModal = new bootstrap.Modal(document.getElementById('cancelModal'), {});
        cancelModal.show();
    }

    function confirmCancel() {
        document.getElementById('cancelForm').submit();
    }

    function showRenewModal(contractId, customerEmail) {
        document.getElementById('contractId').value = contractId;
        document.getElementById('customerEmail').value = customerEmail;
        var renewModal = new bootstrap.Modal(document.getElementById('renewModal'), {});
        renewModal.show();
    }

    function submitRenewForm() {
        document.getElementById('renewForm').submit();
    }
</script>
</body>
</html>